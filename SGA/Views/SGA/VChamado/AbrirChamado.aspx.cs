using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VChamado
{
    public partial class AbrirChamado : System.Web.UI.Page
    {
        Servico ObjServico = FactoryServico.GetNew();
        public Chamado ObjChamado = FactoryChamado.GetNew();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public bool PerfilUsr = new ManterUsuario().GetUsuariosGestOuAdm();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    using (var Servico = new ManterServico().ConsultaTpServicosDataReader())
                    {
                        DropDownListTpServico.DataSource = Servico;
                        DropDownListTpServico.DataTextField = "tipo";
                        DropDownListTpServico.DataValueField = "idTipoServ";
                        DropDownListTpServico.DataBind();
                        DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));
                    }

                    if (PerfilUsr)
                    {
                        using (var Area = new ManterAreaAtendimento().ConsultaAreaAtendimentosDataReader())
                        {
                            DropDownListAreaAtendimento.DataSource = Area;
                            DropDownListAreaAtendimento.DataTextField = "regiao";
                            DropDownListAreaAtendimento.DataValueField = "idAreaAtendimento";
                            DropDownListAreaAtendimento.DataBind();
                            DropDownListAreaAtendimento.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
                        }
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }
        protected void DropDownListTpServico_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ObjServico.Tipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);

                using (var Servico = new ManterServico(ObjServico).ConsultaServicosDataReaderByIdTp())
                {
                    DropDownListServico.DataSource = Servico;
                    DropDownListServico.DataTextField = "nome";
                    DropDownListServico.DataValueField = "idServico";
                    DropDownListServico.DataBind();
                    DropDownListServico.Items.Insert(0, new ListItem("Selecione o serviço", "0"));

                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void AbrirButton_Click(object sender, EventArgs e)
        {
            ObjUsuario.Nome = Membership.GetUser().ToString();

            try
            {
                if (PerfilUsr)
                {
                    ObjChamado.IdAreaAtendimento = Convert.ToInt32(DropDownListAreaAtendimento.SelectedValue);
                }
                else
                {
                    foreach (var ObjUsr in new ManterUsuario(ObjUsuario).ConsultaUsuarioById())
                    {
                        ObjChamado.IdAreaAtendimento = ObjUsr.IdAreaAtendimento;
                    }
                }

                ObjChamado.Assunto = AssuntoTextBox.Text;
                ObjChamado.Descricao = DescricaoTextBox.Text;
                ObjChamado.IdServico = Convert.ToInt32(DropDownListServico.SelectedValue);

                MsgLabel.Text = new ManterChamado(ObjChamado).AbreChamado();
                ObjChamado.Id = new ManterChamado().GetUltIdChamado();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
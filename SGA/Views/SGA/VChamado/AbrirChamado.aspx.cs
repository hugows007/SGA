using SGA.Models.Chamados;
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
        Chamado ObjChamado = FactoryChamado.GetNew();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

        public bool PerfilUsr = new ManterUsuario().GetUsuariosGestOuAdm();
        protected void Page_Load(object sender, EventArgs e)
        {
            MsgLabel.Text = "";

            if (!Page.IsPostBack)
            {
                DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicosDataReader();
                DropDownListTpServico.DataTextField = "tipo";
                DropDownListTpServico.DataValueField = "idTipoServ";
                DropDownListTpServico.DataBind();
                DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));

                if (PerfilUsr)
                {
                    DropDownListAreaAtendimento.DataSource = new ManterAreaAtendimento().ConsultaAreaAtendimentosDataReader();
                    DropDownListAreaAtendimento.DataTextField = "regiao";
                    DropDownListAreaAtendimento.DataValueField = "idAreaAtendimento";
                    DropDownListAreaAtendimento.DataBind();
                    DropDownListAreaAtendimento.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
                }
            }
        }
        protected void DropDownListTpServico_SelectedIndexChanged(object sender, EventArgs e)
        {
            ObjServico.Tipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);

            DropDownListServico.DataSource = new ManterServico(ObjServico).ConsultaServicosDataReaderByIdTp();
            DropDownListServico.DataTextField = "nome";
            DropDownListServico.DataValueField = "idServico";
            DropDownListServico.DataBind();
            DropDownListServico.Items.Insert(0, new ListItem("Selecione o serviço", "0"));
        }

        protected void AbrirButton_Click(object sender, EventArgs e)
        {
            ObjUsuario.Nome = Membership.GetUser().ToString();

            if (PerfilUsr)
            {
                ObjChamado.AreaAtendimento = Convert.ToInt32(DropDownListAreaAtendimento.SelectedValue);
            }
            else
            {
                foreach (var ObjUsr in new ManterUsuario(ObjUsuario).ConsultaUsuarioById())
                {
                    ObjChamado.AreaAtendimento = ObjUsr.AreaAtendimento;
                }
            }

            ObjChamado.Assunto = AssuntoTextBox.Text;
            ObjChamado.Descricao = DescricaoTextBox.Text;
            ObjChamado.Servico = Convert.ToInt32(DropDownListServico.SelectedValue);

            MsgLabel.Text = new ManterChamado(ObjChamado).AbreChamado();
        }
    }
}
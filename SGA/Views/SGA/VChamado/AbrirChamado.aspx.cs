using SGA.Models.Atendimentos;
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
        Servico ObjServico = FactoryServico.GetNewServico();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public Chamado ObjChamado;
        Atendimento ObjAtend = FactoryAtendimento.GetNew();
        public bool PerfilFunc = new ManterUsuario().GetUsuariosFunc();
        List<string> Perfis = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                    DropDownListTpServico.DataTextField = "NomeTipoServ";
                    DropDownListTpServico.DataValueField = "Id";
                    DropDownListTpServico.DataBind();
                    DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));

                    if (PerfilFunc)
                    {
                        Perfis.Add("Cliente");

                        DropDownListCliente.DataSource = new ManterUsuario(ObjUsuario).ConsultaUsuariosByPerfil(Perfis);
                        DropDownListCliente.DataTextField = "Nome";
                        DropDownListCliente.DataValueField = "Id";
                        DropDownListCliente.DataBind();
                        DropDownListCliente.Items.Insert(0, new ListItem("Selecione o cliente", "0"));
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
                ObjServico.IdTipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);

                DropDownListServico.DataSource = new ManterServico(ObjServico).ConsultaServicosByTipo();
                DropDownListServico.DataTextField = "NomeServ";
                DropDownListServico.DataValueField = "Id";
                DropDownListServico.DataBind();
                DropDownListServico.Items.Insert(0, new ListItem("Selecione o serviço", "0"));

                DropDownListPrioridade.DataSource = new ManterPrioridadeChamado().ConsultaPrioridadesChamado();
                DropDownListPrioridade.DataTextField = "DescPrioridade";
                DropDownListPrioridade.DataValueField = "Id";
                DropDownListPrioridade.DataBind();
                DropDownListPrioridade.Items.Insert(0, new ListItem("Selecione a prioridade do chamado", "0"));
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void AbrirButton_Click(object sender, EventArgs e)
        {
            ObjChamado = FactoryChamado.GetNew();
            ObjUsuario.Nome = Membership.GetUser().ToString();

            try
            {
                if (PerfilFunc)
                {
                    ObjChamado.IdCliente = Convert.ToInt32(DropDownListCliente.SelectedValue);
                    ObjChamado.IdPrioridade = Convert.ToInt32(DropDownListPrioridade.SelectedValue);
                    ObjUsuario.Id = ObjChamado.IdCliente;

                    ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                    foreach (var RegiaoUsr in new ManterUsuario(ObjUsuario).GetIdRegiaoAtendByUsr())
                    {
                        ObjAtend.IdRegiaoAtendimento = RegiaoUsr;
                    }
                }
                else
                {
                    ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();
                    ObjChamado.IdCliente = ObjUsuario.Id;

                    foreach (var RegiaoUsr in new ManterUsuario(ObjUsuario).GetIdRegiaoAtendByUsr())
                    {
                        ObjAtend.IdRegiaoAtendimento = RegiaoUsr;
                    }
                }

                ObjChamado.Assunto = AssuntoTextBox.Text;
                ObjChamado.Descricao = DescricaoTextBox.Text;
                ObjChamado.IdServico = Convert.ToInt32(DropDownListServico.SelectedValue);

                if(new ManterChamado(ObjChamado, ObjUsuario, ObjAtend).AbreChamado())
                {
                    MsgLabel.Text = "Chamado aberto com sucesso! Guarde o número de seu chamado: ";
                    ObjChamado.Id = new ManterChamado().GetUltIdChamado();
                }
            }
            catch (Exception Ex)
            {
                ObjChamado = null;
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
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
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Session["perfil"].Equals("Técnico"))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

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

                    if (!Page.IsPostBack)
                    {
                        Mensagem = "Abertura de chamado.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
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
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void AbrirButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjChamado = FactoryChamado.GetNew();
                ObjUsuario.Nome = Membership.GetUser().ToString();

                if (DropDownListTpServico.SelectedIndex > 0 && DropDownListServico.SelectedIndex > 0 && DropDownListPrioridade.SelectedIndex > 0 || PerfilFunc && DropDownListTpServico.SelectedIndex > 0 && DropDownListServico.SelectedIndex > 0 && DropDownListPrioridade.SelectedIndex > 0 && DropDownListCliente.SelectedIndex > 0)
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
                        ObjUsuario.Id = (int)Session["id"];
                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();
                        ObjChamado.IdPrioridade = Convert.ToInt32(DropDownListPrioridade.SelectedValue);
                        ObjChamado.IdCliente = ObjUsuario.Id;

                        foreach (var RegiaoUsr in new ManterUsuario(ObjUsuario).GetIdRegiaoAtendByUsr())
                        {
                            ObjAtend.IdRegiaoAtendimento = RegiaoUsr;
                        }
                    }

                    ObjChamado.Assunto = Assunto.Value;
                    ObjChamado.Descricao = Descricao.Value;
                    ObjChamado.IdServico = Convert.ToInt32(DropDownListServico.SelectedValue);

                    if (new ManterChamado(ObjChamado, ObjUsuario, ObjAtend).AbreChamado())
                    {
                        ObjChamado.Id = new ManterChamado().GetUltIdChamado();
                    }
                }
                else
                {
                    Mensagem = "Selecione as opções para abertura do chamado.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
            }
            catch (Exception Ex)
            {
                ObjChamado = null;
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
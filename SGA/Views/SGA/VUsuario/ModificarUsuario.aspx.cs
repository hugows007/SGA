using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Web.Security;
using System.Web.UI;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Mensagem = "Alteração de dados do usuário.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                        Nome.Value = ObjUsuario.Nome;
                        Endereco.Value = ObjUsuario.Endereco;
                        Telefone.Value = ObjUsuario.Telefone;
                        Complemento.Value = ObjUsuario.Complemento;
                        CEP.Value = ObjUsuario.Cep;

                        if (ObjUsuario.IdStatus.Equals(1))
                        {
                            Ausente.Text = "Ausentar usuário";
                        }
                        else if (ObjUsuario.IdStatus.Equals(4))
                        {
                            Ausente.Text = "Ativar usuário";
                        }

                        if (!string.IsNullOrWhiteSpace(Request.QueryString["Consulta"]))
                        {
                            if (Request.QueryString["Consulta"].Equals("true") && Session["perfil"].Equals("Técnico") || Session["perfil"].Equals("Técnico"))
                            {
                                Nome.Disabled = true;
                                Endereco.Disabled = true;
                                Telefone.Disabled = true;
                                Complemento.Disabled = true;
                                CEP.Disabled = true;
                                AlterarButton.Enabled = false;
                                Ausente.Enabled = false;
                                Mensagem = "Consulta de dados do cliente.";
                                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                            }
                        }
                        else if (Session["perfil"].Equals("Técnico"))
                        {
                            Nome.Disabled = true;
                            Endereco.Disabled = true;
                            Telefone.Disabled = true;
                            Complemento.Disabled = true;
                            CEP.Disabled = true;
                            AlterarButton.Enabled = false;
                            Ausente.Enabled = false;
                            Mensagem = "Consulta de dados do cliente.";
                            ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                        }
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjUsuario.Nome = Nome.Value;
                    ObjUsuario.Endereco = Endereco.Value;
                    ObjUsuario.Telefone = Telefone.Value;
                    ObjUsuario.Complemento = Complemento.Value;
                    ObjUsuario.Cep = CEP.Value;

                    if (new ManterUsuario(ObjUsuario).AlteraUsuario())
                    {
                        Mensagem = "Usuário alterado com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar o usuário";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void Ausente_Click(object sender, EventArgs e)
        {
            try
            {
                ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);
                ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                if (ObjUsuario.IdStatus.Equals(1))
                {
                    ObjUsuario.IdStatus = 4;
                }
                else if (ObjUsuario.IdStatus.Equals(4))
                {
                    ObjUsuario.IdStatus = 1;
                }

                if (new ManterUsuario(ObjUsuario).AlteraUsuarioAusente())
                {
                    if (ObjUsuario.IdStatus.Equals(1))
                    {
                        Mensagem = "Usuário agora está marcado como disponível.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else if (ObjUsuario.IdStatus.Equals(4))
                    {
                        Mensagem = "Usuário agora está marcado como ausente.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }
                else
                {
                    Mensagem = "Não foi possível alterar o usuário";
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
}
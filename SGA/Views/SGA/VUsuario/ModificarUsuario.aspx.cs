using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Web.Security;

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
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                        Nome.Value = ObjUsuario.Nome;
                        Endereco.Value = ObjUsuario.Endereco;
                        Telefone.Value = ObjUsuario.Telefone;
                        Complemento.Value = ObjUsuario.Numero;
                        CEP.Value = ObjUsuario.Cep;

                        if (!string.IsNullOrEmpty(Request.QueryString["Consulta"]))
                        {
                            if (Request.QueryString["Consulta"].Equals("true") && Session["perfil"].Equals("Técnico") || Session["perfil"].Equals("Técnico"))
                            {
                                Nome.Disabled = true;
                                Endereco.Disabled = true;
                                Telefone.Disabled = true;
                                Complemento.Disabled = true;
                                CEP.Disabled = true;
                                AlterarButton.Enabled = false;
                                Mensagem = "Consulta de dados do cliente.";
                            }
                        }
                        else if (Session["perfil"].Equals("Técnico"))
                        {
                            Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                        }
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
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
                    ObjUsuario.Numero = Complemento.Value;
                    ObjUsuario.Cep = CEP.Value;

                    if (new ManterUsuario(ObjUsuario).AlteraUsuario())
                    {
                        Mensagem = "Usuário alterado com sucesso.";
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar o usuário";
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
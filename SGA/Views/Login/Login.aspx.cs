using SGA.Models;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA
{
    public partial class Login : System.Web.UI.Page
    {
        Usuario ObjUsr;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GC.Collect();

                /*Membership.CreateUser("Admin", "123$$Abc");
                Roles.CreateRole("Administrador");
                Roles.CreateRole("Técnico");
                Roles.CreateRole("Gestor");
                Roles.CreateRole("Cliente Físico");
                Roles.CreateRole("Cliente Jurídico");
                Roles.CreateRole("Atendente");*/

            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }

        protected void BotaoEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (new Models.Login.Login().Logar(TxtLogin.Text, TxtSenha.Text))
                {
                    ObjUsr = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                    ObjUsr.Login = TxtLogin.Text;

                    List<Usuario> Usr = new List<Usuario>();
                    Usr = new ManterUsuario(ObjUsr).GetUsuarioEmpresa();

                    TxtLogin.Visible = true;

                    foreach (var U in Usr)
                    {
                        Session["id"] = U.Id;
                        Session["usuario"] = TxtLogin.Text;
                        Session["nome"] = U.Nome;
                        Session["empresa"] = U.NomeEmpresa;
                        Session["idEmpresa"] = U.IdEmpresa;

                        InfoGlobal.GlobalIdEmpresa = U.IdEmpresa;
                    }

                    FormsAuthentication.RedirectFromLoginPage(TxtLogin.Text, true);
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }
                else
                {
                    MsgLabel.Text = "Login ou senha inválidos.";
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno.";
            }
        }
    }
}
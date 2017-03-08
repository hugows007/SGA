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
        protected void Page_Load(object sender, EventArgs e)
        {
             /*Membership.CreateUser("Admin", "123$$Abc");
             Roles.CreateRole("Administrador");
             Roles.CreateRole("Técnico");
             Roles.CreateRole("Gestor");
             Roles.CreateRole("Cliente Físico");
             Roles.CreateRole("Cliente Jurídico");*/
        }

        protected void BotaoEntrar_Click(object sender, EventArgs e)
        {
            if (new Models.Login.Login().Logar(TxtLogin.Text, TxtSenha.Text))
            {
                TxtLogin.Visible = true;
                Session["user"] = User.Identity.Name;
                FormsAuthentication.RedirectFromLoginPage(TxtLogin.Text, true);
                Response.Redirect("\\Views\\SGA\\Inicio.aspx");
            }
            else
            {
                Response.Write("Invalid Login");
            }
        }
    }
}
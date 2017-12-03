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
        Usuario ObjUsuario;
        public bool EsqueciSenha;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GC.Collect();
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void BotaoEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!TxtLogin.Text.Equals("") && !TxtSenha.Text.Equals(""))
                {
                    if (ManterLogin.Logar(TxtLogin.Text, TxtSenha.Text))
                    {
                        ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                        ObjUsuario.Login = TxtLogin.Text;

                        TxtLogin.Visible = true;
                        ObjUsuario = new ManterUsuario(ObjUsuario).GetUsuarioEmpresa();
                        Session["usuario"] = TxtLogin.Text;
                        InfoGlobal.GlobalIdEmpresa = ObjUsuario.IdEmpresa;
                        FormsAuthentication.RedirectFromLoginPage(TxtLogin.Text, true);
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }
                    else
                    {
                        MsgLabel.Text = "Login ou senha inválidos.";
                    }
                }else
                {
                    MsgLabel.Text = "Login ou senha não preenchidos.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void EsqueciButton_Click(object sender, EventArgs e)
        {
            EsqueciSenha = true;
            MsgLabel.Text = "";
        }

        protected void RecuperarButton_Click(object sender, EventArgs e)
        {
            MsgLabel.Text = "";

            ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
            ObjUsuario.Email = TxtEmail.Text;

            if (new ManterUsuario(ObjUsuario).RecuperarSenha())
            {
                MsgLabel.Text = "Sua nova senha foi enviada para seu e-mail. Favor consultar sua caixa de entrada.";
            }

            else
            {
                MsgLabel.Text = "E-mail não encontrado ou é inválido. Favor rever.";
            }
        }
    }
}
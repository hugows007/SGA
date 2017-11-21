using SGA.Models;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ConsultaUsuario : System.Web.UI.Page
    {
        public List<Usuario> ListaUsrSelect = new List<Usuario>();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                Mensagem = "Usuários do sistema.";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                foreach (var ObjUsr in new ManterUsuario(ObjUsuario).ConsultaUsuarios())
                {
                    ListaUsrSelect.Add(ObjUsr);
                }

                if (Request.QueryString["OpInatUsr"] != null && Request.QueryString["OpInatUsr"].Equals("True"))
                {
                    Mensagem = "Usuário inativado com sucesso!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatUsr"] != null && Request.QueryString["OpInatUsr"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar o usuário!";
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

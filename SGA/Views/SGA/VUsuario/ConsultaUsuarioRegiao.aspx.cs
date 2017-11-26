using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ConsultaUsuarioRegiao : System.Web.UI.Page
    {
        public List<UsuarioRelacionamento> ListaUsrRegiao = new List<UsuarioRelacionamento>();
        UsuarioRelacionamento ObjUsrReg = FactoryUsuarioRegiao.GetNew();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!Page.IsPostBack)
                {
                    Mensagem = "Consulta relacionamento entre usuário e região.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }

                foreach (var ObjAT in new ManterUsuario(ObjUsrReg).ConsultaUsuarioRegiao())
                {
                    ListaUsrRegiao.Add(ObjAT);
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
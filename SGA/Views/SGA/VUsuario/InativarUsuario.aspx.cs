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
    public partial class InativarUsuario : System.Web.UI.Page
    {
        Usuario ObjUsr = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjUsr.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterUsuario(ObjUsr).InativaUsuario();
                    Response.Redirect("\\Views\\SGA\\VUsuario\\ConsultaUsuarios.aspx?OpInatUsr=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }
    }
}
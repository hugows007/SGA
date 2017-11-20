using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEmpresa
{
    public partial class InativarEmpresa : System.Web.UI.Page
    {
        Empresa ObjEmpresa = FactoryEmpresa.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (Request.QueryString["Id"] != null)
                {
                    ObjEmpresa.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterEmpresa(ObjEmpresa).InativaEmpresa();
                    Response.Redirect("\\Views\\SGA\\VEmpresa\\ConsultaEmpresas.aspx?OpInatEmpresa=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
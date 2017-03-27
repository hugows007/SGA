using SGA.Models.Cargos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VCargo
{
    public partial class InativarCargo : System.Web.UI.Page
    {
        Cargo ObjCargo = FactoryCargo.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjCargo.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterCargo(ObjCargo).InativarCargo();
                    Response.Redirect("\\Views\\SGA\\VCargos\\ConsultaCargos.aspx?OpInatCargo=" + OperInativar.ToString());
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
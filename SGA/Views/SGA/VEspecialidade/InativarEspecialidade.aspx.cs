using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class InativarEspecialidade : System.Web.UI.Page
    {
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterEspecialidade(ObjEspec).InativaEspecialidade();
                    Response.Redirect("\\Views\\SGA\\VEspecialidade\\ConsultaEspecialidades.aspx?OpInatEspecialidade=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VTipoServico
{
    public partial class InativarTipoServico : System.Web.UI.Page
    {
        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjTpServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterServico(ObjTpServico).InativaTpServico();
                    Response.Redirect("\\Views\\SGA\\VTipoServico\\ConsultaTipoServicos.aspx?OpInatTpServico=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
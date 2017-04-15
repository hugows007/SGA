using SGA.Models.AreaAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VAreaAtendimento
{
    public partial class InativarAreaAtendimento : System.Web.UI.Page
    {
        AreaAtendimento ObjArea = FactoryArea.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjArea.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterAreaAtendimento(ObjArea).InativarAreaAtendimento();
                    Response.Redirect("\\Views\\SGA\\VAreaAtendimento\\ConsultaAreaAtendimentos.aspx?OpInatArea=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }
    }
}
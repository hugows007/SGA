using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRegiaoAtendimento
{
    public partial class InativarRegiaoAtendimento : System.Web.UI.Page
    {
        RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjRegiao.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterRegiaoAtendimento(ObjRegiao).InativarRegiaoAtendimento();
                    Response.Redirect("\\Views\\SGA\\VAreaAtendimento\\ConsultaAreaAtendimentos.aspx?OpInatArea=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
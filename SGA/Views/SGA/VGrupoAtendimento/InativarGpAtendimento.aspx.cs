using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VGrupoAtendimento
{
    public partial class InativarGpAtendimento : System.Web.UI.Page
    {
        GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjGpAtend.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterGrupoAtendimento(ObjGpAtend).InativaGrupoAtendimento();
                    Response.Redirect("\\Views\\SGA\\VGrupoAtendimento\\ConsultaGpAtendimentos.aspx?OpInatGrupoAtendimento=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }
    }
}
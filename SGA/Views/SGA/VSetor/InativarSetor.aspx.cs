using SGA.Models.Manter;
using SGA.Models.Setores;
using System;

namespace SGA.Views.SGA.VSetor
{
    public partial class InativarSetor : System.Web.UI.Page
    {
        Setor ObjSetor = FactorySetor.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjSetor.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterSetor(ObjSetor).InativarSetor();
                    Response.Redirect("\\Views\\SGA\\VSetor\\ConsultaSetores.aspx?OpInatSetor=" + OperInativar.ToString());
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
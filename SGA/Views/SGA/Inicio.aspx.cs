using SGA.Models.DAO.Log;
using SGA.Models.Geos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.Site
{
    public partial class Inicio : System.Web.UI.Page
    {

        ManterChamado MntChamado = new ManterChamado();
        Geo ObjGeo = FactoryGeo.GetNew();
        public List<Geo> ListaGeo = new List<Geo>();
        public int QtdChamAbertos;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ListaGeo = new ManterGeo(ObjGeo).InformaGeo();
                QtdChamAbertos = MntChamado.GetQtdChamadosStatusAbertos();
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
using SGA.Models.DAO.Log;
using SGA.Models.Geos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VMapa
{
    public partial class Mapa : System.Web.UI.Page
    {
        string Mensagem;
        public Geo ObjGeo = FactoryGeo.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Cliente Físico") && !Session["perfil"].Equals("Cliente Jurídico") && !Session["perfil"].Equals("Técnico") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!"".Equals(Request.QueryString["IdCliente"]) && Session["perfil"].Equals("Técnico"))
                {
                    ObjGeo.IdUsr = Convert.ToInt32(Request.QueryString["IdCliente"]);
                    ObjGeo = new ManterGeo(ObjGeo).GetClienteLocalizacao();
                    Mensagem = "Localização do cliente.";
                }

                if (!"".Equals(Request.QueryString["IdTecnico"]) && Session["perfil"].Equals("Cliente Físico") || !"".Equals(Request.QueryString["IdTecnico"]) && Session["perfil"].Equals("Cliente Jurídico"))
                {
                    ObjGeo.IdUsr = Convert.ToInt32(Request.QueryString["IdTecnico"]);
                    ObjGeo = new ManterGeo(ObjGeo).GetTecnicoLocalizacao();
                    Mensagem = "Localização do técnico.";
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
using Microsoft.Reporting.WebForms;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Relatorios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRelatorio
{
    public partial class RelatorioChamados : System.Web.UI.Page
    {
        Models.Relatorios.Relatorio ObjRelatorio = FactoryRelatorio.GetNew();
        public List<Models.Relatorios.Relatorio> ListaRelatorio = new List<Models.Relatorios.Relatorio>();
        public string TipoRelatorio;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!"".Equals(Request.QueryString["Relatorio"]) && "Chamados".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioChamados();
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "SLA".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetGetRelatorioSLA();
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "TempoAtend".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioTempoAtendimento();
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "RecusaAtend".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioRecusaAtendimento();
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
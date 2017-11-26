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
        public string NomeRelatorio;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!"".Equals(Request.QueryString["Relatorio"]) && "Chamados".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioChamados();
                    NomeRelatorio = Request.QueryString["Relatorio"];
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "SLA".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetGetRelatorioSLA();
                    NomeRelatorio = Request.QueryString["Relatorio"];
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "TempoAtend".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioTempoAtendimento();
                    NomeRelatorio = "Tempo de Atendimento";
                }
                else if (!"".Equals(Request.QueryString["Relatorio"]) && "RecusaAtend".Equals(Request.QueryString["Relatorio"]))
                {
                    TipoRelatorio = Request.QueryString["Relatorio"];
                    ListaRelatorio = new ManterRelatorio(ObjRelatorio).GetRelatorioRecusaAtendimento();
                    NomeRelatorio = "Recusa de Atendimento";
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
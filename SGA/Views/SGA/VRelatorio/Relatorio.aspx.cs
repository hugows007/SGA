using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Relatorios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRelatorio
{
    public partial class Relatorio : System.Web.UI.Page
    {
        Models.Relatorios.Relatorio ObjRelatorio = FactoryRelatorio.GetNew();
        public List<Models.Relatorios.Relatorio> ListaRelatorio = new List<Models.Relatorios.Relatorio>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GerarRelatorioChamado_Click(object sender, EventArgs e)
        {
            try
            {
                if (filtrosChm.SelectedIndex == 0)
                {
                    foreach (var Itens in filtrosChm.Items)
                    {
                        ObjRelatorio.FiltroRelatorio += "and" + Itens + ", ";
                    }
                }
                if (filtrosPrioridade.SelectedIndex == 0)
                {
                    foreach (var Itens in filtrosPrioridade.Items)
                    {
                        ObjRelatorio.FiltroRelatorio += "and" + Itens + ", ";
                    }

                    //ObjRelatorio.FiltroRelatorio = filtrosPrioridade.Items[filtrosPrioridade.SelectedIndex].Text;
                }

                Response.Redirect("\\Views\\SGA\\VRelatorio\\RelatorioChamados.aspx?Relatorio=Chamados", false);
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }

        protected void GerarRelatorioSLA_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("\\Views\\SGA\\VRelatorio\\RelatorioChamados.aspx?Relatorio=SLA", false);
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }

        protected void GerarRelatorioTempo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("\\Views\\SGA\\VRelatorio\\RelatorioChamados.aspx?Relatorio=TempoAtend", false);
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
using SGA.Models.Avaliacoes;
using SGA.Models.DAO.Log;
using SGA.Models.Historicos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VHistorico
{
    public partial class Historico : System.Web.UI.Page
    {
        public Models.Historicos.Historico ObjHistorico = FactoryHistorico.GetNew();
        Avaliacao ObjAvaliacao = FactoryAvaliacao.GetNew();
        public List<Models.Historicos.Historico> ListHistorico = new List<Models.Historicos.Historico>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["perfil"].Equals("Cliente Físico") || Session["perfil"].Equals("Cliente Jurídico"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (Request.QueryString.AllKeys.Contains("IdServico"))
                {
                    if (!"".Equals(Request.QueryString["IdServico"]))
                    {
                        ObjHistorico.IdServico = Convert.ToInt32(Request.QueryString["IdServico"]);
                        ListHistorico = new ManterHistorico(ObjHistorico).GetHistorico();
                    }
                    else
                    {
                        Response.Redirect("javascript:window.history.go(-1)", false);
                    }
                }
                else if (Request.QueryString.AllKeys.Contains("IdChamado") && Request.QueryString.AllKeys.Contains("IdAtend") && Request.QueryString.AllKeys.Contains("Like"))
                {
                    if (!"".Equals(Request.QueryString["IdChamado"]) && !"".Equals(Request.QueryString["IdAtend"]) && !"".Equals(Request.QueryString["Like"]))
                    {
                        ObjAvaliacao.IdChamado = Convert.ToInt32(Request.QueryString["IdChamado"]);
                        ObjAvaliacao.IdAtend = Convert.ToInt32(Request.QueryString["IdAtend"]);
                        ObjHistorico.IdServico = Convert.ToInt32(Request.QueryString["Servico"]);
                        new ManterAvaliacao(ObjAvaliacao).IncluiAvaliacaoSolucao();
                        Response.Redirect("\\Views\\SGA\\VHistorico\\Historico.aspx?IdServico=" + ObjHistorico.IdServico, false);
                    }
                    else
                    {
                        Response.Redirect("javascript:window.history.go(-1)", false);
                    }
                }
                else
                {
                    Response.Redirect("javascript:window.history.go(-1)", false);
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
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VNotificacao
{
    public partial class Notificacoes : System.Web.UI.Page
    {
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.QueryString.Count.Equals(0))
                {
                    if (Request.QueryString["Alerta"].Equals("LimparChat") && Request.QueryString["Id"] != null)
                    {
                        ObjNotificacao.IdOrigem = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjNotificacao.Mensagem = "LimparChat";
                        new ManterNotificacao(ObjNotificacao).AtualizaNotificacao();
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    if (Request.QueryString["Alerta"].Equals("Chat") && Request.QueryString["Id"] != null)
                    {
                        ObjNotificacao.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        new ManterNotificacao(ObjNotificacao).AtualizaNotificacao();
                        Response.Redirect("\\Views\\SGA\\VChat\\Chat.aspx", false);
                    }
                    if (Request.QueryString["Alerta"].Equals("ChatPrivado") && Request.QueryString["Id"] != null)
                    {
                        ObjNotificacao.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        new ManterNotificacao(ObjNotificacao).AtualizaNotificacao();
                        Response.Redirect("\\Views\\SGA\\VChat\\ChatPrivado.aspx", false);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }

        }
    }
}
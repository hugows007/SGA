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
                    if (Request.QueryString["Alerta"].Equals("Chat") && Request.QueryString["Id"] != null)
                    {
                        ObjNotificacao.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        new ManterNotificacao(ObjNotificacao).AtualizaNotificacao();
                        Response.Redirect("\\Views\\SGA\\VChat\\Chat.aspx", false);
                    }
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }

        }
    }
}
using SGA.Models.Atendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VChamado
{
    public partial class AlterarTecnico : System.Web.UI.Page
    {
        Atendimento ObjAtend = FactoryAtendimento.GetNew();
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!Request.QueryString["Chamado"].Equals("") && !Request.QueryString["TecnicoAntigo"].Equals("") && !Request.QueryString["TecnicoNovo"].Equals(""))
                {
                    ObjAtend.IdChamado = Convert.ToInt32(Request.QueryString["Chamado"]);
                    ObjAtend.IdTecnico = Convert.ToInt32(Request.QueryString["TecnicoNovo"]);

                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = Convert.ToInt32(Request.QueryString["TecnicoNovo"]);
                    ObjNotificacao.IdMensagem = 11;
                    ObjNotificacao.IdTipo = 4;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    if (new ManterAtendimento(ObjAtend).AlterarTecnicoAtendimento())
                    {
                        Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjAtend.IdChamado + "&Troca=true", false);
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
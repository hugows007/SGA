using SGA.Models.Atendimentos;
using SGA.Models.Avaliacoes;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VAvaliacao
{
    public partial class Avaliacao : System.Web.UI.Page
    {
        public Atendimento ObjAtend = FactoryAtendimento.GetNew();
        public Models.Avaliacoes.Avaliacao ObjAvaliacao = FactoryAvaliacao.GetNew();
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Cliente Físico") && !Session["perfil"].Equals("Cliente Jurídico") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (Request.QueryString["IdChamado"] != null)
                {
                    ObjAtend.IdChamado = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();

                    if (!ObjAtend.IdCliente.Equals(Session["id"]))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    Mensagem = "Favor selecionar a nota.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void AvaliarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjAvaliacao.IdChamado = ObjAtend.IdChamado;
                ObjAvaliacao.IdAtend = ObjAtend.Id;
                ObjAvaliacao.AvaAtend = RatingAtendimento.CurrentRating;
                ObjAvaliacao.AvaChamado = RatingChamado.CurrentRating;
                ObjAvaliacao.Comentario = Comentario.Value;

                if (new ManterAvaliacao(ObjAvaliacao).IncluiAvaliacao())
                {
                    Mensagem = "Avaliado com sucesso!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else
                {
                    Mensagem = "Ocorreu um erro ao avaliar.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
            }
            catch (System.Data.SqlClient.SqlException)
            {
                Mensagem = "Este chamado já foi avaliado.";
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
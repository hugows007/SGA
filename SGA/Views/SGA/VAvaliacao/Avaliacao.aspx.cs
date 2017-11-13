﻿using SGA.Models.Atendimentos;
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
                if (Request.QueryString["IdChamado"] != null)
                {
                    ObjAtend.IdChamado = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();
                    Mensagem = "Favor selecionar a nota.";
                }
                else
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
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
                }
                else
                {
                    Mensagem = "Ocorreu um erro ao avaliar.";
                }
            }
            catch (System.Data.SqlClient.SqlException Ex)
            {
                Mensagem = "Este chamado já foi avaliado.";
                LogException.InsereLogBd(Ex);
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
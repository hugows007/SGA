﻿using SGA.Models.RegiaoAtendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using SGA.Models.Chamados.StatusChamados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGA.Models.Atendimentos;
using SGA.Models.Usuarios;

namespace SGA.Views.SGA.VChamado
{
    public partial class ListaChamados : System.Web.UI.Page
    {
        public List<Chamado> ListaChamado = new List<Chamado>();
        public List<string> NomeServico = new List<string>();
        public List<string> NomeStatus = new List<string>();
        public List<string> NomeTecnico = new List<string>();
        string Mensagem;
        public string MensagemTela;

        Chamado ObjChamado = FactoryChamado.GetNew();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        Atendimento ObjAtend = FactoryAtendimento.GetNew();
        Servico ObjServico = FactoryServico.GetNewServico();
        StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Mensagem = "Consulta de chamados.";
                MensagemTela = Mensagem;

                if (!"".Equals(Request.QueryString["IdTecnico"]) && Session["perfil"].Equals("Técnico"))
                {
                    ObjUsuario.Id = Convert.ToInt32(Request.QueryString["IdTecnico"]);
                    Mensagem = "Histórico de atendimentos.";
                    MensagemTela = Mensagem;
                }

                if ("true".Equals(Request.QueryString["Fila"]))
                {
                    ObjChamado.Fila = true;
                    Mensagem = "Fila de atendimento.";
                    MensagemTela = Mensagem;
                }
                else
                {
                    ObjChamado.Fila = false;
                }
                if (Session["perfil"].Equals("Cliente Físico") || Session["perfil"].Equals("Cliente Jurídico"))
                {
                    ObjUsuario.Id = Convert.ToInt32(Session["id"]);
                    ObjUsuario.Perfil = "Cliente";
                    Mensagem = "Lista de seus chamados e seus respectivos atendimentos.";
                    MensagemTela = Mensagem;
                }

                foreach (var Result in new ManterChamado(ObjChamado, ObjUsuario).ConsultaChamados())
                {
                    ObjServico.Id = Result.IdServico;
                    ObjStatusChm.Id = Result.IdStatus;
                    ObjAtend.IdChamado = Result.Id;

                    foreach (var Tecnico in new ManterAtendimento(ObjAtend, ObjUsuario).ConsultaTecnicoAtendByChamado())
                    {
                        NomeTecnico.Add(Tecnico.Nome);
                        NomeServico.Add(new ManterServico(ObjServico).ConsultaServicoById().NomeServ);
                        NomeStatus.Add(new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById().NomeStatus);
                        ListaChamado.Add(Result);
                    }
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
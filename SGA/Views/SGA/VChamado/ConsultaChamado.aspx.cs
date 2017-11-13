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
using SGA.Models.Chamados.PrioridadeChamados;
using System.Web.Security;

namespace SGA.Views.SGA.VChamado
{
    public partial class ConsultaChamado : System.Web.UI.Page
    {
        public Chamado ObjChamado;
        public RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        public PrioridadeChamado ObjPrioridade = FactoryPrioridadeChm.GetNew();
        public Servico ObjServico = FactoryServico.GetNewServico();
        public StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();
        public Atendimento ObjAtend = FactoryAtendimento.GetNew();
        public Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

        public string Mensagem;

        public string NomeCliente;
        public string NomeTecnico;
        public bool CancButtonClick;
        public bool EnceButtonClick;
        public bool PendBox;
        public bool TramiteClick;
        public bool RecusarClick;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!"".Equals(Request.QueryString["IdChamado"]))
                {
                    ObjChamado = FactoryChamado.GetNew();
                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjChamado = new ManterChamado(ObjChamado).ConsultaChamadoById();

                    if (ObjChamado != null)
                    {
                        ObjServico.Id = ObjChamado.IdServico;
                        ObjStatusChm.Id = ObjChamado.IdStatus;
                        ObjAtend.IdChamado = ObjChamado.Id;

                        ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();
                        ObjRegiao.Id = ObjAtend.IdRegiaoAtendimento;

                        ObjUsuario.Id = ObjAtend.IdTecnico;

                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();
                        NomeTecnico = ObjUsuario.Nome;

                        ObjUsuario.Id = ObjAtend.IdCliente;

                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();
                        NomeCliente = ObjUsuario.Nome;

                        ObjPrioridade.Id = ObjChamado.IdPrioridade;

                        ObjPrioridade = new ManterPrioridadeChamado(ObjPrioridade).ConsultaPrioridadeChamadoById();
                        ObjRegiao = new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentoById();
                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();
                        ObjStatusChm = new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById();

                        if (new ManterChamado(ObjChamado).ValidaTempoFechamento())
                        {
                            AvaliarChamadoButton.Enabled = true;
                            ReaberturaButton.Enabled = true;
                        }
                        else
                        {
                            AvaliarChamadoButton.Enabled = false;
                            ReaberturaButton.Enabled = false;
                        }
                    }
                    else
                    {
                        ObjChamado = null;
                        Mensagem = "Chamado não encontrado ou inexistente.";
                    }
                }
                else
                {
                    Mensagem = "Nenhum número de chamado foi informado.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                ObjChamado = null;
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void CancelarButton_Click(object sender, EventArgs e)
        {
            try
            {
                CancButtonClick = true;

                if (!DescCancel.Value.Equals(""))
                {
                    ObjAtend = FactoryAtendimento.GetNew();
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend.IdChamado = ObjChamado.Id;
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();

                    ObjChamado.InfoCancelamento = DescCancel.Value;

                    if (new ManterChamado(ObjChamado, ObjAtend).CancelaChamado())
                    {
                        Mensagem = "Chamado cancelado com sucesso.";
                        Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjChamado.Id, false);
                    }
                    else
                    {
                        Mensagem = "Ocorreu um problema no cancelamento do chamado.";
                    }
                }
                else
                {
                    Mensagem = "Informe o motivo do cancelamento.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                ObjChamado = null;
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void Encerrar_Click(object sender, EventArgs e)
        {
            try
            {
                EnceButtonClick = true;

                if (!EnceRelat.Value.Equals(""))
                {
                    ObjAtend = FactoryAtendimento.GetNew();
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend.IdChamado = ObjChamado.Id;
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();

                    ObjAtend.Relatorio = EnceRelat.Value;

                    if (CheckBoxPend.Checked && !PendRelat.Value.Equals(""))
                    {
                        ObjChamado.Pendencia = true;
                        ObjChamado.InfoPendencia = PendRelat.Value;

                        if (new ManterAtendimento(ObjAtend, ObjChamado).EncerraAtendimento())
                        {
                            Mensagem = "Chamado encerrado com sucesso.";
                            Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjChamado.Id, false);
                        }
                        else
                        {
                            Mensagem = "Ocorreu um problema no encerramento do chamado.";
                        }
                    }
                    else
                    {
                        Mensagem = "Informe as pendências.";
                    }

                    if (!CheckBoxPend.Checked)
                    {
                        if (new ManterAtendimento(ObjAtend, ObjChamado).EncerraAtendimento())
                        {
                            Mensagem = "Chamado encerrado com sucesso.";
                            Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjChamado.Id, false);
                        }
                        else
                        {
                            Mensagem = "Ocorreu um problema no encerramento do chamado.";
                        }
                    }
                }
                else
                {
                    Mensagem = "Informe o relatório do atendimento.";
                }

            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                ObjChamado = null;
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void CheckBoxPend_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (CheckBoxPend.Checked)
                {
                    PendBox = true;
                    EnceButtonClick = true;
                    CancButtonClick = false;
                }
                else
                {
                    PendBox = false;
                    EnceButtonClick = true;
                    CancButtonClick = false;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                ObjChamado = null;
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void AvaliarButton_Click(object sender, EventArgs e)
        {
            if (AvaliarChamadoButton.Enabled == true)
            {
                Response.Redirect("\\Views\\SGA\\VAvaliacao\\Avaliacao.aspx?IdChamado=" + ObjChamado.Id);
            }
        }

        protected void Historico_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Views\\SGA\\VHistorico\\Historico.aspx?IdServico=" + ObjChamado.IdServico);
        }

        protected void Tramite_Click(object sender, EventArgs e)
        {
            try
            {
                TramiteClick = true;

                if (!TramiteTextBox.Value.Equals(""))
                {
                    ObjChamado.Tramite = "  " + DateTime.Now + " " + Membership.GetUser() + ": " + TramiteTextBox.Value;
                    new ManterChamado(ObjChamado).AtualizaTramite();
                    Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjChamado.Id, false);
                    Mensagem = "Trâmite adicionado com sucesso.";
                }
                else
                {
                    Mensagem = "Digite alguma informação para adicionar ao chamado.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void ReaberturaButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (new ManterChamado(ObjChamado, ObjAtend).ReabreChamado())
                {
                    Mensagem = "Chamado reaberto com sucesso.";
                }
                else
                {
                    Mensagem = "Digite alguma informação.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void ConsultarClienteButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Views\\SGA\\VUsuario\\ModificarUsuario.aspx?Id=" + ObjChamado.IdCliente + "&Consulta=true");
        }

        protected void Recusar_Click(object sender, EventArgs e)
        {
            RecusarClick = true;

            try
            {
                if (!RecusarMotivo.Value.Equals(""))
                {
                    if (new ManterAtendimento(ObjAtend, ObjChamado).RecusaAtendimentoChamado())
                    {
                        Mensagem = "Atendimento deste chamado recusado.";
                    }
                    else
                    {
                        Mensagem = "Ocorreu um problema ao recusar o atendimento deste chamado.";
                    }
                }
                else
                {
                    Mensagem = "Justifique o motivo de recusar o atendimento deste chamado.";
                }

            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
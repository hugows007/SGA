using SGA.Models.RegiaoAtendimentos;
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

        public string NomeCliente;
        public string NomeTecnico;
        public bool CancButtonClick;
        public bool EnceButtonClick;
        public bool PendBox;
        public bool TramiteClick;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Request.Form["Master$IdChamado"] != null -- Capturar post da página master para a página atual
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

                        if (ObjStatusChm.Id.Equals(5))
                        {
                            MotCancelDescTextBox.Text = ObjChamado.InfoCancelamento;
                        }

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
                        MsgLabel.Text = "Chamado não encontrado ou inexistente.";
                    }
                }
                else
                {
                    MsgLabel.Text = "Nenhum número de chamado foi informado.";
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

                if (!DescCancelTextBox.Text.Equals(""))
                {
                    ObjAtend = FactoryAtendimento.GetNew();
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend.IdChamado = ObjChamado.Id;
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();

                    ObjChamado.InfoCancelamento = DescCancelTextBox.Text;

                    if (new ManterChamado(ObjChamado, ObjAtend).CancelaChamado())
                    {
                        MsgLabel.Text = "Chamado cancelado com sucesso.";
                    }
                    else
                    {
                        MsgLabel.Text = "Ocorreu um problema no cancelamento do chamado.";
                    }
                }
                else
                {
                    MsgLabel.Text = "Informe o motivo do cancelamento.";
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

                if (!EnceRelatTextBox.Text.Equals(""))
                {
                    ObjAtend = FactoryAtendimento.GetNew();
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend.IdChamado = ObjChamado.Id;
                    ObjAtend = new ManterAtendimento(ObjAtend).ConsultaAtendimentoByIdChamado();

                    ObjAtend.Relatorio = EnceRelatTextBox.Text;

                    if (CheckBoxPend.Checked && !PendRelatTextBox.Text.Equals(""))
                    {
                        ObjChamado.Pendencia = true;
                        ObjChamado.InfoPendencia = PendRelatTextBox.Text;

                        if (new ManterAtendimento(ObjAtend, ObjChamado).EncerraAtendimento())
                        {
                            MsgLabel.Text = "Chamado encerrado com sucesso.";
                        }
                        else
                        {
                            MsgLabel.Text = "Ocorreu um problema no encerramento do chamado.";
                        }
                    }
                    else
                    {
                        MsgLabel.Text = "Informe as pendências.";
                    }

                    if (!CheckBoxPend.Checked)
                    {
                        if (new ManterAtendimento(ObjAtend, ObjChamado).EncerraAtendimento())
                        {
                            MsgLabel.Text = "Chamado encerrado com sucesso.";
                        }
                        else
                        {
                            MsgLabel.Text = "Ocorreu um problema no encerramento do chamado.";
                        }
                    }
                }
                else
                {
                    MsgLabel.Text = "Informe o relatório do atendimento.";
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

        protected void AvaliarButton_Click(object sender, EventArgs e)
        {
            if(AvaliarChamadoButton.Enabled == true)
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
                    ObjChamado.Tramite = "  " + DateTime.Now + ": " + TramiteTextBox.Value;
                    new ManterChamado(ObjChamado).AtualizaTramite();
                }
                else
                {
                    MsgLabel.Text = "Digite alguma informação.";
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
                    MsgLabel.Text = "Chamado reaberto com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Digite alguma informação.";
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
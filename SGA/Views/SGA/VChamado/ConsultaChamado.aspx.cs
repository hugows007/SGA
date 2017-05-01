using SGA.Models.RegiaoAtendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using SGA.Models.StatusChamados;
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
    public partial class ConsultaChamado : System.Web.UI.Page
    {
        public Chamado ObjChamado;
        public RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        public Servico ObjServico = FactoryServico.GetNewServico();
        public StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();
        public Atendimento ObjAtend = FactoryAtendimento.GetNew();
        public Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public string NomeCliente;
        public string NomeTecnico;

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

                        ObjRegiao = new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentoById();
                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();
                        ObjStatusChm = new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById();
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
                new LogException(Ex).InsereLogBd();
                ObjChamado = null;
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
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

namespace SGA.Views.SGA.VChamado
{
    public partial class ConsultaChamado : System.Web.UI.Page
    {
        public Chamado ObjChamado = null;
        public RegiaoAtendimento ObjArea = FactoryRegiao.GetNew();
        public Servico ObjServico = FactoryServico.GetNewServico();
        public StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();

        ManterChamado MChamado;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Request.Form["Master$IdChamado"] != null -- Capturar post da página master para a página atual
            try
            {
                if (!"".Equals(Request.QueryString["IdChamado"]))
                {
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    MChamado = new ManterChamado(ObjChamado);
                    ObjChamado = MChamado.ConsultaChamadoById();

                    if (ObjChamado != null)
                    {
                        //ObjArea.Id = ObjChamado.IdAreaAtendimento;
                        ObjServico.Id = ObjChamado.IdServico;
                        ObjStatusChm.Id = ObjChamado.IdStatus;

                        ObjArea = new ManterRegiaoAtendimento(ObjArea).ConsultaRegiaoAtendimentoById();
                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();
                        ObjStatusChm = new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById();
                    }
                    else
                    {
                        ObjChamado = null;
                    }

                    MsgLabel.Text = MChamado.Msg;
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
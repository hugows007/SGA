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

namespace SGA.Views.SGA.VChamado
{
    public partial class ListaChamados : System.Web.UI.Page
    {
        public List<Chamado> ListaChamado = new List<Chamado>();
        public List<string> NomeAreaAtendimento = new List<string>();
        public List<string> NomeServico = new List<string>();
        public List<string> NomeStatus = new List<string>();

        Chamado ObjChamado = FactoryChamado.GetNew();
        RegiaoAtendimento ObjArea = FactoryRegiao.GetNew();
        Servico ObjServico = FactoryServico.GetNewServico();
        StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var Result in new ManterChamado(ObjChamado).ConsultaChamados())
                {
                    //ObjArea.Id = Result.IdAreaAtendimento;
                    ObjServico.Id = Result.IdServico;
                    ObjStatusChm.Id = Result.IdStatus;

                    NomeAreaAtendimento.Add(new ManterRegiaoAtendimento(ObjArea).ConsultaRegiaoAtendimentoById().Regiao);
                    NomeServico.Add(new ManterServico(ObjServico).ConsultaServicoById().NomeServ);
                    NomeStatus.Add(new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById().NomeStatus);
                    ListaChamado.Add(Result);
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
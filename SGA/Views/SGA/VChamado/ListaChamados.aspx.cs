using SGA.Models.AreaAtendimentos;
using SGA.Models.Chamados;
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
    public partial class ListaChamados : System.Web.UI.Page
    {
        public List<Chamado> ListaChamado = new List<Chamado>();
        public List<string> NomeAreaAtendimento = new List<string>();
        public List<string> NomeServico = new List<string>();
        public List<string> NomeStatus = new List<string>();

        Chamado ObjChamado = FactoryChamado.GetNew();
        AreaAtendimento ObjArea = FactoryArea.GetNew();
        Servico ObjServico = FactoryServico.GetNew();
        StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (var Result in new ManterChamado(ObjChamado).ConsultaChamados())
            {
                ObjArea.Id = Result.AreaAtendimento;
                ObjServico.Id = Result.Servico;
                ObjStatusChm.Id = Result.Status;

                NomeAreaAtendimento.Add(new ManterAreaAtendimento(ObjArea).ConsultaAreaAtendimentoById().Regiao);
                NomeServico.Add(new ManterServico(ObjServico).ConsultaServicoById().Nome);
                NomeStatus.Add(new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById().NomeStatus);
                ListaChamado.Add(Result);
            }
        }
    }
}
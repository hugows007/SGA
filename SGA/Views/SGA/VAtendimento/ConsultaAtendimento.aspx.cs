using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.Chamados.StatusChamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.RegiaoAtendimentos;
using SGA.Models.Servicos;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VAtendimento
{
    public partial class ConsultaAtendimento : System.Web.UI.Page
    {
        public List<Chamado> ListaChamado = new List<Chamado>();
        public List<string> NomeAreaAtendimento = new List<string>();
        public List<string> NomeServico = new List<string>();
        public List<string> NomeStatus = new List<string>();

        Chamado ObjChamado = FactoryChamado.GetNew();
        Usuario ObjCliente = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        Atendimento ObjAtend = FactoryAtendimento.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ObjAtend.IdTecnico = (int)(Session["id"]);

                foreach (var Result in new ManterAtendimento(ObjAtend).ConsultaAtendimentos())
                {
                    ObjChamado.Id = Result.IdChamado;
                    ObjCliente.Id = Result.IdCliente;

                    //NomeAreaAtendimento.Add(new ManterRegiaoAtendimento(ObjArea).ConsultaRegiaoAtendimentoById().Regiao);
                    //NomeServico.Add(new ManterServico(ObjServico).ConsultaServicoById().NomeServ);
                    //NomeStatus.Add(new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById().NomeStatus);
                    //ListaChamado.Add(Result);
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
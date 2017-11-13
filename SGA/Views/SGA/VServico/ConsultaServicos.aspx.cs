using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VServico
{
    public partial class ConsultaServicos : System.Web.UI.Page
    {
        public List<Servico> ListaServicoSelect = new List<Servico>();
        public List<string> NomeServico = new List<string>();

        Servico ObjServico = FactoryServico.GetNewServico();
        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Mensagem = "Consulta de serviços.";

                foreach (var Result in new ManterServico().ConsultaServicos())
                {
                    ObjTpServico.Id = Result.IdTipo;
                    NomeServico.Add(new ManterServico(ObjServico, ObjTpServico).ConsultaTpServicoById().NomeTipoServ);
                    ListaServicoSelect.Add(Result);
                }

                if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("True"))
                {
                    Mensagem = "Serviço inativado com sucesso.";
                }
                else if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar o serviço.";
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
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
        public string NomeServico;

        Servico ObjServico = FactoryServico.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (var ObjAT in new ManterServico(ObjServico).ConsultaServicos())
            {
                NomeServico = new ManterServico(ObjAT).ConsultaTpServicoById();
                ListaServicoSelect.Add(ObjAT);
            }

            if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("True"))
            {
                MsgLabel.Text = "Serviço inativado com sucesso!";
            }
            else if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("False"))
            {
                MsgLabel.Text = "Ocorreu um erro ao inativar o serviço!";
            }
        }
    }
}
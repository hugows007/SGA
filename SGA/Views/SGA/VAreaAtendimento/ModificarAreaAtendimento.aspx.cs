using SGA.Models.AreaAtendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VAreaAtendimento
{
    public partial class ModificarAreaAtendimento : System.Web.UI.Page
    {
        AreaAtendimento ObjArea = FactoryArea.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjArea.Id = Convert.ToInt32(Request.QueryString["Id"]);

                    ObjArea = new ManterAreaAtendimento(ObjArea).ConsultaAreaAtendimentoById();

                    RegiaoTextBox.Text = ObjArea.Regiao;
                    CidadeTextBox.Text = ObjArea.Cidade;
                    EstadoTextBox.Text = ObjArea.Estado;
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjArea.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjArea.Regiao = RegiaoTextBox.Text;
                    ObjArea.Cidade = CidadeTextBox.Text;
                    ObjArea.Estado = EstadoTextBox.Text;

                    MsgLabel.Text = new ManterAreaAtendimento(ObjArea).AlteraAreaAtendimento();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao alterar - Código 1";
            }
        }
    }
}
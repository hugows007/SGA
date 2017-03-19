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
    public partial class CadastroAreaAtendimento : System.Web.UI.Page
    {
        public string Msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                AreaAtendimento ObjArea = FactoryArea.GetNew();
                ObjArea.Regiao = RegiaoTextBox.Text;
                ObjArea.Cidade = CidadeTextBox.Text;
                ObjArea.Estado = EstadoTextBox.Text;

                Msg = new ManterAreaAtendimento(ObjArea).CadastraAreaAtendimento();
            }
            catch (Exception)
            {
                Msg = "Erro ao efetuar o cadastro - Código 1";
            }
        }
    }
}
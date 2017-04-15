using SGA.Models.AreaAtendimentos;
using SGA.Models.DAO.Log;
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

                MsgLabel.Text = new ManterAreaAtendimento(ObjArea).CadastraAreaAtendimento();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
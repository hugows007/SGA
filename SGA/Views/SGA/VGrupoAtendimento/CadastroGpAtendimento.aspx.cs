using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VGrupoAtendimento
{
    public partial class CadastroGpAtendimento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
                ObjGpAtend.NomeGpAtendimento = NomeGpTextBox.Text;
                ObjGpAtend.DescGpAtendimento = DescGpTextBox.Text;

                MsgLabel.Text = new ManterGrupoAtendimento(ObjGpAtend).CadastraGrupoAtendimento();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
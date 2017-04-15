using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Setores;
using System;

namespace SGA.Views.SGA.VSetor
{
    public partial class CadastroSetor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Setor ObjSetor = FactorySetor.GetNew();
                ObjSetor.SetorDesc = SetorTextBox.Text;

                MsgLabel.Text = new ManterSetor(ObjSetor).CadastraSetor();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
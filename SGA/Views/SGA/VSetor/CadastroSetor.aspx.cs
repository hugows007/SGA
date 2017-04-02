using SGA.Models.Manter;
using SGA.Models.Setores;
using System;

namespace SGA.Views.SGA.VSetor
{
    public partial class CadastroSetor : System.Web.UI.Page
    {
        public string Msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Setor ObjSetor = FactorySetor.GetNew();
                ObjSetor.SetorDesc = SetorTextBox.Text;

                Msg = new ManterSetor(ObjSetor).CadastraSetor();
            }
            catch (Exception)
            {
                Msg = "Erro ao efetuar o cadastro - Código 1";
            }

            MsgLabel.Text = Msg;
        }
    }
}
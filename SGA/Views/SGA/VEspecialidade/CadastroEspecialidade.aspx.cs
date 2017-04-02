using SGA.Models.Especialidades;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class CadastroEspecialidade : System.Web.UI.Page
    {
        public string Msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidade ObjEspec = FactoryEspecialidade.GetNew();
                ObjEspec.EspecialidadeDesc = EspecTextBox.Text;
                ObjEspec.DetalheEspec = EspecDestTextBox.Text;

                Msg = new ManterEspecialidade(ObjEspec).CadastraEspecialidade();
            }
            catch (Exception)
            {
                Msg = "Erro ao efetuar o cadastro - Código 1";
            }

            MsgLabel.Text = Msg;
        }
    }
}
using SGA.Models.Cargos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VCargo
{
    public partial class CadastroCargo : System.Web.UI.Page
    {
        public string Msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Cargo ObjCargo = FactoryCargo.GetNew();
                ObjCargo.CargoDesc = CargoDescTextBox.Text;
                ObjCargo.Salario = Convert.ToDecimal(SalarioTextBox.Text);

                Msg = new ManterCargo(ObjCargo).CadastraCargo();
            }
            catch (Exception)
            {
                Msg = "Erro ao efetuar o cadastro - Código 1";
            }

            MsgLabel.Text = Msg;
        }
    }
}
using SGA.Models.Cargos;
using SGA.Models.DAO.Log;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Cargo ObjCargo = FactoryCargo.GetNew();
                ObjCargo.NomeCargo = CargoDescTextBox.Text;
                ObjCargo.Salario = Convert.ToDecimal(SalarioTextBox.Text);

                MsgLabel.Text = new ManterCargo(ObjCargo).CadastraCargo();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
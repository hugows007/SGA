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
    public partial class ConsultaCargos : System.Web.UI.Page
    {
        public List<Cargo> ListaCargoSelect = new List<Cargo>();
        Cargo ObjCargo = FactoryCargo.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjAT in new ManterCargo(ObjCargo).ConsultaCargos())
                {
                    ListaCargoSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatCargo"] != null && Request.QueryString["OpInatCargo"].Equals("True"))
                {
                    MsgLabel.Text = "Cargo inativado com sucesso!";
                }
                else if (Request.QueryString["OpInatCargo"] != null && Request.QueryString["OpInatCargo"].Equals("False"))
                {
                    MsgLabel.Text = "Ocorreu um erro ao inativar o cargo!";
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
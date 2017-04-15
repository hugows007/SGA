﻿using SGA.Models.Cargos;
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
    public partial class ModificarCargo : System.Web.UI.Page
    {
        Cargo ObjCargo = FactoryCargo.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjCargo.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        foreach (var Result in new ManterCargo(ObjCargo).ConsultaCargosById())
                        {
                            CargoDescTextBox.Text = Result.CargoDesc;
                            SalarioTextBox.Text = Result.Salario.ToString();
                        }
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjCargo.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjCargo.CargoDesc = CargoDescTextBox.Text;
                    ObjCargo.Salario = Convert.ToDecimal(SalarioTextBox.Text);

                    MsgLabel.Text = new ManterCargo(ObjCargo).AlteraCargo();
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
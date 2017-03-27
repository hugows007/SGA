﻿using SGA.Models.Cargos;
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
            foreach (var ObjAT in new ManterCargo(ObjCargo).ConsultaCargos())
            {
                ListaCargoSelect.Add(ObjAT);
            }

            if (Request.QueryString["OpInatCargo"] != null && Request.QueryString["OpInatCargo"].Equals("True"))
            {
                MsgLabel.Text = "Cargo inativado com sucesso!";
            }
        }
    }
}
﻿using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VServico
{
    public partial class InativarServico : System.Web.UI.Page
    {
        Servico ObjServico = FactoryServico.GetNewServico();
        protected void Page_Load(object sender, EventArgs e)
        {
            bool OperInativar = false;

            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (Request.QueryString["Id"] != null)
                {
                    ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    OperInativar = new ManterServico(ObjServico).InativaServico();
                    Response.Redirect("\\Views\\SGA\\VServico\\ConsultaServicos.aspx?OpInatServico=" + OperInativar.ToString());
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
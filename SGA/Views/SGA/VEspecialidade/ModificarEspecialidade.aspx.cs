﻿using SGA.Models.DAO.Log;
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
    public partial class ModificarEspecialidade : System.Web.UI.Page
    {
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjEspec = new ManterEspecialidade(ObjEspec).ConsultaEspecialidadeById();

                        EspecTextBox.Text = ObjEspec.NomeEspec;
                        EspecDestTextBox.Text = ObjEspec.DescEspec;
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjEspec.NomeEspec = EspecTextBox.Text;
                    ObjEspec.DescEspec = EspecDestTextBox.Text;

                    if(new ManterEspecialidade(ObjEspec).AlteraEspecialidade())
                    {
                        MsgLabel.Text = "Especialidade alterada com sucesso.";
                    }
                    else
                    {
                        MsgLabel.Text = "Não foi possível alterar a especialidade.";
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
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
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Mensagem = "Alteração de informações da especialidade.";

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjEspec = new ManterEspecialidade(ObjEspec).ConsultaEspecialidadeById();

                        Espec.Value = ObjEspec.NomeEspec;
                        DetalhesEspec.Value = ObjEspec.DescEspec;
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
                    ObjEspec.NomeEspec = Espec.Value;
                    ObjEspec.DescEspec = DetalhesEspec.Value;

                    if(new ManterEspecialidade(ObjEspec).AlteraEspecialidade())
                    {
                        Mensagem = "Especialidade alterada com sucesso.";
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar a especialidade.";
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
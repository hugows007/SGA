﻿using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.GrupoAtendimentos;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VGrupoAtendimento
{
    public partial class RelaGpAreaServEspec : System.Web.UI.Page
    {
        GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        Servico ObjServ = FactoryServico.GetNewServico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListGrupo.DataSource = new ManterGrupoAtendimento().ConsultaGrupoAtendimentos();
                    DropDownListGrupo.DataTextField = "NomeGpAtendimento";
                    DropDownListGrupo.DataValueField = "Id";
                    DropDownListGrupo.DataBind();
                    DropDownListGrupo.Items.Insert(0, new ListItem("Selecione o grupo", "0"));
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }

        protected void DropDownListGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListServ.DataSource = new ManterServico().ConsultaServicos();
                DropDownListServ.DataTextField = "NomeServ";
                DropDownListServ.DataValueField = "Id";
                DropDownListServ.DataBind();
                DropDownListServ.Items.Insert(0, new ListItem("Selecione o serviço", "0"));

                DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidades();
                DropDownListEspec.DataTextField = "NomeEspec";
                DropDownListEspec.DataValueField = "Id";
                DropDownListEspec.DataBind();
                DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void RelacionarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjGpAtend.Id = Convert.ToInt32(DropDownListGrupo.SelectedValue);
                ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                ObjServ.Id = Convert.ToInt32(DropDownListServ.SelectedValue);

                MsgLabel.Text = new ManterGrupoAtendimento(ObjGpAtend, ObjEspec, ObjServ).RelacionaGpServEspec();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
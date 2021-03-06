﻿using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class RelacionaEspecServ : System.Web.UI.Page
    {
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        Servico ObjServ = FactoryServico.GetNewServico();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    Mensagem = "Relacionamento entre serviço e especialidade.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    DropDownListServ.DataSource = new ManterServico().ConsultaServicos();
                    DropDownListServ.DataTextField = "NomeServ";
                    DropDownListServ.DataValueField = "Id";
                    DropDownListServ.Items.Insert(0, new ListItem("Selecione o serviço", "0"));

                    DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidades();
                    DropDownListEspec.DataTextField = "NomeEspec";
                    DropDownListEspec.DataValueField = "Id";
                    DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
                }
            }
        }

        protected void RelacionarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownListEspec.SelectedIndex > 0 && DropDownListServ.SelectedIndex > 0)
                {
                    ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    ObjServ.Id = Convert.ToInt32(DropDownListServ.SelectedValue);

                    if (new ManterEspecialidade(ObjEspec, ObjServ).RelacionaEspecServ())
                    {
                        Mensagem = "Especialidade e serviço relacionados com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível relacionar a especialidade e o serviço";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }else
                {
                    Mensagem = "Selecione as opções.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
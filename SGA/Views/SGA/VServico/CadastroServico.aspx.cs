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
    public partial class CadastroServico : System.Web.UI.Page
    {
        Servico ObjServico = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                    DropDownListTpServico.DataTextField = "NomeTipoServ";
                    DropDownListTpServico.DataValueField = "Id";
                    DropDownListTpServico.DataBind();
                    DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjServico = FactoryServico.GetNewServico();
                ObjServico.IdTipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);
                ObjServico.NomeServ = NomeTextBox.Text;
                ObjServico.DescServ = DescServTextBox.Text;
                ObjServico.Sla = Convert.ToDouble(SLATextBox.Text);

                MsgLabel.Text = new ManterServico(ObjServico).CadastraServico();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
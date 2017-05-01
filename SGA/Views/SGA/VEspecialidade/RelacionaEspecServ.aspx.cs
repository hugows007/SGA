using SGA.Models.DAO.Log;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
        }

        protected void RelacionarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                ObjServ.Id = Convert.ToInt32(DropDownListServ.SelectedValue);

                if(new ManterEspecialidade(ObjEspec, ObjServ).RelacionaEspecServ())
                {
                    MsgLabel.Text = "Especialidade e serviço relacionados com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível relacionar a especialidade e o serviço";
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
using SGA.Models.DAO.Log;
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
    public partial class ModificarServico : System.Web.UI.Page
    {
        Servico ObjServico = FactoryServico.GetNewServico();
        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {

                        ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();

                        DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                        DropDownListTpServico.DataTextField = "NomeTipoServ";
                        DropDownListTpServico.DataValueField = "Id";
                        DropDownListTpServico.DataBind();
                        DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));

                        DropDownListTpServico.SelectedValue = Convert.ToString(ObjServico.IdTipo);
                        NomeTextBox.Text = ObjServico.NomeServ;
                        DescServTextBox.Text = ObjServico.DescServ;
                        SLATextBox.Text = ObjServico.Sla.ToString();
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
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
                    ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjServico.IdTipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);
                    ObjServico.NomeServ = NomeTextBox.Text;
                    ObjServico.DescServ = DescServTextBox.Text;
                    ObjServico.Sla = Convert.ToDouble(SLATextBox.Text);

                    MsgLabel.Text = new ManterServico(ObjServico).AlteraServico();
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
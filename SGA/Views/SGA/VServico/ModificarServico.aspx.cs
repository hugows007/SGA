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
        Servico ObjServico = FactoryServico.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);

                    ObjServico = new ManterServico(ObjServico).ConsultaServicoById();

                    DropDownListTpServico.DataSource = new ManterServico(ObjServico).ConsultaTpServicosDataReader();
                    DropDownListTpServico.DataTextField = "tipo";
                    DropDownListTpServico.DataValueField = "idTipoServ";
                    DropDownListTpServico.DataBind();
                    DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));

                    DropDownListTpServico.SelectedValue = Convert.ToString(ObjServico.Tipo);
                    NomeTextBox.Text = ObjServico.Nome;
                    DescServTextBox.Text = ObjServico.Descricao;
                    SLATextBox.Text = ObjServico.Sla.ToString();

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
                    ObjServico.Tipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);
                    ObjServico.Nome = NomeTextBox.Text;
                    ObjServico.Descricao = DescServTextBox.Text;
                    ObjServico.Sla = Convert.ToDouble(SLATextBox.Text);

                    MsgLabel.Text = new ManterServico(ObjServico).AlteraServico();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao alterar - Código 1";
            }
        }
    }
}
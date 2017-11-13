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
    public partial class CadastroServico : System.Web.UI.Page
    {
        Servico ObjServico = null;
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Mensagem = "Cadastro de serviço.";
                                    
                    DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                    DropDownListTpServico.DataTextField = "NomeTipoServ";
                    DropDownListTpServico.DataValueField = "Id";
                    DropDownListTpServico.DataBind();
                    DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if(DropDownListTpServico.SelectedIndex > 0)
                {
                    ObjServico = FactoryServico.GetNewServico();
                    ObjServico.IdTipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);
                    ObjServico.NomeServ = Nome.Value;
                    ObjServico.DescServ = DescServ.Value;
                    ObjServico.Sla = Convert.ToDouble(SLA.Value);

                    if (new ManterServico(ObjServico).CadastraServico())
                    {
                        Mensagem = "Serviço cadastrado com sucesso.";
                    }
                    else
                    {
                        Mensagem = "Não foi possível cadastrar o serviço";
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
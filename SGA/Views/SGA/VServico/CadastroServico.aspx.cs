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
                    if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    Mensagem = "Cadastro de serviço.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                    DropDownListTpServico.DataTextField = "NomeTipoServ";
                    DropDownListTpServico.DataValueField = "Id";
                    DropDownListTpServico.DataBind();
                    DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
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
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível cadastrar o serviço";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
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
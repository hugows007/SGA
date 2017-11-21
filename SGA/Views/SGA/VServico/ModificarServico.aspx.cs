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

                    if (Request.QueryString["Id"] != null)
                    {
                        Mensagem = "Alteração de informações de um serviço.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                        ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();

                        DropDownListTpServico.DataSource = new ManterServico().ConsultaTpServicos();
                        DropDownListTpServico.DataTextField = "NomeTipoServ";
                        DropDownListTpServico.DataValueField = "Id";
                        DropDownListTpServico.DataBind();
                        DropDownListTpServico.Items.Insert(0, new ListItem("Selecione o tipo de serviço", "0"));

                        DropDownListTpServico.SelectedValue = Convert.ToString(ObjServico.IdTipo);
                        Nome.Value = ObjServico.NomeServ;
                        DescServ.Value = ObjServico.DescServ;
                        SLA.Value = ObjServico.Sla.ToString();
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null && DropDownListTpServico.SelectedIndex > 0)
                {
                    ObjServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjServico.IdTipo = Convert.ToInt32(DropDownListTpServico.SelectedValue);
                    ObjServico.NomeServ = Nome.Value;
                    ObjServico.DescServ = DescServ.Value;
                    ObjServico.Sla = Convert.ToDouble(SLA.Value);

                    if (new ManterServico(ObjServico).AlteraServico())
                    {
                        Mensagem = "Serviço modificado com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível modificar o serviço.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }else
                {
                    Mensagem = "Selecione todas as opções.";
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
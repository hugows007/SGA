using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VTipoServico
{
    public partial class CadastroTipoServico : System.Web.UI.Page
    {
        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
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

                    Mensagem = "Cadastro tipo de serviço.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
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
                ObjTpServico.NomeTipoServ = Nome.Value;

                if (new ManterServico(ObjTpServico).CadastraTpServico())
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
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
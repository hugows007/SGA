using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VTipoServico
{
    public partial class ConsultaTipoServicos : System.Web.UI.Page
    {
        public List<TipoServico> ListaTpServicoSelect = new List<TipoServico>();

        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                Mensagem = "Consulta de tipos de serviços.";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                foreach (var Result in new ManterServico().ConsultaTpServicos())
                {
                    TipoServico Tp = FactoryServico.GetNewTpServico();
                    Tp.Id = Result.Id;
                    Tp.NomeTipoServ = Result.NomeTipoServ;
                    ListaTpServicoSelect.Add(Tp);
                }

                if (Request.QueryString["OpInatTpServico"] != null && Request.QueryString["OpInatTpServico"].Equals("True"))
                {
                    Mensagem = "Tipo de serviço inativado com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatTpServico"] != null && Request.QueryString["OpInatTpServico"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar o tipo de serviço.";
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
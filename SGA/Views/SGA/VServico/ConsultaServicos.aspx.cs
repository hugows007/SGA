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

namespace SGA.Views.SGA.VServico
{
    public partial class ConsultaServicos : System.Web.UI.Page
    {
        public List<Servico> ListaServicoSelect = new List<Servico>();
        public List<string> NomeServico = new List<string>();

        Servico ObjServico = FactoryServico.GetNewServico();
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

                Mensagem = "Consulta de serviços.";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                foreach (var Result in new ManterServico().ConsultaServicos())
                {
                    ObjTpServico.Id = Result.IdTipo;
                    NomeServico.Add(new ManterServico(ObjServico, ObjTpServico).ConsultaTpServicoById().NomeTipoServ);
                    ListaServicoSelect.Add(Result);
                }

                if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("True"))
                {
                    Mensagem = "Serviço inativado com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatServico"] != null && Request.QueryString["OpInatServico"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar o serviço.";
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
using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class ConsultaEspecialidades : System.Web.UI.Page
    {
        public List<Especialidade> ListaEspecSelect = new List<Especialidade>();
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                if (!Page.IsPostBack)
                {
                    Mensagem = "Consulta de especialidades.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }

                foreach (var ObjAT in new ManterEspecialidade(ObjEspec).ConsultaEspecialidades())
                {
                    ListaEspecSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatEspecialidade"] != null && Request.QueryString["OpInatEspecialidade"].Equals("True"))
                {
                    Mensagem = "Especialidade inativada com sucesso!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatEspecialidade"] != null && Request.QueryString["OpInatEspecialidade"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar a especialidade!";
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
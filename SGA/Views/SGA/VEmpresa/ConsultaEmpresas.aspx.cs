using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SGA.Views.SGA.VEmpresa
{
    public partial class ConsultaEmpresas : System.Web.UI.Page
    {
        public List<Empresa> ListaEmpresaSelect = new List<Empresa>();
        Empresa ObjEmpresa = FactoryEmpresa.GetNew();
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                Mensagem = "Consulta de empresas.";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                foreach (var ObjAT in new ManterEmpresa(ObjEmpresa).ConsultaEmpresas())
                {
                    ListaEmpresaSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatEmpresa"] != null && Request.QueryString["OpInatEmpresa"].Equals("True"))
                {
                    Mensagem = "Empresa inativada com sucesso!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatEmpresa"] != null && Request.QueryString["OpInatEmpresa"].Equals("False"))
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
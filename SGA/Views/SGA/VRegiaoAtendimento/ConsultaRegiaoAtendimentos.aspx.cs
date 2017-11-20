using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRegiaoAtendimento
{
    public partial class ConsultaRegiaoAtendimentos : System.Web.UI.Page
    {
        public List<RegiaoAtendimento> ListaAreaSelect = new List<RegiaoAtendimento>();
        RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }

                Mensagem = "Consulta de região de atendimento";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                foreach (var ObjAT in new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentos())
                {
                    ListaAreaSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatArea"] != null && Request.QueryString["OpInatArea"].Equals("True"))
                {
                    Mensagem = "Área inativada com sucesso!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else if (Request.QueryString["OpInatArea"] != null && Request.QueryString["OpInatArea"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar a área!";
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
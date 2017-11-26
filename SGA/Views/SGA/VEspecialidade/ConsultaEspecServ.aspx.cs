using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.EspecServs;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class ConsultaEspecServ : System.Web.UI.Page
    {
        public List<EspecServ> ListaEspecSelect = new List<EspecServ>();
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
                    Mensagem = "Consulta relacionamento de especialidade e serviço.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }

                foreach (var ObjAT in new ManterEspecialidade(ObjEspec).ConsultaEspecialidadesServicos())
                {
                    ListaEspecSelect.Add(ObjAT);
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
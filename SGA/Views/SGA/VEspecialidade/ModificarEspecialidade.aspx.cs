using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class ModificarEspecialidade : System.Web.UI.Page
    {
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
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

                    Mensagem = "Alteração de informações da especialidade.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjEspec = new ManterEspecialidade(ObjEspec).ConsultaEspecialidadeById();

                        Espec.Value = ObjEspec.NomeEspec;
                        DetalhesEspec.Value = ObjEspec.DescEspec;
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
                if (Request.QueryString["Id"] != null)
                {
                    ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjEspec.NomeEspec = Espec.Value;
                    ObjEspec.DescEspec = DetalhesEspec.Value;

                    if (new ManterEspecialidade(ObjEspec).AlteraEspecialidade())
                    {
                        Mensagem = "Especialidade alterada com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar a especialidade.";
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
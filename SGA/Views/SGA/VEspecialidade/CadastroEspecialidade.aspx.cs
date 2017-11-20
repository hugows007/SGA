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
    public partial class CadastroEspecialidade : System.Web.UI.Page
    {
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
            {
                Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
            }

            Mensagem = "Cadastro de especialidade.";
            ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidade ObjEspec = FactoryEspecialidade.GetNew();
                ObjEspec.NomeEspec = Espec.Value;
                ObjEspec.DescEspec = DetalhesEspec.Value;

                if(new ManterEspecialidade(ObjEspec).CadastraEspecialidade())
                {
                    Mensagem = "Especialidade cadastrada com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else
                {
                    Mensagem = "Não foi possível cadastrar a especialidade.";
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
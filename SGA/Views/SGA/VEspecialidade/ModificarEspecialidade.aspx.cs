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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjEspec.Id = Convert.ToInt32(Request.QueryString["Id"]);

                    foreach (var Result in new ManterEspecialidade(ObjEspec).ConsultaEspecialidadeById())
                    {
                        EspecTextBox.Text = Result.EspecialidadeDesc;
                        EspecDestTextBox.Text = Result.DetalheEspec;
                    }
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
                    ObjEspec.EspecialidadeDesc = EspecTextBox.Text;
                    ObjEspec.DetalheEspec = EspecDestTextBox.Text;

                    MsgLabel.Text = new ManterEspecialidade(ObjEspec).AlteraEspecialidade();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao alterar - Código 1";
            }
        }
    }
}
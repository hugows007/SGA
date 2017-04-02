using SGA.Models.Manter;
using SGA.Models.Setores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VSetor
{
    public partial class ModificarSetor : System.Web.UI.Page
    {
        Setor ObjSetor = FactorySetor.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjSetor.Id = Convert.ToInt32(Request.QueryString["Id"]);

                    foreach (var Result in new ManterSetor(ObjSetor).ConsultaSetorById())
                    {
                        SetorTextBox.Text = Result.SetorDesc;
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
                    ObjSetor.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjSetor.SetorDesc = SetorTextBox.Text;

                    MsgLabel.Text = new ManterSetor(ObjSetor).AlteraSetor();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao alterar - Código 1";
            }
        }
    }
}
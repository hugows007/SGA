using SGA.Models.DAO.Log;
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
                try
                {

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjSetor.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        foreach (var Result in new ManterSetor(ObjSetor).ConsultaSetorById())
                        {
                            SetorTextBox.Text = Result.NomeSetor;
                        }
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
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
                    ObjSetor.NomeSetor = SetorTextBox.Text;

                    MsgLabel.Text = new ManterSetor(ObjSetor).AlteraSetor();
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
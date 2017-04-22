using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VGrupoAtendimento
{
    public partial class ModificarGpAtendimento : System.Web.UI.Page
    {
        GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjGpAtend.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjGpAtend = new ManterGrupoAtendimento(ObjGpAtend).ConsultaGrupoAtendimentoById();

                        NomeGpTextBox.Text = ObjGpAtend.NomeGpAtendimento;
                        DescGpTextBox.Text = ObjGpAtend.DescGpAtendimento;
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
                    ObjGpAtend.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjGpAtend.NomeGpAtendimento = NomeGpTextBox.Text;
                    ObjGpAtend.DescGpAtendimento = DescGpTextBox.Text;

                    MsgLabel.Text = new ManterGrupoAtendimento(ObjGpAtend).AlteraGrupoAtendimento();
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
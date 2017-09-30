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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidade ObjEspec = FactoryEspecialidade.GetNew();
                ObjEspec.NomeEspec = EspecTextBox.Text;
                ObjEspec.DescEspec = EspecDestTextBox.Text;

                if(new ManterEspecialidade(ObjEspec).CadastraEspecialidade())
                {
                    MsgLabel.Text = "Especialidade cadastrada com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível cadastrar a especialidade.";
                }
                
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
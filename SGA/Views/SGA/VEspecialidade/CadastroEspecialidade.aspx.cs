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

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Mensagem = "Cadastro de especialidade.";
                
                Especialidade ObjEspec = FactoryEspecialidade.GetNew();
                ObjEspec.NomeEspec = Espec.Value;
                ObjEspec.DescEspec = DetalhesEspec.Value;

                if(new ManterEspecialidade(ObjEspec).CadastraEspecialidade())
                {
                    Mensagem = "Especialidade cadastrada com sucesso.";
                }
                else
                {
                    Mensagem = "Não foi possível cadastrar a especialidade.";
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
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
    public partial class CadastroRegiaoAtendimento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
                ObjRegiao.Regiao = RegiaoTextBox.Text;
                ObjRegiao.Cidade = CidadeTextBox.Text;
                ObjRegiao.Estado = EstadoTextBox.Text;

                if(new ManterRegiaoAtendimento(ObjRegiao).CadastraRegiaoAtendimento())
                {
                    MsgLabel.Text = "Região de atendimento cadastrada com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível cadastrar a região de atendimento.";
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
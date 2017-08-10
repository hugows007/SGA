using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEmpresa
{
    public partial class CadastroEmpresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Empresa ObjEmpresa = FactoryEmpresa.GetNew();
                ObjEmpresa.NomeEmpresa = EmpresaTextBox.Text;
                ObjEmpresa.Endereco = EnderecoTextBox.Text;
                ObjEmpresa.Complemento = ComplementoTextBox.Text;
                ObjEmpresa.Cep = CepTextBox.Text;
                ObjEmpresa.Telefone = TelefoneTextBox.Text;

                if (new ManterEmpresa(ObjEmpresa).CadastraEmpresa())
                {
                    MsgLabel.Text = "Empresa cadastrada com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível cadastrar a especialidade.";
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
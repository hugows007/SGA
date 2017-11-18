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
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            Mensagem = "Cadastro de empresa.";
        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Empresa ObjEmpresa = FactoryEmpresa.GetNew();
                ObjEmpresa.NomeEmpresa = Empresa.Value;
                ObjEmpresa.Endereco = Endereco.Value;
                ObjEmpresa.Complemento = Complemento.Value;
                ObjEmpresa.Cep = CEP.Value;
                ObjEmpresa.Telefone = Telefone.Value;

                if (new ManterEmpresa(ObjEmpresa).CadastraEmpresa())
                {
                    Mensagem = "Empresa cadastrada com sucesso.";
                }
                else
                {
                    Mensagem = "Não foi possível cadastrar a especialidade.";
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
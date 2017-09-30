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
    public partial class ModificarEmpresa : System.Web.UI.Page
    {
        Empresa ObjEmpresa = FactoryEmpresa.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjEmpresa.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjEmpresa = new ManterEmpresa(ObjEmpresa).ConsultaEmpresaById();

                        EmpresaTextBox.Text = ObjEmpresa.NomeEmpresa;
                        EnderecoTextBox.Text = ObjEmpresa.Endereco;
                        ComplementoTextBox.Text = ObjEmpresa.Complemento;
                        CepTextBox.Text = ObjEmpresa.Cep;
                        TelefoneTextBox.Text = ObjEmpresa.Telefone;
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
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
                    ObjEmpresa.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjEmpresa.NomeEmpresa = EmpresaTextBox.Text;
                    ObjEmpresa.Endereco = EnderecoTextBox.Text;
                    ObjEmpresa.Complemento = ComplementoTextBox.Text;
                    ObjEmpresa.Cep = CepTextBox.Text;
                    ObjEmpresa.Telefone = TelefoneTextBox.Text;

                    if (new ManterEmpresa(ObjEmpresa).AlteraEmpresa())
                    {
                        MsgLabel.Text = "Empresa alterada com sucesso.";
                    }
                    else
                    {
                        MsgLabel.Text = "Não foi possível alterar a especialidade.";
                    }
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
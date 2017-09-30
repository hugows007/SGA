using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                        NomeTextBox.Text = ObjUsuario.Nome;
                        EndTextBox.Text = ObjUsuario.Endereco;
                        TelTextBox.Text = ObjUsuario.Telefone;
                        NumTextBox.Text = ObjUsuario.Numero;
                        CEPTextBox.Text = ObjUsuario.Cep;
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
                    ObjUsuario.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjUsuario.Nome = NomeTextBox.Text;
                    ObjUsuario.Endereco = EndTextBox.Text;
                    ObjUsuario.Telefone = TelTextBox.Text;
                    ObjUsuario.Numero = NumTextBox.Text;
                    ObjUsuario.Cep = CEPTextBox.Text;

                    if (new ManterUsuario(ObjUsuario).AlteraUsuario())
                    {
                        MsgLabel.Text = "Usuário alterado com sucesso.";
                    }
                    else
                    {
                        MsgLabel.Text = "Não foi possível alterar o usuário";
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
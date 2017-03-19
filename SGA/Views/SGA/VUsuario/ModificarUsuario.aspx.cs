using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        Usuario Usuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    Usuario.Id = Convert.ToInt32(Request.QueryString["Id"]);

                    foreach (var Result in new ManterUsuario(Usuario).ConsultaUsuarioById())
                    {
                        NomeTextBox.Text = Result.Nome;
                        EndTextBox.Text = Result.Endereco;
                        TelTextBox.Text = Result.Telefone;
                        NumTextBox.Text = Result.Numero;
                        CEPTextBox.Text = Result.Cep;
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
                    Usuario.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EndTextBox.Text;
                    Usuario.Telefone = TelTextBox.Text;
                    Usuario.Numero = NumTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;

                    MsgLabel.Text = new ManterUsuario(Usuario).AlteraUsuario();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao cadastrar - Código 1";
            }
        }
    }
}
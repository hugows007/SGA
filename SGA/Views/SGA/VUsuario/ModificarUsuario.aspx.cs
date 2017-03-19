using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario Usuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

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

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.Usuario);

                    Usr.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    Usr.Nome = NomeTextBox.Text;
                    Usr.Endereco = EndTextBox.Text;
                    Usr.Telefone = TelTextBox.Text;
                    Usr.Numero = NumTextBox.Text;
                    Usr.Cep = CEPTextBox.Text;
                    
                    MsgLabel.Text = new ManterUsuario(Usr).AlteraUsuario();
                }
            }

            catch (Exception)
            {
                MsgLabel.Text = "Erro ao cadastrar - Código 1";
            }
        }
    }
}
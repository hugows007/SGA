using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Configuracao : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        MembershipUser Usuario;
        public bool TrocarSenha;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    ObjUsuario.Id = Convert.ToInt32(Session["id"]);

                    ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                    NomeTextBox.Text = ObjUsuario.Nome;
                    EndTextBox.Text = ObjUsuario.Endereco;
                    TelTextBox.Text = ObjUsuario.Telefone;
                    NumTextBox.Text = ObjUsuario.Numero;
                    CEPTextBox.Text = ObjUsuario.Cep;
                    EmailTextBox.Text = ObjUsuario.Email;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjUsuario.Id = Convert.ToInt32(Session["id"]);
                ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                ObjUsuario.Nome = NomeTextBox.Text;
                ObjUsuario.Endereco = EndTextBox.Text;
                ObjUsuario.Telefone = TelTextBox.Text;
                ObjUsuario.Numero = NumTextBox.Text;
                ObjUsuario.Cep = CEPTextBox.Text;

                Usuario = Membership.GetUser(ObjUsuario.Login);

                if (new ManterUsuario(ObjUsuario).AlteraUsuario())
                {
                    if (!Usuario.Email.Equals(EmailTextBox.Text))
                    {
                        Usuario.Email = EmailTextBox.Text;
                        Membership.UpdateUser(Usuario);
                    }

                    MsgLabel.Text = "Seus dados foram alterado com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível alterar seus dados.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void SenhaAlterarButton_Click(object sender, EventArgs e)
        {
            TrocarSenha = true;
        }

        protected void SalvarSenhaButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjUsuario.Id = Convert.ToInt32(Session["id"]);
                ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                ObjUsuario.Senha = SenhaTextBox.Text;

                if (new ManterUsuario(ObjUsuario).AlteraSenha())
                {
                    MsgLabel.Text = "Senha alterada com sucesso.";
                    NomeTextBox.Text = ObjUsuario.Nome;
                    EndTextBox.Text = ObjUsuario.Endereco;
                    TelTextBox.Text = ObjUsuario.Telefone;
                    NumTextBox.Text = ObjUsuario.Numero;
                    CEPTextBox.Text = ObjUsuario.Cep;
                    EmailTextBox.Text = ObjUsuario.Email;
                }
                else
                {
                    MsgLabel.Text = "Não foi possível alterar sua senha.";
                    NomeTextBox.Text = ObjUsuario.Nome;
                    EndTextBox.Text = ObjUsuario.Endereco;
                    TelTextBox.Text = ObjUsuario.Telefone;
                    NumTextBox.Text = ObjUsuario.Numero;
                    CEPTextBox.Text = ObjUsuario.Cep;
                    EmailTextBox.Text = ObjUsuario.Email;
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
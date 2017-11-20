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
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    Mensagem = "Suas configurações.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    ObjUsuario.Id = Convert.ToInt32(Session["id"]);

                    ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                    Nome.Value = ObjUsuario.Nome;
                    Endereco.Value = ObjUsuario.Endereco;
                    Telefone.Value = ObjUsuario.Telefone;
                    Complemento.Value = ObjUsuario.Complemento;
                    CEP.Value = ObjUsuario.Cep;
                    Email.Value = ObjUsuario.Email;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjUsuario.Id = Convert.ToInt32(Session["id"]);
                ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioById();

                ObjUsuario.Nome = Nome.Value;
                ObjUsuario.Endereco = Endereco.Value;
                ObjUsuario.Telefone = Telefone.Value;
                ObjUsuario.Complemento = Complemento.Value;
                ObjUsuario.Cep = CEP.Value;

                Usuario = Membership.GetUser(ObjUsuario.Login);

                if (new ManterUsuario(ObjUsuario).AlteraUsuario())
                {
                    if (!Usuario.Email.Equals(Email.Value))
                    {
                        Usuario.Email = Email.Value;
                        Membership.UpdateUser(Usuario);
                    }

                    Mensagem = "Seus dados foram alterado com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
                else
                {
                    Mensagem = "Não foi possível alterar seus dados.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
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

                ObjUsuario.Senha = Senha.Value;

                if (new ManterUsuario(ObjUsuario).AlteraSenha())
                {
                    Mensagem = "Senha alterada com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    Nome.Value = ObjUsuario.Nome;
                    Endereco.Value = ObjUsuario.Endereco;
                    Telefone.Value = ObjUsuario.Telefone;
                    Complemento.Value = ObjUsuario.Complemento;
                    CEP.Value = ObjUsuario.Cep;
                    Email.Value = ObjUsuario.Email;
                }
                else
                {
                    Mensagem = "Não foi possível alterar sua senha.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    Nome.Value = ObjUsuario.Nome;
                    Endereco.Value = ObjUsuario.Endereco;
                    Telefone.Value = ObjUsuario.Telefone;
                    Complemento.Value = ObjUsuario.Complemento;
                    CEP.Value = ObjUsuario.Cep;
                    Email.Value = ObjUsuario.Email;
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
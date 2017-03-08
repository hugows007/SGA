using SGA.Models;
using SGA.Models.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.Usuario
{
    public partial class Cadastro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownListTipo.DataSource = new CadastroUsuario().RegrasUsuario();
                DropDownListTipo.DataBind();
                DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                DropDownListSetor.DataSource = new Models.DAO.Usuario.CadastroDAO().GetSetor();
                DropDownListSetor.DataTextField = "setor";
                DropDownListSetor.DataValueField = "idSetor";
                DropDownListSetor.DataBind();
                DropDownListSetor.Items.Insert(0, new ListItem("Selecione o setor", "0"));

                DropDownListCargo.DataSource = new Models.DAO.Usuario.CadastroDAO().GetCargo();
                DropDownListCargo.DataTextField = "cargo";
                DropDownListCargo.DataValueField = "idCargo";
                DropDownListCargo.DataBind();
                DropDownListCargo.Items.Insert(0, new ListItem("Selecione o cargo", "0"));

                DropDownListEspec.DataSource = new Models.DAO.Usuario.CadastroDAO().GetEspecialidade();
                DropDownListEspec.DataTextField = "especialidade";
                DropDownListEspec.DataValueField = "idEspecialidade";
                DropDownListEspec.DataBind();
                DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
            }
        }

        protected void BotaoCriarUsuario_OnClick(object sender, EventArgs e)
        {
            try
            {
                IUsuario Usuario = null;

                if (DropDownListTipo.Text.Equals("Administrador"))
                {
                    Usuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioAdministrador);

                    Usuario.Usuario = UsernameTextbox.Text;
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EnderecoTextBox.Text;
                    Usuario.Numero = NumeroTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;
                    Usuario.Telefone = TelefoneTextBox.Text;

                    CadastroUsuario Cd = new CadastroUsuario(
                        Usuario.Usuario,
                        PasswordTextbox.Text,
                        EmailTextbox.Text,
                        DropDownListTipo.SelectedValue,
                        Usuario.Nome,
                        Usuario.Endereco,
                        Usuario.Numero,
                        Usuario.Cep,
                        Usuario.Telefone
                    );

                    Msg.Text = Cd.CadastroUsuarioMemberShip();

                    if (Msg.Text.Equals("OK"))
                    {
                        Msg.Text = Cd.CadastroUsuarioAdministrador();
                    }

                }

                if (DropDownListTipo.Text.Equals("Cliente Físico"))
                {
                    Usuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteFisico);

                    Usuario.Usuario = UsernameTextbox.Text;
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EnderecoTextBox.Text;
                    Usuario.Numero = NumeroTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;
                    Usuario.Telefone = TelefoneTextBox.Text;
                    Usuario.DocIdent = DocTextbox.Text;
                    Usuario.OrgEmiss = EmissDocTextBox.Text;
                    Usuario.Cpf = CPFTextbox.Text;

                    CadastroUsuario Cd = new CadastroUsuario(
                        Usuario.Usuario,
                        PasswordTextbox.Text,
                        EmailTextbox.Text,
                        DropDownListTipo.SelectedValue,
                        Usuario.Nome,
                        Usuario.Endereco,
                        Usuario.Numero,
                        Usuario.Cep,
                        Usuario.Telefone,
                        Usuario.DocIdent,
                        Usuario.OrgEmiss,
                        Usuario.Cpf
                    );

                    Msg.Text = Cd.CadastroUsuarioMemberShip();

                    if (Msg.Text.Equals("OK"))
                    {
                        Msg.Text = Cd.CadastroUsuarioClienteFisico();
                    }

                }

                if (DropDownListTipo.Text.Equals("Cliente Jurídico"))
                {
                    Usuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteJuridico);

                    Usuario.Usuario = UsernameTextbox.Text;
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EnderecoTextBox.Text;
                    Usuario.Numero = NumeroTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;
                    Usuario.Telefone = TelefoneTextBox.Text;
                    Usuario.Cnpj = CNPJTextBox.Text;

                    CadastroUsuario Cd = new CadastroUsuario(
                        Usuario.Usuario,
                        PasswordTextbox.Text,
                        EmailTextbox.Text,
                        DropDownListTipo.SelectedValue,
                        Usuario.Nome,
                        Usuario.Endereco,
                        Usuario.Numero,
                        Usuario.Cep,
                        Usuario.Telefone,
                        Usuario.Cnpj
                    );

                    Msg.Text = Cd.CadastroUsuarioMemberShip();

                    if (Msg.Text.Equals("OK"))
                    {
                        Msg.Text = Cd.CadastroUsuarioClienteJuridico();
                    }

                }

                if (DropDownListTipo.Text.Equals("Gestor"))
                {
                    Usuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioGestor);

                    Usuario.Usuario = UsernameTextbox.Text;
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EnderecoTextBox.Text;
                    Usuario.Numero = NumeroTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;
                    Usuario.Telefone = TelefoneTextBox.Text;
                    Usuario.Setor = DropDownListSetor.SelectedIndex;
                    Usuario.Cargo = DropDownListCargo.SelectedIndex;

                    CadastroUsuario Cd = new CadastroUsuario(
                        Usuario.Usuario,
                        PasswordTextbox.Text,
                        EmailTextbox.Text,
                        DropDownListTipo.SelectedValue,
                        Usuario.Nome,
                        Usuario.Endereco,
                        Usuario.Numero,
                        Usuario.Cep,
                        Usuario.Telefone,
                        Usuario.Setor,
                        Usuario.Cargo
                    );

                    Msg.Text = Cd.CadastroUsuarioMemberShip();

                    if (Msg.Text.Equals("OK"))
                    {
                        Msg.Text = Cd.CadastroUsuarioGestor();
                    }

                }

                if (DropDownListTipo.Text.Equals("Técnico"))
                {
                    Usuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioTecnico);

                    Usuario.Usuario = UsernameTextbox.Text;
                    Usuario.Nome = NomeTextBox.Text;
                    Usuario.Endereco = EnderecoTextBox.Text;
                    Usuario.Numero = NumeroTextBox.Text;
                    Usuario.Cep = CEPTextBox.Text;
                    Usuario.Telefone = TelefoneTextBox.Text;
                    Usuario.Especialidade = DropDownListEspec.SelectedIndex;
                    Usuario.Cargo = DropDownListCargo.SelectedIndex;
                    Usuario.Setor = DropDownListSetor.SelectedIndex;

                    CadastroUsuario Cd = new CadastroUsuario(
                        Usuario.Usuario,
                        PasswordTextbox.Text,
                        EmailTextbox.Text,
                        DropDownListTipo.SelectedValue,
                        Usuario.Nome,
                        Usuario.Endereco,
                        Usuario.Numero,
                        Usuario.Cep,
                        Usuario.Telefone,
                        Usuario.Especialidade,
                        Usuario.Cargo,
                        Usuario.Setor
                    );

                    Msg.Text = Cd.CadastroUsuarioMemberShip();

                    if (Msg.Text.Equals("OK"))
                    {
                        Msg.Text = Cd.CadastroUsuarioTecnico();
                    }

                }
            }
            catch (Exception)
            {
                Msg.Text = "Erro interno - Código 1";
            }
        }
    }
}
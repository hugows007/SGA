using SGA.Models;
using SGA.Models.DAO.AreaDeAtendimento;
using SGA.Models.DAO.Setor;
using SGA.Models.DAO.UsuarioDAO;
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
                DropDownListTipo.DataSource = new CadastroUsuarios().RegrasUsuario();
                DropDownListTipo.DataBind();
                DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                DropDownListSetor.DataSource = new SetorDAO().GetSetor();
                DropDownListSetor.DataTextField = "setor";
                DropDownListSetor.DataValueField = "idSetor";
                DropDownListSetor.DataBind();
                DropDownListSetor.Items.Insert(0, new ListItem("Selecione o setor", "0"));

                DropDownListCargo.DataSource = new CargoDAO().GetCargo();
                DropDownListCargo.DataTextField = "cargo";
                DropDownListCargo.DataValueField = "idCargo";
                DropDownListCargo.DataBind();
                DropDownListCargo.Items.Insert(0, new ListItem("Selecione o cargo", "0"));

                DropDownListEspec.DataSource = new EspecialidadeDAO().GetEspecialidade();
                DropDownListEspec.DataTextField = "especialidade";
                DropDownListEspec.DataValueField = "idEspecialidade";
                DropDownListEspec.DataBind();
                DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));

                DropDownListAreaAtendimento.DataSource = new AreaAtendimentoDAO().GetAreaDeAtendimento();
                DropDownListAreaAtendimento.DataTextField = "regiao";
                DropDownListAreaAtendimento.DataValueField = "idAreaAtendimento";
                DropDownListAreaAtendimento.DataBind();
                DropDownListAreaAtendimento.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
            }
        }

        protected void BotaoCriarUsuario_OnClick(object sender, EventArgs e)
        {
            try
            {
                string TpUsuario = DropDownListTipo.Text;
                IUsuario Usuario = null;

                Usuario = FactoryClass.GetNew(TipoFactory.Usuario);
               
                Usuario.Login = UsernameTextbox.Text;
                Usuario.Senha = PasswordTextbox.Text;
                Usuario.Email = EmailTextbox.Text;
                Usuario.Regra = DropDownListTipo.SelectedValue;
                Usuario.Nome = NomeTextBox.Text;
                Usuario.Endereco = EnderecoTextBox.Text;
                Usuario.Numero = NumeroTextBox.Text;
                Usuario.Cep = CEPTextBox.Text;
                Usuario.Telefone = TelefoneTextBox.Text;
                Usuario.DocIdent = DocTextbox.Text;
                Usuario.OrgEmiss = EmissDocTextBox.Text;
                Usuario.Cpf = CPFTextbox.Text;
                Usuario.Cnpj = CNPJTextBox.Text;
                Usuario.IdAreaAtendimento = DropDownListAreaAtendimento.SelectedIndex;
                Usuario.Especialidade = DropDownListEspec.SelectedIndex;
                Usuario.Cargo = DropDownListCargo.SelectedIndex;
                Usuario.Setor = DropDownListSetor.SelectedIndex;

                CadastroUsuarios Cd = new CadastroUsuarios(Usuario);

                Msg.Text = Cd.CadastraUsuario();
            }

            catch (Exception)
            {
                Msg.Text = "Erro ao cadastrar - Código 1";
            }
        }
    }
}
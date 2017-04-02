using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGA.Models.Manter;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Cadastro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownListTipo.DataSource = new ManterUsuario().RegrasUsuario();
                DropDownListTipo.DataBind();
                DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                DropDownListSetor.DataSource = new ManterSetor().ConsultaSetoresDataReader();
                DropDownListSetor.DataTextField = "setor";
                DropDownListSetor.DataValueField = "idSetor";
                DropDownListSetor.DataBind();
                DropDownListSetor.Items.Insert(0, new ListItem("Selecione o setor", "0"));

                DropDownListCargo.DataSource = new ManterCargo().ConsultaCargosDataReader();
                DropDownListCargo.DataTextField = "cargo";
                DropDownListCargo.DataValueField = "idCargo";
                DropDownListCargo.DataBind();
                DropDownListCargo.Items.Insert(0, new ListItem("Selecione o cargo", "0"));

                DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidadesDataReader();
                DropDownListEspec.DataTextField = "especialidade";
                DropDownListEspec.DataValueField = "idEspecialidade";
                DropDownListEspec.DataBind();
                DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));

                DropDownListAreaAtendimento.DataSource = new ManterAreaAtendimento().ConsultaAreaAtendimentosDataReader();
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
                Usuario Usr = null;

                if (TpUsuario.Equals("Administrador"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                }
                else if (TpUsuario.Equals("Técnico"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioTecnico);
                    Usr.ObjT.Especialidade = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    Usr.ObjT.Cargo = Convert.ToInt32(DropDownListCargo.SelectedValue);
                    Usr.ObjT.Setor = Convert.ToInt32(DropDownListSetor.SelectedValue);
                }
                else if(TpUsuario.Equals("Gestor"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioGestor);
                    Usr.ObjT.Cargo = Convert.ToInt32(DropDownListCargo.SelectedValue);
                    Usr.ObjT.Setor = Convert.ToInt32(DropDownListSetor.SelectedValue);
                }
                else if(TpUsuario.Equals("Cliente Físico"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteFisico);
                    Usr.ObjCF.DocIdent = DocTextbox.Text;
                    Usr.ObjCF.OrgEmiss = EmissDocTextBox.Text;
                    Usr.ObjCF.Cpf = CPFTextbox.Text;
                }
                else if (TpUsuario.Equals("Cliente Jurídico"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteJuridico);
                    Usr.ObjCJ.Cnpj = CNPJTextBox.Text;
                }

                Usr.Login = UserNameTextbox.Text;
                Usr.Senha = PasswordTextbox.Text;
                Usr.Email = EmailTextbox.Text;
                Usr.Regra = DropDownListTipo.SelectedValue;
                Usr.Nome = NomeTextBox.Text;
                Usr.Endereco = EnderecoTextBox.Text;
                Usr.Numero = NumeroTextBox.Text;
                Usr.Cep = CEPTextBox.Text;
                Usr.Telefone = TelefoneTextBox.Text;
                Usr.AreaAtendimento = DropDownListAreaAtendimento.SelectedIndex;

                Msg.Text = new ManterUsuario(Usr).CadastraUsuario();
            }

            catch (Exception)
            {
                Msg.Text = "Erro ao cadastrar - Código 1";
            }
        }
    }
}
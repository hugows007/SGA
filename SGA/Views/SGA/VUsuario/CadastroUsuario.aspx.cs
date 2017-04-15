using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGA.Models.Manter;
using SGA.Models.DAO.Log;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Cadastro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListTipo.DataSource = new ManterUsuario().RegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                    using (var Setor = new ManterSetor().ConsultaSetoresDataReader())
                    {
                        DropDownListSetor.DataSource = Setor;
                        DropDownListSetor.DataTextField = "setor";
                        DropDownListSetor.DataValueField = "idSetor";
                        DropDownListSetor.DataBind();
                        DropDownListSetor.Items.Insert(0, new ListItem("Selecione o setor", "0"));
                    }

                    using (var Cargo = new ManterCargo().ConsultaCargosDataReader())
                    {
                        DropDownListCargo.DataSource = Cargo;
                        DropDownListCargo.DataTextField = "cargo";
                        DropDownListCargo.DataValueField = "idCargo";
                        DropDownListCargo.DataBind();
                        DropDownListCargo.Items.Insert(0, new ListItem("Selecione o cargo", "0"));
                    }

                    using (var Espec = new ManterEspecialidade().ConsultaEspecialidadesDataReader())
                    {
                        DropDownListEspec.DataSource = Espec;
                        DropDownListEspec.DataTextField = "especialidade";
                        DropDownListEspec.DataValueField = "idEspecialidade";
                        DropDownListEspec.DataBind();
                        DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
                    }

                    using (var Area = new ManterAreaAtendimento().ConsultaAreaAtendimentosDataReader())
                    {
                        DropDownListAreaAtendimento.DataSource = Area;
                        DropDownListAreaAtendimento.DataTextField = "regiao";
                        DropDownListAreaAtendimento.DataValueField = "idAreaAtendimento";
                        DropDownListAreaAtendimento.DataBind();
                        DropDownListAreaAtendimento.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
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
                    Usr.ObjT.IdEspecialidade = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    Usr.ObjT.IdCargo = Convert.ToInt32(DropDownListCargo.SelectedValue);
                    Usr.ObjT.IdSetor = Convert.ToInt32(DropDownListSetor.SelectedValue);
                }
                else if (TpUsuario.Equals("Gestor"))
                {
                    Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioGestor);
                    Usr.ObjT.IdCargo = Convert.ToInt32(DropDownListCargo.SelectedValue);
                    Usr.ObjT.IdSetor = Convert.ToInt32(DropDownListSetor.SelectedValue);
                }
                else if (TpUsuario.Equals("Cliente Físico"))
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
                Usr.IdAreaAtendimento = DropDownListAreaAtendimento.SelectedIndex;

                MsgLabel.Text = new ManterUsuario(Usr).CadastraUsuario();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
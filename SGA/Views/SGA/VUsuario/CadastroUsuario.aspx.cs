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
using SGA.Models.AreaAtendimentos;
using SGA.Models.GrupoAtendimentos;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Cadastro : System.Web.UI.Page
    {
        Usuario ObjUsuario = null;
        AreaAtendimento ObjArea = null;
        GrupoAtendimento ObjGpAtend = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListTipo.DataSource = new ManterUsuario().RegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));
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
                if (DropDownListTipo.Text.Equals("Administrador"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                }
                else if (DropDownListTipo.Text.Equals("Técnico") || DropDownListTipo.Text.Equals("Gestor") || DropDownListTipo.Text.Equals("Atendente"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                    ObjUsuario.ObjFunc.IdSetor = Convert.ToInt32(DropDownListSetor.SelectedValue);
                    ObjUsuario.ObjFunc.IdCargo = Convert.ToInt32(DropDownListCargo.SelectedValue);
                }
                else if (DropDownListTipo.Text.Equals("Cliente Físico"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteFisico);
                    ObjUsuario.ObjCF.DocIdent = DocTextbox.Text;
                    ObjUsuario.ObjCF.OrgEmiss = EmissDocTextBox.Text;
                    ObjUsuario.ObjCF.Cpf = CPFTextbox.Text;
                }
                else if (DropDownListTipo.Text.Equals("Cliente Jurídico"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteJuridico);
                    ObjUsuario.ObjCJ.Cnpj = CNPJTextBox.Text;
                }

                ObjArea = FactoryArea.GetNew();
                ObjGpAtend = FactoryGrupoAtendimento.GetNew();

                ObjUsuario.Login = UserNameTextbox.Text;
                ObjUsuario.Senha = PasswordTextbox.Text;
                ObjUsuario.Email = EmailTextbox.Text;
                ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                ObjUsuario.Nome = NomeTextBox.Text;
                ObjUsuario.Endereco = EnderecoTextBox.Text;
                ObjUsuario.Numero = NumeroTextBox.Text;
                ObjUsuario.Cep = CEPTextBox.Text;
                ObjUsuario.Telefone = TelefoneTextBox.Text;
                ObjArea.Id = Convert.ToInt32(DropDownListArea.SelectedValue);
                ObjGpAtend.Id = Convert.ToInt32(DropDownListGrupo.SelectedValue);

                MsgLabel.Text = new ManterUsuario(ObjUsuario, ObjArea, ObjGpAtend).CadastraUsuario();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void DropDownListTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListSetor.DataSource = new ManterSetor().ConsultaSetores();
            DropDownListSetor.DataTextField = "NomeSetor";
            DropDownListSetor.DataValueField = "Id";
            DropDownListSetor.DataBind();
            DropDownListSetor.Items.Insert(0, new ListItem("Selecione o setor", "0"));

            DropDownListCargo.DataSource = new ManterCargo().ConsultaCargos();
            DropDownListCargo.DataTextField = "NomeCargo";
            DropDownListCargo.DataValueField = "Id";
            DropDownListCargo.DataBind();
            DropDownListCargo.Items.Insert(0, new ListItem("Selecione o cargo", "0"));

            DropDownListArea.DataSource = new ManterAreaAtendimento().ConsultaAreaAtendimentos();
            DropDownListArea.DataTextField = "Regiao";
            DropDownListArea.DataValueField = "Id";
            DropDownListArea.DataBind();
            DropDownListArea.Items.Insert(0, new ListItem("Selecione a regiao", "0"));

            DropDownListGrupo.DataSource = new ManterGrupoAtendimento().ConsultaGrupoAtendimentos();
            DropDownListGrupo.DataTextField = "NomeGpAtendimento";
            DropDownListGrupo.DataValueField = "Id";
            DropDownListGrupo.DataBind();
            DropDownListGrupo.Items.Insert(0, new ListItem("Selecione o grupo", "0"));
        }
    }
}
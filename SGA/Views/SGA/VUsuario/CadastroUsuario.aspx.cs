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
using SGA.Models.RegiaoAtendimentos;
using SGA.Models.Especialidades;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Cadastro : System.Web.UI.Page
    {
        Usuario ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    DropDownListTipo.DataSource = new ManterUsuario().GetRegrasUsuario();
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
                else if (DropDownListTipo.Text.Equals("Técnico"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                    ObjUsuario.ObjFunc.ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    ObjUsuario.ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                }
                else if (DropDownListTipo.Text.Equals("Gestor") || DropDownListTipo.Text.Equals("Atendente"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
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

                ObjUsuario.Login = UserNameTextbox.Text;
                ObjUsuario.Senha = PasswordTextbox.Text;
                ObjUsuario.Email = EmailTextbox.Text;
                ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                ObjUsuario.Nome = NomeTextBox.Text;
                ObjUsuario.Endereco = EnderecoTextBox.Text;
                ObjUsuario.Numero = NumeroTextBox.Text;
                ObjUsuario.Cep = CEPTextBox.Text;
                ObjUsuario.Telefone = TelefoneTextBox.Text;
                ObjUsuario.ObjRegiao.Id = Convert.ToInt32(DropDownListArea.SelectedValue);

                MsgLabel.Text = new ManterUsuario(ObjUsuario).CadastraUsuario();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void DropDownListTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListArea.DataSource = new ManterRegiaoAtendimento().ConsultaRegiaoAtendimentos();
            DropDownListArea.DataTextField = "Regiao";
            DropDownListArea.DataValueField = "Id";
            DropDownListArea.DataBind();
            DropDownListArea.Items.Insert(0, new ListItem("Selecione a regiao", "0"));

            DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidades();
            DropDownListEspec.DataTextField = "NomeEspec";
            DropDownListEspec.DataValueField = "Id";
            DropDownListEspec.DataBind();
            DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
        }
    }
}
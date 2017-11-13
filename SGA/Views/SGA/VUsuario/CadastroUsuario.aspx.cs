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
        public int IdEmpresa;
        bool ValidaInfo;
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IdEmpresa = (int)(Session["idEmpresa"]);

                if (!Page.IsPostBack)
                {
                    Mensagem = "Cadastro de usuário.";
                    DropDownListTipo.DataSource = new ManterUsuario().GetRegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));
                }

            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void BotaoCriarUsuario_OnClick(object sender, EventArgs e)
        {
            try
            {
                if (DropDownListTipo.Text.Equals("Administrador"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                    ValidaInfo = true;
                }
                else if (DropDownListTipo.Text.Equals("Técnico") && DropDownListEspec.SelectedIndex > 0 && DropDownListArea.SelectedIndex > 0)
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                    ObjUsuario.ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    ValidaInfo = true;

                    if (!IdEmpresa.Equals(0) || !IdEmpresa.Equals(null))
                    {
                        ObjUsuario.IdEmpresa = (int)(Session["idEmpresa"]);
                    }
                    else
                    {
                        ObjUsuario.IdEmpresa = Convert.ToInt32(DropDownListEmpresa.SelectedValue);
                    }

                }
                else if (DropDownListTipo.Text.Equals("Gestor") || DropDownListTipo.Text.Equals("Atendente"))
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                    ValidaInfo = true;

                    if (!IdEmpresa.Equals(0) || !IdEmpresa.Equals(null))
                    {
                        ObjUsuario.IdEmpresa = (int)(Session["idEmpresa"]);
                    }
                    else
                    {
                        ObjUsuario.IdEmpresa = Convert.ToInt32(DropDownListEmpresa.SelectedValue);
                    }
                }
                else if (DropDownListTipo.Text.Equals("Cliente Físico") && DropDownListArea.SelectedIndex > 0)
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteFisico);
                    ObjUsuario.ObjCF.DocIdent = Doc.Value;
                    ObjUsuario.ObjCF.OrgEmiss = EmissDoc.Value;
                    ObjUsuario.ObjCF.Cpf = CPF.Value;
                    ValidaInfo = true;
                }
                else if (DropDownListTipo.Text.Equals("Cliente Jurídico") && DropDownListArea.SelectedIndex > 0)
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteJuridico);
                    ObjUsuario.ObjCJ.Cnpj = CNPJ.Value;
                    ValidaInfo = true;
                }
                else
                {
                    ValidaInfo = false;
                }

                if (ValidaInfo)
                {
                    ObjUsuario.Login = UserName.Value;
                    ObjUsuario.Senha = Password.Value;
                    ObjUsuario.Email = Email.Value;
                    ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                    ObjUsuario.Nome = Nome.Value;
                    ObjUsuario.Endereco = Endereco.Value;
                    ObjUsuario.Numero = Complemento.Value;
                    ObjUsuario.Cep = CEP.Value;
                    ObjUsuario.Telefone = Telefone.Value;
                    ObjUsuario.ObjRegiao.Id = Convert.ToInt32(DropDownListArea.SelectedValue);

                    Mensagem = new ManterUsuario(ObjUsuario).CadastraUsuario();
                }else
                {
                    Mensagem = "Informações obrigatórias não preenchidas.";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void DropDownListTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
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

                DropDownListEmpresa.DataSource = new ManterEmpresa().ConsultaEmpresas();
                DropDownListEmpresa.DataTextField = "NomeEmpresa";
                DropDownListEmpresa.DataValueField = "Id";
                DropDownListEmpresa.DataBind();
                DropDownListEmpresa.Items.Insert(0, new ListItem("Selecione a empresa", "0"));
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
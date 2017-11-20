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
using SGA.Models.Validacoes;

namespace SGA.Views.SGA.VUsuario
{
    public partial class Cadastro : System.Web.UI.Page
    {
        Usuario ObjUsuario;
        public int IdEmpresa;
        bool ValidaInfo;
        bool CPFValido;
        bool CNPJValido;
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

                    Endereco.Disabled = true;

                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                }

            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
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

                    CPFValido = ValidaDocumento.ValidaCPF(CPF.Value);

                    if (CPFValido)
                    {
                        ObjUsuario.ObjCF.Cpf = CPF.Value;
                        ValidaInfo = true;
                    }
                    else
                    {
                        CNPJValido = true;
                        ValidaInfo = false;
                    }
                }
                else if (DropDownListTipo.Text.Equals("Cliente Jurídico") && DropDownListArea.SelectedIndex > 0)
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioClienteJuridico);
                    CNPJValido = ValidaDocumento.ValidaCNPJ(CNPJ.Value);

                    if (CNPJValido)
                    {
                        ObjUsuario.ObjCJ.Cnpj = CNPJ.Value;
                        ValidaInfo = true;
                    }
                    else
                    {
                        CPFValido = true;
                        ValidaInfo = false;
                    }
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
                    ObjUsuario.Endereco = ValidaCEP.GetCEPCorreios(CEP.Value);
                    ObjUsuario.Complemento = Complemento.Value;
                    ObjUsuario.Cep = CEP.Value;
                    ObjUsuario.Telefone = Telefone.Value;
                    ObjUsuario.ObjRegiao.Id = Convert.ToInt32(DropDownListArea.SelectedValue);

                    if (ObjUsuario.Endereco != null)
                    {
                        Mensagem = new ManterUsuario(ObjUsuario).CadastraUsuario();

                        if (Mensagem.Equals("Usuário cadastrado com sucesso!"))
                        {
                            Endereco.Disabled = false;
                            Endereco.Value = ObjUsuario.Endereco;
                            ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                        }
                    }
                    else
                    {
                        Mensagem = "CEP inválido ou incorreto. Favor verificar.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                }
                else
                {
                    if (!CPFValido)
                    {
                        Mensagem = "O CPF é invalido. Favor verificar.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else if (!CNPJValido)
                    {
                        Mensagem = "O CNPJ é invalido. Favor verificar.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Informações obrigatórias não preenchidas.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }

                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
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
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
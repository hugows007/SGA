using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VUsuario
{
    public partial class RelacionamentoUsrEspec : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();
        List<string> Perfis = new List<string>();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Mensagem = "Relacionamento de usuário e especialidade.";
                    Perfis.Add("Técnico");
                    Perfis.Add("Cliente");

                    DropDownListTipo.DataSource = new ManterUsuario().GetRegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Administrador"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Atendente"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Gestor"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Cliente Físico"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Cliente Jurídico"));
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                    DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidades();
                    DropDownListEspec.DataTextField = "NomeEspec";
                    DropDownListEspec.DataValueField = "Id";
                    DropDownListEspec.DataBind();
                    DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
                }
            }
        }

        protected void DropDownListTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Perfis.Add(DropDownListTipo.SelectedItem.Text);

                DropDownListUsuario.DataSource = new ManterUsuario().ConsultaUsuariosByPerfil(Perfis);
                DropDownListUsuario.DataTextField = "Nome";
                DropDownListUsuario.DataValueField = "Id";
                DropDownListUsuario.DataBind();
                DropDownListUsuario.Items.Insert(0, new ListItem("Selecione o usuário", "0"));
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void RelacionarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if(DropDownListTipo.SelectedIndex > 0 && DropDownListEspec.SelectedIndex > 0)
                {
                    ObjUsuario.Id = Convert.ToInt32(DropDownListUsuario.SelectedValue);
                    ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                    ObjUsuario.ObjEspec.Id = Convert.ToInt32(DropDownListEspec.SelectedValue);
                    if (new ManterUsuario(ObjUsuario).RelacionaUsuarioEspecialidade())
                    {
                        Mensagem = "Usuário e especialidade relacionados com sucesso.";
                    }
                    else
                    {
                        Mensagem = "Não foi possível relacionar usuário e especialidade.";
                    }
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
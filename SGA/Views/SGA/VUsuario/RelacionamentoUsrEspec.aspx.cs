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
                    if (!Session["perfil"].Equals("Gestor") && !Session["perfil"].Equals("Administrador"))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    Mensagem = "Relacionamento de usuário e especialidade.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    Perfis.Add("Técnico");

                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));
                    DropDownListTipo.Items.Insert(1, new ListItem("Técnico", "1"));

                    DropDownListEspec.DataSource = new ManterEspecialidade().ConsultaEspecialidades();
                    DropDownListEspec.DataTextField = "NomeEspec";
                    DropDownListEspec.DataValueField = "Id";
                    DropDownListEspec.Items.Insert(0, new ListItem("Selecione a especialidade", "0"));
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
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
                DropDownListUsuario.Items.Insert(0, new ListItem("Selecione o usuário", "0"));
                DropDownListUsuario.DataBind();
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
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
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível relacionar usuário e especialidade.";
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
    }
}
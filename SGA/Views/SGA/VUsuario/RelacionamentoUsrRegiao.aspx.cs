using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
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
    public partial class RelacionamentoUsrRegiao : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        RegiaoAtendimento ObjArea = FactoryRegiao.GetNew();
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

                    Mensagem = "Relacionamento de usuário e região.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    Perfis.Add("Técnico");
                    Perfis.Add("Cliente");

                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));
                    DropDownListTipo.Items.Insert(1, new ListItem("Técnico", "1"));
                    DropDownListTipo.Items.Insert(2, new ListItem("Cliente Físico", "2"));
                    DropDownListTipo.Items.Insert(3, new ListItem("Cliente Jurídico", "3"));

                    DropDownListRegiao.DataSource = new ManterRegiaoAtendimento().ConsultaRegiaoAtendimentos();
                    DropDownListRegiao.DataTextField = "Regiao";
                    DropDownListRegiao.DataValueField = "Id";
                    DropDownListRegiao.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
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
                DropDownListUsuario.DataBind();
                DropDownListUsuario.Items.Insert(0, new ListItem("Selecione o usuário", "0"));
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
                if(DropDownListUsuario.SelectedIndex > 0 && DropDownListRegiao.SelectedIndex > 0)
                {
                    ObjUsuario.Id = Convert.ToInt32(DropDownListUsuario.SelectedValue);
                    ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                    ObjUsuario.ObjRegiao.Id = Convert.ToInt32(DropDownListRegiao.SelectedValue);
                    if (new ManterUsuario(ObjUsuario).RelacionaUsuarioAreaAtendimento())
                    {
                        Mensagem = "Usuário e região relacionados com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível relacionar usuário e região.";
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
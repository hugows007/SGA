using SGA.Models.AreaAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
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
    public partial class RelacionamentoUsrGpAtend : System.Web.UI.Page
    {
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
        List<string> Perfis = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Perfis.Add("Técnico");
                    Perfis.Add("Cliente");

                    DropDownListTipo.DataSource = new ManterUsuario().RegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Administrador"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Atendente"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Gestor"));
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                    DropDownListGrupo.DataSource = new ManterGrupoAtendimento().ConsultaGrupoAtendimentos();
                    DropDownListGrupo.DataTextField = "NomeGpAtendimento";
                    DropDownListGrupo.DataValueField = "Id";
                    DropDownListGrupo.DataBind();
                    DropDownListGrupo.Items.Insert(0, new ListItem("Selecione o grupo", "0"));
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
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
                DropDownListUsuario.Items.Insert(0, new ListItem("Selecione o cliente", "0"));
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }

        protected void RelacionarButton_Click(object sender, EventArgs e)
        {
            try
            {
                ObjUsuario.Id = Convert.ToInt32(DropDownListUsuario.SelectedValue);
                ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                ObjGpAtend.Id = Convert.ToInt32(DropDownListGrupo.SelectedValue);
                MsgLabel.Text = new ManterUsuario(ObjUsuario, ObjGpAtend).RelacionaUsuarioGrupoAtendimento();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
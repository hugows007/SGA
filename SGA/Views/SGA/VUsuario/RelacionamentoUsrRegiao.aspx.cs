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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Perfis.Add("Técnico");
                    Perfis.Add("Cliente");

                    DropDownListTipo.DataSource = new ManterUsuario().GetRegrasUsuario();
                    DropDownListTipo.DataBind();
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Administrador"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Atendente"));
                    DropDownListTipo.Items.Remove(DropDownListTipo.Items.FindByValue("Gestor"));
                    DropDownListTipo.Items.Insert(0, new ListItem("Selecione o tipo de usuário", "0"));

                    DropDownListRegiao.DataSource = new ManterRegiaoAtendimento().ConsultaRegiaoAtendimentos();
                    DropDownListRegiao.DataTextField = "Regiao";
                    DropDownListRegiao.DataValueField = "Id";
                    DropDownListRegiao.DataBind();
                    DropDownListRegiao.Items.Insert(0, new ListItem("Selecione a regiao", "0"));
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
                ObjUsuario.Id = Convert.ToInt32(DropDownListUsuario.SelectedValue);
                ObjUsuario.Regra = DropDownListTipo.SelectedValue;
                ObjUsuario.ObjRegiao.Id = Convert.ToInt32(DropDownListRegiao.SelectedValue);
                if(new ManterUsuario(ObjUsuario).RelacionaUsuarioAreaAtendimento())
                {
                    MsgLabel.Text = "Usuário e região relacionados com sucesso.";
                }
                else
                {
                    MsgLabel.Text = "Não foi possível relacionar usuário e região.";
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
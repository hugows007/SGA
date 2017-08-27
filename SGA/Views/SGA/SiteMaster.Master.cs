using SGA.Models;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public string NomeUsuario;
        public Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

        protected void Page_Init(object sender, EventArgs e)
        {
            this.ID = "Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("\\Views\\Login\\Login.aspx");
            }
            else
            {
                ObjUsuario.Login = Membership.GetUser().ToString();
                ObjUsuario = new ManterUsuario(ObjUsuario).GetUsuarioEmpresa();

                Session["id"] = ObjUsuario.Id;
                Session["usuario"] = ObjUsuario.Login;
                Session["nome"] = ObjUsuario.Nome;
                Session["empresa"] = ObjUsuario.NomeEmpresa;
                Session["idEmpresa"] = ObjUsuario.IdEmpresa;
                Session["perfil"] = Roles.GetRolesForUser(ObjUsuario.Login)[0];

                InfoGlobal.GlobalIdEmpresa = ObjUsuario.IdEmpresa;

                Page.Header.DataBind();
                NomeUsuario = (string)(Session["nome"]);
            }
        }

        protected void PesqButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + IdChamado.Text);
        }
    }
}
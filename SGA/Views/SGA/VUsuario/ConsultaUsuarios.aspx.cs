using SGA.Models;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VUsuario
{
    public partial class ConsultaUsuario : System.Web.UI.Page
    {
        public List<Usuario> ListaUsrSelect = new List<Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario Usuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

            foreach (var ObjUsr in new ManterUsuario(Usuario).ConsultaUsuarios())
            {
                ListaUsrSelect.Add(ObjUsr);
            }

            if (Request.QueryString["OpInat"] != null && Request.QueryString["OpInat"].Equals("True"))
            {
                MsgLabel.Text = "Usuário inativado com sucesso!";
            }
        }
    }
}

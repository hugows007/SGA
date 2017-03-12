using SGA.Models;
using SGA.Models.Usuario;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.Usuario
{
    public partial class ConsultaUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IUsuario Usuario = FactoryClass.GetNew(TipoFactory.Usuario);

            foreach (var Result in new CadastroUsuarios(Usuario).ConsultaUsuarios())
            {
                LitUsrList.Text += Result;
            }
        }
    }
}
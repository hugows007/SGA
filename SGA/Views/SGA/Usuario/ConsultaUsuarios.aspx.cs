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

            DataTable dt = new DataTable();
            DataRow dr = dt.NewRow();

            if (!IsPostBack)
            {
                dt.Columns.Add("Nome", System.Type.GetType("System.String"));
                dt.Columns.Add("Endereco", System.Type.GetType("System.String"));
                dt.Columns.Add("Numero", System.Type.GetType("System.String"));
                dt.Columns.Add("Cep", System.Type.GetType("System.String"));
                dt.Columns.Add("Telefone", System.Type.GetType("System.String"));
            }

            IUsuario Usuario = null;
            Usuario = FactoryClass.GetNew(TipoFactory.Usuario);

            foreach (var a in new CadastroUsuarios(Usuario).ConsultaUsuarios())
            {
                dr["Nome"] = a.Nome;
                dr["Endereco"] = a.Endereco;
                dr["Numero"] = a.Numero;
                dr["Cep"] = a.Cep;
                dr["Telefone"] = a.Telefone;
                dt.ImportRow(dr);
            }
            GridViewUsuarios.DataSource = new CadastroUsuarios(Usuario).ConsultaUsuarios();
            GridViewUsuarios.DataBind();

        }
    }
}
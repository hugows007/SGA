using SGA.Models.Atendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VChamado
{
    public partial class AlterarTecnico : System.Web.UI.Page
    {
        Atendimento ObjAtend = FactoryAtendimento.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.QueryString["Chamado"].Equals("") && !Request.QueryString["Tecnico"].Equals(""))
            {
                ObjAtend.IdChamado = Convert.ToInt32(Request.QueryString["Chamado"]);
                ObjAtend.IdTecnico = Convert.ToInt32(Request.QueryString["Tecnico"]);

                if (new ManterAtendimento(ObjAtend).AlterarTecnicoAtendimento())
                {
                    Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjAtend.IdChamado + "&Troca=true", false);
                }
            }
        }
    }
}
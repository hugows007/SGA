using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.Chamados.StatusChamados;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VAtendimento
{
    public partial class IniciaAtendimento : System.Web.UI.Page
    {
        Atendimento ObjAtend = FactoryAtendimento.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["perfil"].Equals("Técnico") && !Session["perfil"].Equals("Administrador"))
                {
                    Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                }
                if (!"".Equals(Request.QueryString["IdChamado"]) && !"".Equals(Request.QueryString["StatusChamado"]) && !"Cancelado".Equals(Request.QueryString["StatusChamado"]))
                {
                    ObjAtend.IdChamado = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    ObjAtend.IdTecnico = (int)(Session["id"]);

                    if (new ManterAtendimento(ObjAtend).IniciaAtendimento())
                    {
                        Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + ObjAtend.IdChamado, false);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
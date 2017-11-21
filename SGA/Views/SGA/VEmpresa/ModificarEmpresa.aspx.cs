using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VEmpresa
{
    public partial class ModificarEmpresa : System.Web.UI.Page
    {
        Empresa ObjEmpresa = FactoryEmpresa.GetNew();
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

                    Mensagem = "Alteração de informação de uma empresa.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjEmpresa.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjEmpresa = new ManterEmpresa(ObjEmpresa).ConsultaEmpresaById();

                        Empresa.Value = ObjEmpresa.NomeEmpresa;
                        Endereco.Value = ObjEmpresa.Endereco;
                        Complemento.Value = ObjEmpresa.Complemento;
                        CEP.Value = ObjEmpresa.Cep;
                        Telefone.Value = ObjEmpresa.Telefone;
                    }
                }
                catch (Exception Ex)
                {
                    LogException.InsereLogBd(Ex);
                    MsgLabel.Text = LogException.CodigoErroBd();
                }
            }
        }

        protected void AlterarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ObjEmpresa.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjEmpresa.NomeEmpresa = Empresa.Value;
                    ObjEmpresa.Endereco = Endereco.Value;
                    ObjEmpresa.Complemento = Complemento.Value;
                    ObjEmpresa.Cep = CEP.Value;
                    ObjEmpresa.Telefone = Telefone.Value;

                    if (new ManterEmpresa(ObjEmpresa).AlteraEmpresa())
                    {
                        Mensagem = "Empresa alterada com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar a especialidade.";
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
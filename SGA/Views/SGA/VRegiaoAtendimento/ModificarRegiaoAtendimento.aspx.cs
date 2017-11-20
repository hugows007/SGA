using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRegiaoAtendimento
{
    public partial class ModificarRegiaoAtendimento : System.Web.UI.Page
    {
        RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (!Session["perfil"].Equals("Gestor") || !Session["perfil"].Equals("Administrador"))
                    {
                        Response.Redirect("\\Views\\SGA\\Inicio.aspx", false);
                    }

                    Mensagem = "Alteração de informações da região de atendimento.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);

                    if (Request.QueryString["Id"] != null)
                    {
                        ObjRegiao.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjRegiao = new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentoById();

                        Regiao.Value = ObjRegiao.Regiao;
                        Cidade.Value = ObjRegiao.Cidade;
                        Estado.Value = ObjRegiao.Estado;
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
                    ObjRegiao.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjRegiao.Regiao = Regiao.Value;
                    ObjRegiao.Cidade = Cidade.Value;
                    ObjRegiao.Estado = Estado.Value;

                    if(new ManterRegiaoAtendimento(ObjRegiao).AlteraRegiaoAtendimento())
                    {
                        Mensagem = "Região de atendimento alterada com sucesso.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "Alerta('" + Mensagem + "')", true);
                    }
                    else
                    {
                        Mensagem = "Não foi possível alterar a região de atendimento.";
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
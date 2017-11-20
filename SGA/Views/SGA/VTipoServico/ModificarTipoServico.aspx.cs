using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VTipoServico
{
    public partial class ModificarTipoServico : System.Web.UI.Page
    {
        TipoServico ObjTpServico = FactoryServico.GetNewTpServico();
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        Mensagem = "Alteração de informações de um serviço.";

                        ObjTpServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                        ObjTpServico = new ManterServico(ObjTpServico).ConsultaTpServicoById();
                        Nome.Value = ObjTpServico.NomeTipoServ;
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
                    ObjTpServico.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    ObjTpServico.NomeTipoServ = Nome.Value;

                    if (new ManterServico(ObjTpServico).AlteraTipoServico())
                    {
                        Mensagem = "Tipo de serviço modificado com sucesso.";
                    }
                    else
                    {
                        Mensagem = "Não foi possível modificar o tipo de serviço.";
                    }
                }else
                {
                    Mensagem = "Selecione todas as opções.";
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
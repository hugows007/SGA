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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        ObjRegiao.Id = Convert.ToInt32(Request.QueryString["Id"]);

                        ObjRegiao = new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentoById();

                        RegiaoTextBox.Text = ObjRegiao.Regiao;
                        CidadeTextBox.Text = ObjRegiao.Cidade;
                        EstadoTextBox.Text = ObjRegiao.Estado;
                    }
                }
                catch (Exception Ex)
                {
                    new LogException(Ex).InsereLogBd();
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
                    ObjRegiao.Regiao = RegiaoTextBox.Text;
                    ObjRegiao.Cidade = CidadeTextBox.Text;
                    ObjRegiao.Estado = EstadoTextBox.Text;

                    if(new ManterRegiaoAtendimento(ObjRegiao).AlteraRegiaoAtendimento())
                    {
                        MsgLabel.Text = "Região de atendimento alterada com sucesso.";
                    }
                    else
                    {
                        MsgLabel.Text = "Não foi possível alterar a região de atendimento.";
                    }
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
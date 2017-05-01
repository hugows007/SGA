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
    public partial class ConsultaRegiaoAtendimentos : System.Web.UI.Page
    {
        public List<RegiaoAtendimento> ListaAreaSelect = new List<RegiaoAtendimento>();
        RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjAT in new ManterRegiaoAtendimento(ObjRegiao).ConsultaRegiaoAtendimentos())
                {
                    ListaAreaSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatArea"] != null && Request.QueryString["OpInatArea"].Equals("True"))
                {
                    MsgLabel.Text = "Área inativada com sucesso!";
                }
                else if (Request.QueryString["OpInatArea"] != null && Request.QueryString["OpInatArea"].Equals("False"))
                {
                    MsgLabel.Text = "Ocorreu um erro ao inativar a área!";
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
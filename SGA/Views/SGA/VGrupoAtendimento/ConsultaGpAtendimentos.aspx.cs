using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VGrupoAtendimento
{
    public partial class ConsultaGpsAtendimentos : System.Web.UI.Page
    {
        public List<GrupoAtendimento> ListaGpSelect = new List<GrupoAtendimento>();
        GrupoAtendimento ObjGpAtend = FactoryGrupoAtendimento.GetNew();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjAT in new ManterGrupoAtendimento(ObjGpAtend).ConsultaGrupoAtendimentos())
                {
                    ListaGpSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatGrupoAtendimento"] != null && Request.QueryString["OpInatGrupoAtendimento"].Equals("True"))
                {
                    MsgLabel.Text = "Grupo de Atendimento inativado com sucesso!";
                }
                else if (Request.QueryString["OpInatGrupoAtendimento"] != null && Request.QueryString["OpInatGrupoAtendimento"].Equals("False"))
                {
                    MsgLabel.Text = "Ocorreu um erro ao inativar o Grupo de Atendimento!";
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
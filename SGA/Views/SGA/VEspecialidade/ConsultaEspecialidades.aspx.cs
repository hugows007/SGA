using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;

namespace SGA.Views.SGA.VEspecialidade
{
    public partial class ConsultaEspecialidades : System.Web.UI.Page
    {
        public List<Especialidade> ListaEspecSelect = new List<Especialidade>();
        Especialidade ObjEspec = FactoryEspecialidade.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjAT in new ManterEspecialidade(ObjEspec).ConsultaEspecialidades())
                {
                    ListaEspecSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatEspecialidade"] != null && Request.QueryString["OpInatEspecialidade"].Equals("True"))
                {
                    MsgLabel.Text = "Especialidade inativada com sucesso!";
                }
                else if (Request.QueryString["OpInatEspecialidade"] != null && Request.QueryString["OpInatEspecialidade"].Equals("False"))
                {
                    MsgLabel.Text = "Ocorreu um erro ao inativar a especialidade!";
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = "Erro interno - Mensagem técnica: consulte o log de exceções tratadas com data de: " + DateTime.Now;
            }
        }
    }
}
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Setores;
using System;
using System.Collections.Generic;

namespace SGA.Views.SGA.VSetor
{
    public partial class ConsultaSetores : System.Web.UI.Page
    {
        public List<Setor> ListaSetorSelect = new List<Setor>();
        Setor ObjSetor = FactorySetor.GetNew();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjAT in new ManterSetor(ObjSetor).ConsultaSetores())
                {
                    ListaSetorSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatSetor"] != null && Request.QueryString["OpInatSetor"].Equals("True"))
                {
                    MsgLabel.Text = "Setor inativado com sucesso!";
                }
                else if (Request.QueryString["OpInatSetor"] != null && Request.QueryString["OpInatSetor"].Equals("False"))
                {
                    MsgLabel.Text = "Ocorreu um erro ao inativar o setor!";
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
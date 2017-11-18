using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;

namespace SGA.Views.SGA.VEmpresa
{
    public partial class ConsultaEmpresas : System.Web.UI.Page
    {
        public List<Empresa> ListaEmpresaSelect = new List<Empresa>();
        Empresa ObjEmpresa = FactoryEmpresa.GetNew();
        public string Mensagem;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Mensagem = "Consulta de empresas.";

                foreach (var ObjAT in new ManterEmpresa(ObjEmpresa).ConsultaEmpresas())
                {
                    ListaEmpresaSelect.Add(ObjAT);
                }

                if (Request.QueryString["OpInatEmpresa"] != null && Request.QueryString["OpInatEmpresa"].Equals("True"))
                {
                    Mensagem = "Empresa inativada com sucesso!";
                }
                else if (Request.QueryString["OpInatEmpresa"] != null && Request.QueryString["OpInatEmpresa"].Equals("False"))
                {
                    Mensagem = "Ocorreu um erro ao inativar a especialidade!";
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
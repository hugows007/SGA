using SGA.Models.DAO.Log;
using SGA.Models.Geos;
using SGA.Models.Manter;
using SGA.Models.Relatorios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.Site
{
    public partial class Inicio : System.Web.UI.Page
    {

        public Relatorio ObjRelatorio = FactoryRelatorio.GetNew();
        public Relatorio ObjRelatorioDonut = FactoryRelatorio.GetNew();
        public Relatorio ObjRelatorioChart = FactoryRelatorio.GetNew();
        public List<Relatorio> ListRelat = new List<Relatorio>();
        public List<Relatorio> ListAtend = new List<Relatorio>();

        List<Relatorio> ListAux;
        int Count;

        Geo ObjGeo = FactoryGeo.GetNew();
        public List<Geo> ListaGeo = new List<Geo>();
        public int QtdChamAbertos;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ListaGeo = new ManterGeo(ObjGeo).InformaGeo();

                foreach (var Lista in new ManterRelatorio(ObjRelatorio).GetQtdChamados())
                {
                    ObjRelatorio = Lista;
                }

                ObjRelatorioDonut.RelatMes = true;

                foreach (var Lista in new ManterRelatorio(ObjRelatorioDonut).GetQtdChamados())
                {
                    ObjRelatorioDonut = Lista;
                }

                ObjRelatorioChart.RelatAno = true;

                ListAux = new List<Relatorio>();
                ListAux = new ManterRelatorio(ObjRelatorioChart).GetQtdChamados();
                Count = 0;

                foreach (var Lista in ListAux)
                {
                    Relatorio Obj = FactoryRelatorio.GetNew();

                    if (Lista.Status.Equals(1))
                    {
                        Obj.Mes = Lista.Mes;
                        Obj.QtdChamadosAber = Lista.QtdChamadosAber;
                    }

                    if (!ListAux.Count.Equals(Count + 1))
                    {
                        if (ListAux[Count + 1].Mes.Equals(Obj.Mes) && ListAux[Count + 1].Status.Equals(3))
                        {
                            Obj.QtdChamadosConc = ListAux[Count + 1].QtdChamadosConc;
                        }
                    }


                    ListRelat.Add(Obj);
                    Count += 1;
                }

                foreach (var Lista in new ManterRelatorio(ObjRelatorio).GetTopTecnicos())
                {
                    ListAtend.Add(Lista);
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
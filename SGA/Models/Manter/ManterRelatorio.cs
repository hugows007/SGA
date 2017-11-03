using SGA.Models.DAO.ManterDAO;
using SGA.Models.Relatorios;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterRelatorio
    {
        Relatorio ObjRelatorio;

        public ManterRelatorio()
        {

        }
        public ManterRelatorio(Relatorio ObjRelatorio)
        {
            this.ObjRelatorio = ObjRelatorio;
        }

        public List<Relatorio> GetQtdChamados()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetQtdChamadosDAO();
        }

        public List<Relatorio> GetTopTecnicos()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetTopTecnicosDAO();
        }
        public List<Relatorio> GetTopSolucoes()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetTopSolucoesDAO();
        }
        public List<Relatorio> GetRelatorioChamados()
        {
            switch (ObjRelatorio.FiltroRelatorio)
            {
                case "":
                    ObjRelatorio.FiltroRelatorio = "";
                    break;
                case "a":
                    ObjRelatorio.FiltroRelatorio = "";
                    break;
                default:
                    ObjRelatorio.FiltroRelatorio = "";
                    break;
            }
            return new ManterRelatorioDAO(ObjRelatorio).GetRelatorioChamadosDAO();
        }

        public Relatorio GetTempoMedioAtendimento()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetTempoMedioAtendimentoDAO();
        }
        public List<Relatorio> GetAtendimentoPorRegiao()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetAtendimentoPorRegiaoDAO();
        }
    }
}
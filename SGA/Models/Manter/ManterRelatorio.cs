using SGA.Models.DAO.ManterDAO;
using SGA.Models.Relatorios;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterRelatorio : Relatorio
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
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetQtdChamadosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Relatorio> GetTopTecnicos()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetTopTecnicosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetTopSolucoes()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetTopSolucoesDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetQtdPorServico()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetQtdPorServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Relatorio> GetRelatorioChamados()
        {
            try
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
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetGetRelatorioSLA()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetRelatorioSLADAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioTempoAtendimento()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetRelatorioTempoAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioRecusaAtendimento()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetRelatorioRecusaAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Relatorio GetTempoMedioAtendimento()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetTempoMedioAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Relatorio> GetAtendimentoPorRegiao()
        {
            try
            {
                return new ManterRelatorioDAO(ObjRelatorio).GetAtendimentoPorRegiaoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
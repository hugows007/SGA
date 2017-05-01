using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.RegiaoAtendimentos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterRegiaoAtendimento
    {
        public RegiaoAtendimento ObjRegiao;
        public ManterRegiaoAtendimento()
        {

        }
        public ManterRegiaoAtendimento(RegiaoAtendimento ObjArea)
        {
            this.ObjRegiao = ObjArea;
        }
        public List<RegiaoAtendimento> ConsultaRegiaoAtendimentos()
        {
            return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentosDAO();
        }
        public RegiaoAtendimento ConsultaRegiaoAtendimentoById()
        {
            return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentoByIdDAO();
        }
        public bool CadastraRegiaoAtendimento()
        {
            try
            {
                if (new ManterRegiaoAtendimentoDAO(ObjRegiao).CadastraRegiaoAtendimentoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public bool AlteraRegiaoAtendimento()
        {
            try
            {
                if (new ManterRegiaoAtendimentoDAO(ObjRegiao).AlteraRegiaoAtendimentoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public bool InativarRegiaoAtendimento()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).InativarRegiaoAtendimentoDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
    }
}
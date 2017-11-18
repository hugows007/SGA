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
    public class ManterRegiaoAtendimento : RegiaoAtendimento
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
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public RegiaoAtendimento ConsultaRegiaoAtendimentoById()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentoByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraRegiaoAtendimento()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).CadastraRegiaoAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraRegiaoAtendimento()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).AlteraRegiaoAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool InativarRegiaoAtendimento()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).InativarRegiaoAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
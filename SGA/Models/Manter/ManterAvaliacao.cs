using SGA.Models.Avaliacoes;
using SGA.Models.Chamados;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterAvaliacao
    {
        Avaliacao ObjAvaliacao;

        public ManterAvaliacao()
        {

        }
        public ManterAvaliacao(Avaliacao ObjAvaliacao)
        {
            this.ObjAvaliacao = ObjAvaliacao;
        }
        public bool IncluiAvaliacao()
        {
            try
            {
                if (new ManterAvaliacaoDAO(ObjAvaliacao).IncluiAvaliacaoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool IncluiAvaliacaoSolucao()
        {
            try
            {
                if (new ManterAvaliacaoDAO(ObjAvaliacao).IncluiAvaliacaoSolucaoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
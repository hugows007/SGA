using SGA.Models.Avaliacoes;
using SGA.Models.Chamados;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterAvaliacao : Avaliacao
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
                return new ManterAvaliacaoDAO(ObjAvaliacao).IncluiAvaliacaoDAO();
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
                return new ManterAvaliacaoDAO(ObjAvaliacao).IncluiAvaliacaoSolucaoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
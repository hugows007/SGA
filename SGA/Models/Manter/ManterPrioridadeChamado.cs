using SGA.Models.Chamados.PrioridadeChamados;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterPrioridadeChamado : PrioridadeChamado
    {
        PrioridadeChamado ObjPrioridade;
        public ManterPrioridadeChamado(PrioridadeChamado ObjPrioridade)
        {
            this.ObjPrioridade = ObjPrioridade;
        }
        public ManterPrioridadeChamado()
        {

        }
        public PrioridadeChamado ConsultaPrioridadeChamadoById()
        {
            try
            {
                return new ManterPrioridadeChamadoDAO(ObjPrioridade).ConsultaPrioridadeChamadoByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<PrioridadeChamado> ConsultaPrioridadesChamado()
        {
            try
            {
                return new ManterPrioridadeChamadoDAO(ObjPrioridade).ConsultaPrioridadesChamadoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
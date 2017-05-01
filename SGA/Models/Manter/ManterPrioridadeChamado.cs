using SGA.Models.Chamados.PrioridadeChamados;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterPrioridadeChamado
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
            return new ManterPrioridadeChamadoDAO(ObjPrioridade).ConsultaPrioridadeChamadoByIdDAO();
        }
        public List<PrioridadeChamado> ConsultaPrioridadesChamado()
        {
            return new ManterPrioridadeChamadoDAO(ObjPrioridade).ConsultaPrioridadesChamadoDAO();
        }
    }
}
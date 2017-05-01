using SGA.Models.DAO.ManterDAO;
using SGA.Models.Chamados.StatusChamados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterStatusChamado
    {
        StatusChamado ObjStatusChm = null;
        public ManterStatusChamado(StatusChamado ObjStatusChm)
        {
            this.ObjStatusChm = ObjStatusChm;
        }
        public ManterStatusChamado()
        {

        }
        public StatusChamado ConsultaStatusChamadoById()
        {
            return new ManterStatusChamadoDAO(ObjStatusChm).ConsultaStatusChamadoByIdDAO();
        }
    }
}
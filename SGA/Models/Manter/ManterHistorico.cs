using SGA.Models.DAO.ManterDAO;
using SGA.Models.Historicos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterHistorico
    {
        Historico ObjHistorico;
        public ManterHistorico()
        {

        }

        public ManterHistorico(Historico ObjHistorico)
        {
            this.ObjHistorico = ObjHistorico;
        }

        public List<Historico> GetHistorico()
        {
            return new ManterHistoricoDAO(ObjHistorico).GetHistoricoDAO();
        }
    }
}
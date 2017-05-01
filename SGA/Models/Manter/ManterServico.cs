using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterServico
    {
        private Servico ObjServico;
        private TipoServico ObjTpServico;
        public ManterServico()
        {

        }
        public ManterServico(Servico ObjServico)
        {
            this.ObjServico = ObjServico;
        }
        public ManterServico(TipoServico ObjTpServico)
        {
            this.ObjTpServico = ObjTpServico;
        }
        public ManterServico(Servico ObjServico, TipoServico ObjTpServico)
        {
            this.ObjServico = ObjServico;
            this.ObjTpServico = ObjTpServico;
        }
        public List<TipoServico> ConsultaTpServicos()
        {
            return new ManterServicoDAO().ConsultaTpServicosDAO();
        }
        public TipoServico ConsultaTpServicoById()
        {
            return new ManterServicoDAO(ObjServico, ObjTpServico).ConsultaTpServicoByIdDAO();
        }
        public List<Servico> ConsultaServicos()
        {
            return new ManterServicoDAO().ConsultaServicosDAO();
        }
        public List<Servico> ConsultaServicosByTipo()
        {
            return new ManterServicoDAO(ObjServico).ConsultaServicosByTipoDAO();
        }
        public Servico ConsultaServicoById()
        {
            return new ManterServicoDAO(ObjServico).ConsultaServicoByIdDAO();
        }
        public bool CadastraServico()
        {
            try
            {
                if (new ManterServicoDAO(ObjServico).CadastraServicoDAO())
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
        public bool AlteraServico()
        {
            try
            {
                if (new ManterServicoDAO(ObjServico).AlteraServicoDAO())
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
        public bool InativaServico()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).InativaServicoDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
    }
}
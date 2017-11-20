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
    public class ManterServico : Servico
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
            try
            {
                return new ManterServicoDAO().ConsultaTpServicosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public TipoServico ConsultaTpServicoById()
        {
            try
            {
                return new ManterServicoDAO(ObjServico, ObjTpServico).ConsultaTpServicoByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Servico> ConsultaServicos()
        {
            try
            {
                return new ManterServicoDAO().ConsultaServicosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Servico> ConsultaServicosByTipo()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).ConsultaServicosByTipoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Servico ConsultaServicoById()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).ConsultaServicoByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraServico()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).CadastraServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraTpServico()
        {
            try
            {
                return new ManterServicoDAO(ObjTpServico).CadastraTpServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraServico()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).AlteraServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraTipoServico()
        {
            try
            {
                return new ManterServicoDAO(ObjTpServico).AlteraTipoServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool InativaServico()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).InativaServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool InativaTpServico()
        {
            try
            {
                return new ManterServicoDAO(ObjTpServico).InativaTpServicoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
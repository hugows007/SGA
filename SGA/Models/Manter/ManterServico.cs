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
        public string Msg;

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
        public string CadastraServico()
        {
            try
            {
                if (new ManterServicoDAO(ObjServico).CadastraServicoDAO())
                {
                    Msg = "Serviço cadastrado com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao cadastrar o serviço.";
            }

            return Msg;
        }
        public List<Servico> ConsultaServicos()
        {
            return new ManterServicoDAO().ConsultaServicosDAO();
        }
        public List<Servico> ConsultaServicoByTipo()
        {
            return new ManterServicoDAO(ObjServico).ConsultaServicoByTipoDAO();
        }
        public Servico ConsultaServicoById()
        {
            return new ManterServicoDAO(ObjServico).ConsultaServicoByIdDAO();
        }
        public string AlteraServico()
        {
            try
            {
                if (new ManterServicoDAO(ObjServico).AlteraServicoDAO())
                {
                    Msg = "Serviço atualizado com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar o serviço!";
            }

            return Msg;
        }
        public bool InativaServico()
        {
            try
            {
                return new ManterServicoDAO(ObjServico).InativaServicoDAO();
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
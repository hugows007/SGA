using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Empresas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEmpresa : Empresa
    {
        Empresa ObjEmpresa;
        public ManterEmpresa()
        {

        }
        public ManterEmpresa(Empresa ObjEmpresa)
        {
            this.ObjEmpresa = ObjEmpresa;
        }
        public List<Empresa> ConsultaEmpresas()
        {
            try
            {
                return new ManterEmpresaDAO(ObjEmpresa).ConsultaEmpresasDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Empresa ConsultaEmpresaById()
        {
            try
            {
                return new ManterEmpresaDAO(ObjEmpresa).ConsultaEmpresaByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraEmpresa()
        {
            try
            {
                return new ManterEmpresaDAO(ObjEmpresa).CadastraEmpresaDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraEmpresa()
        {
            try
            {
                return new ManterEmpresaDAO(ObjEmpresa).AlteraEmpresaDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool InativaEmpresa()
        {
            try
            {
                return new ManterEmpresaDAO(ObjEmpresa).InativaEmpresaDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
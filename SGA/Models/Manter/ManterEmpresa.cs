using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Empresas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEmpresa
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
            return new ManterEmpresaDAO(ObjEmpresa).ConsultaEmpresasDAO();
        }
        public Empresa ConsultaEmpresaById()
        {
            return new ManterEmpresaDAO(ObjEmpresa).ConsultaEmpresaByIdDAO();
        }
        public bool CadastraEmpresa()
        {
            try
            {
                if (new ManterEmpresaDAO(ObjEmpresa).CadastraEmpresaDAO())
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
        public bool AlteraEmpresa()
        {
            try
            {
                if (new ManterEmpresaDAO(ObjEmpresa).AlteraEmpresaDAO())
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
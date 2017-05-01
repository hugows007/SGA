using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Especialidades;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEspecialidade
    {
        Especialidade ObjEspec;
        Servico ObjServ;
        public ManterEspecialidade()
        {

        }
        public ManterEspecialidade(Especialidade ObjEspec)
        {
            this.ObjEspec = ObjEspec;
        }
        public ManterEspecialidade(Especialidade ObjEspec, Servico ObjServ)
        {
            this.ObjEspec = ObjEspec;
            this.ObjServ = ObjServ;
        }
        public List<Especialidade> ConsultaEspecialidades()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadesDAO();
        }
        public Especialidade ConsultaEspecialidadeById()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadeByIdDAO();
        }
        public bool CadastraEspecialidade()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec).CadastraEspecialidadeDAO())
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
        public bool AlteraEspecialidade()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec).AlteraEspecialidadeDAO())
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
        public bool InativaEspecialidade()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).InativaEspecialidadeDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public bool RelacionaEspecServ()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec, ObjServ).RelacionaEspecServDAO())
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
    }
}
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
    public class ManterEspecialidade : Especialidade
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
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadesDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Especialidade ConsultaEspecialidadeById()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadeByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraEspecialidade()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).CadastraEspecialidadeDAO();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool AlteraEspecialidade()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).AlteraEspecialidadeDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool InativaEspecialidade()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).InativaEspecialidadeDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool RelacionaEspecServ()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec, ObjServ).RelacionaEspecServDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
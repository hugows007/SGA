using SGA.Models.DAO.ManterDAO;
using SGA.Models.Especialidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEspecialidade
    {
        private Especialidade ObjEspec;
        private string Msg;

        public ManterEspecialidade()
        {

        }
        public ManterEspecialidade(Especialidade ObjEspec)
        {
            this.ObjEspec = ObjEspec;
        }
        public SqlDataReader ConsultaEspecialidadesDataReader()
        {
            return new ManterEspecialidadeDAO().ConsultaEspecialidadesDataReaderDAO();
        }
        public string CadastraEspecialidade()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec).CadastraEspecialidadeDAO())
                {
                    Msg = "Especialidade cadastrada com sucesso!";
                }
                else
                {
                    Msg = "Ocorreu um erro ao cadastrar a especialidade!";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar o cadastro da especialidade.";
            }

            return Msg;
        }
        public List<Especialidade> ConsultaEspecialidades()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadesDAO();
        }
        public List<Especialidade> ConsultaEspecialidadeById()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadeByIdDAO();
        }
        public string AlteraEspecialidade()
        {
            if (new ManterEspecialidadeDAO
                       (ObjEspec).AlteraEspecialidadeDAO())
            {
                Msg = "Especialidade atualizada com sucesso!";
            }
            else
            {
                Msg = "Ocorreu um erro ao atualizar a especialidade!";
            }

            return Msg;
        }
        public bool InativaEspecialidade()
        {
            if (new ManterEspecialidadeDAO
          (ObjEspec).InativaEspecialidadeDAO())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
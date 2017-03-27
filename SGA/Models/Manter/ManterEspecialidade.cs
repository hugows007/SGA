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
                    Msg = "Área de atendimento cadastrada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar o cadastro da área de atendimento.";
            }

            return Msg;
        }
        public List<Especialidade> ConsultaEspecialidades()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadesDAO();
        }
        public List<Especialidade> ConsultaAreaAtendimentoById()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadeByIdDAO();
        }
        public string AlteraEspecialidade()
        {
            if (new ManterEspecialidadeDAO
                       (ObjEspec).AlteraEspecialidadeDAO())
            {
                Msg = "Especialidade atualizado com sucesso!";
            }
            else
            {
                Msg = "Ocorreu um erro ao atualizar o Especialidade!";
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
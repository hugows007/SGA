using SGA.Models.DAO.ManterDAO;
using SGA.Models.GrupoAtendimentos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterGrupoAtendimento
    {
        public GrupoAtendimento ObjGpAtend = null;
        public string Msg;
        public ManterGrupoAtendimento()
        {

        }
        public ManterGrupoAtendimento(GrupoAtendimento ObjGpAtend)
        {
            this.ObjGpAtend = ObjGpAtend;
        }
        public List<GrupoAtendimento> ConsultaGrupoAtendimentos()
        {
            return new ManterGrupoAtendimentoDAO(ObjGpAtend).ConsultaGrupoAtendimentosDAO();
        }
        public GrupoAtendimento ConsultaGrupoAtendimentoById()
        {
            return new ManterGrupoAtendimentoDAO(ObjGpAtend).ConsultaGrupoAtendimentoByIdDAO();
        }
        public string CadastraGrupoAtendimento()
        {
            try
            {
                if (new ManterGrupoAtendimentoDAO(ObjGpAtend).CadastraGrupoAtendimentoDAO())
                {
                    Msg = "Grupo de atendimento cadastrado com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar o cadastro do grupo de atendimento.";
            }

            return Msg;
        }
        public string AlteraGrupoAtendimento()
        {
            try
            {
                if (new ManterGrupoAtendimentoDAO(ObjGpAtend).AlteraGrupoAtendimentoDAO())
                {
                    Msg = "Grupo atualizado com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar o Grupo!";
            }

            return Msg;
        }
        public bool InativaGrupoAtendimento()
        {
            try
            {
                return new ManterGrupoAtendimentoDAO(ObjGpAtend).InativaGrupoAtendimentoDAO();
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
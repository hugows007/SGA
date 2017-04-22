using SGA.Models.Atendimentos;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterAtendimento
    {
        Atendimento ObjAtendimento = null;
        public string Msg;
        public ManterAtendimento()
        {

        }
        public ManterAtendimento(Atendimento ObjAtendimento)
        {
            this.ObjAtendimento = ObjAtendimento;
        }
        public List<Atendimento> ConsultaAtendimentos()
        {
            return new ManterAtendimentoDAO(ObjAtendimento).ConsultaAtendimentosDAO();
        }
        public Atendimento ConsultaAtendimentoById()
        {
            return new ManterAtendimentoDAO(ObjAtendimento).ConsultaAtendimentoByIdDAO();
        }
        public string CadastraAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtendimento).CadastraAtendimentoDAO())
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
        public string AlteraAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtendimento).AlteraAtendimentoDAO())
                {
                    Msg = "Área atualizada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar a área!";
            }

            return Msg;
        }
        public bool CancelaAtendimento()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtendimento).CancelaAtendimentoDAO();
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
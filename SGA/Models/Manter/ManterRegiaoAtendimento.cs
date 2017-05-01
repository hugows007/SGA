using SGA.Models.DAO.ManterDAO;
using SGA.Models.RegiaoAtendimentos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterRegiaoAtendimento
    {
        public RegiaoAtendimento ObjRegiao = null;
        public string Msg;
        public ManterRegiaoAtendimento()
        {

        }
        public ManterRegiaoAtendimento(RegiaoAtendimento ObjArea)
        {
            this.ObjRegiao = ObjArea;
        }
        public List<RegiaoAtendimento> ConsultaRegiaoAtendimentos()
        {
            return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentosDAO();
        }
        public RegiaoAtendimento ConsultaRegiaoAtendimentoById()
        {
            return new ManterRegiaoAtendimentoDAO(ObjRegiao).ConsultaRegiaoAtendimentoByIdDAO();
        }
        public string CadastraRegiaoAtendimento()
        {
            try
            {
                if (new ManterRegiaoAtendimentoDAO(ObjRegiao).CadastraRegiaoAtendimentoDAO())
                {
                    Msg = "Região de atendimento cadastrada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar o cadastro da região de atendimento.";
            }

            return Msg;
        }
        public string AlteraRegiaoAtendimento()
        {
            try
            {
                if (new ManterRegiaoAtendimentoDAO(ObjRegiao).AlteraRegiaoAtendimentoDAO())
                {
                    Msg = "Região atualizada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar a região!";
            }

            return Msg;
        }
        public bool InativarRegiaoAtendimento()
        {
            try
            {
                return new ManterRegiaoAtendimentoDAO(ObjRegiao).InativarRegiaoAtendimentoDAO();
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
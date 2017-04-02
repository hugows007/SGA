using SGA.Models.Chamados;
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterChamado
    {
        public Chamado ObjChamado = null;
        public string Msg;
        public ManterChamado()
        {

        }
        public ManterChamado(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public string AbreChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).AbreChamadoDAO())
                {
                    Msg = "Chamado aberto com sucesso - O código do chamado é: " + new ManterChamadoDAO().GetUltIdChamado();
                }
                else
                {
                    Msg = "Ocorreu um erro ao abrir o chamado.";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar a abertura de chamado.";
            }

            return Msg;
        }
        public List<Chamado> ConsultaChamados()
        {
            return new ManterChamadoDAO(ObjChamado).ConsultaChamadosDAO();
        }
        public List<Chamado> ConsultaChamadoById()
        {
            return new ManterChamadoDAO(ObjChamado).ConsultaChamadoByIdDAO();
        }
        public string AlteraChamado()
        {
            if (new ManterChamadoDAO
                       (ObjChamado).AlteraChamadoDAO())
            {
                Msg = "Chamado atualizado com sucesso!";
            }
            else
            {
                Msg = "Ocorreu um erro ao atualizar o chamado!";
            }

            return Msg;
        }
        public bool CancelaChamado()
        {
            if (new ManterChamadoDAO
          (ObjChamado).CancelaChamadoDAO())
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
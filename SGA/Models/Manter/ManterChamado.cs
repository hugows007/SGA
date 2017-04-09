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
        Chamado ObjChamado = null;
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
                    return "Chamado aberto com sucesso! Guarde o número do seu chamado: ";
                }
                else
                {
                    return "Ocorreu um erro ao abrir o chamado. Favor entrar em contato com o suporte técnico.";
                }
            }
            catch (Exception)
            {
                return "Ocorreu um problem não esperado.";
            }
        }
        public List<Chamado> ConsultaChamados()
        {
            return new ManterChamadoDAO(ObjChamado).ConsultaChamadosDAO();
        }
        public Chamado ConsultaChamadoById()
        {
            this.ObjChamado = new ManterChamadoDAO(ObjChamado).ConsultaChamadoByIdDAO();

            if (!0.Equals(ObjChamado.Id))
            {
                return this.ObjChamado;
            }
            else
            {
                Msg = "Chamado não encontrado";
                return null;
            }
        }
        public string AlteraChamado()
        {
            try
            {
                if (new ManterChamadoDAO
                           (ObjChamado).AlteraChamadoDAO())
                {
                    return "Chamado atualizado com sucesso!";
                }
                else
                {
                    return "Ocorreu um erro ao atualizar o chamado!";
                }
            }
            catch (Exception)
            {
                return "Ocorreu um erro não esperado.";
            }
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
        public int GetUltIdChamado()
        {
            return new ManterChamadoDAO().GetUltIdChamadoDAO();
        }
    }
}
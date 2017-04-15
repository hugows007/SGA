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
                    Msg = "Chamado aberto com sucesso! Guarde o número do seu chamado: ";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao abrir o chamado.";
            }

            return Msg;
        }
        public List<Chamado> ConsultaChamados()
        {
            return new ManterChamadoDAO(ObjChamado).ConsultaChamadosDAO();
        }
        public Chamado ConsultaChamadoById()
        {
            try
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
            catch (Exception)
            {
                return null;
            }
        }
        public string AlteraChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).AlteraChamadoDAO())
                {
                    Msg = "Chamado atualizado com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar o chamado.";
            }

            return Msg;
        }
        public bool CancelaChamado()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado).CancelaChamadoDAO();
            }
            catch(Exception)
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
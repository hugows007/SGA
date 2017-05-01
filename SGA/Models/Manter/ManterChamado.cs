using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterChamado
    {
        Chamado ObjChamado;
        Usuario ObjUsuario;
        Atendimento ObjAtend;
        public string Msg;
        public ManterChamado()
        {

        }
        public ManterChamado(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public ManterChamado(Chamado ObjChamado, Usuario ObjUsuario, Atendimento ObjAtend)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
        }
        public string AbreChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).AbreChamadoDAO())
                {
                    ObjChamado.Id = new ManterChamado().GetUltIdChamado();

                    new ManterAtendimento(ObjAtend, ObjUsuario, ObjChamado).CadastraAtendimento();
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

                if (!0.Equals(ObjChamado.Id) && !0.Equals(ObjChamado.IdStatus))
                {
                    return this.ObjChamado;
                }
                else
                {
                    Msg = "Chamado não encontrado ou inexistente.";
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
            catch (Exception)
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
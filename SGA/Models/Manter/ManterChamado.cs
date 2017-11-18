using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterChamado : Chamado
    {
        Chamado ObjChamado;
        Usuario ObjUsuario;
        Atendimento ObjAtend;
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        public ManterChamado()
        {

        }
        public ManterChamado(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public ManterChamado(Chamado ObjChamado, Atendimento ObjAtend)
        {
            this.ObjChamado = ObjChamado;
            this.ObjAtend = ObjAtend;
        }
        public ManterChamado(Chamado ObjChamado, Usuario ObjUsuario)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
        }
        public ManterChamado(Chamado ObjChamado, Usuario ObjUsuario, Atendimento ObjAtend)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
        }
        public bool AbreChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).AbreChamadoDAO())
                {
                    ObjChamado.Id = new ManterChamado().GetUltIdChamado();
                    return new ManterAtendimento(ObjAtend, ObjUsuario, ObjChamado).CadastraAtendimento();
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Chamado> ConsultaChamados()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado, ObjUsuario).ConsultaChamadosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Chamado ConsultaChamadoById()
        {
            try
            {
                ObjChamado = new ManterChamadoDAO(ObjChamado).ConsultaChamadoByIdDAO();

                if (!0.Equals(ObjChamado.Id) && !0.Equals(ObjChamado.IdStatus))
                {
                    return ObjChamado;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AtualizaTramite()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado).AtualizaTramiteDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool ReabreChamado()
        {
            try
            {
                ObjAtend.IdChamado = ObjChamado.Id;
                ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                ObjUsuario.Id = ObjAtend.IdTecnico;
                ObjUsuario.IdStatus = 2;

                if (new ManterChamadoDAO(ObjChamado).ReabreChamadoDAO() && new ManterAtendimento(ObjAtend).CadastraAtendimentoReaberturaChamado() && new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CancelaChamado()
        {
            try
            {
                ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                ObjUsuario.IdStatus = 1;

                if (new ManterChamadoDAO(ObjChamado).CancelaChamadoDAO() && new ManterAtendimento(ObjAtend, ObjChamado).CancelaAtendimento() && new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                {
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 6;
                    ObjNotificacao.IdTipo = 4;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    ObjNotificacao.IdDest = ObjAtend.IdCliente;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool DeletaChamado()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado).DeletaChamadoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int GetUltIdChamado()
        {
            try
            {
                return new ManterChamadoDAO().GetUltIdChamadoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool ValidaTempoFechamento()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado).ValidaTempoFechamentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
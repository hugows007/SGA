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
    public class ManterChamado
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

                    if (new ManterAtendimento(ObjAtend, ObjUsuario, ObjChamado).CadastraAtendimento())
                    {
                        return true;
                    }
                    else
                    {
                        DeletaChamado(); //Remover esse delete de chamado e verificar quando não encontrar o técnico oq farei
                        return false;
                    }
                }
                else
                {
                    DeletaChamado();
                    return false;
                }
            }
            catch (Exception)
            {
                DeletaChamado();

                throw;
            }
        }
        public List<Chamado> ConsultaChamados()
        {
            return new ManterChamadoDAO(ObjChamado, ObjUsuario).ConsultaChamadosDAO();
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
                if (new ManterChamadoDAO(ObjChamado).AtualizaTramiteDAO())
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
        public bool ReabreChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).ReabreChamadoDAO())
                {

                    ObjAtend.IdChamado = ObjChamado.Id;

                    if (new ManterAtendimento(ObjAtend).CadastraAtendimentoReaberturaChamado())
                    {
                        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                        ObjUsuario.Id = ObjAtend.IdTecnico;
                        ObjUsuario.IdStatus = 2;

                        if (new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
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
                if (new ManterChamadoDAO(ObjChamado).CancelaChamadoDAO())
                {
                    if (new ManterAtendimento(ObjAtend, ObjChamado).CancelaAtendimento())
                    {
                        ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

                        ObjUsuario.IdStatus = 1;

                        if (new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                        {
                            //Notificação de atendimento
                            ObjNotificacao.IdOrigem = 0;
                            ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                            ObjNotificacao.Mensagem = InfoGlobal.MensagemChamadoCancelado;
                            new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                            ObjNotificacao.IdDest = ObjAtend.IdCliente;
                            ObjNotificacao.Mensagem = InfoGlobal.MensagemChamadoCancelado;
                            new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
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
            return new ManterChamadoDAO().GetUltIdChamadoDAO();
        }
        public bool ValidaTempoFechamento()
        {
            return new ManterChamadoDAO(ObjChamado).ValidaTempoFechamentoDAO();
        }
    }
}
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
    public class ManterAtendimento : Atendimento
    {
        Atendimento ObjAtend;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        public ManterAtendimento()
        {

        }
        public ManterAtendimento(Atendimento ObjAtend)
        {
            this.ObjAtend = ObjAtend;
        }
        public ManterAtendimento(Atendimento ObjAtend, Usuario ObjUsuario)
        {
            this.ObjAtend = ObjAtend;
            this.ObjUsuario = ObjUsuario;
        }
        public ManterAtendimento(Atendimento ObjAtend, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjAtend = ObjAtend;
        }
        public ManterAtendimento(Atendimento ObjAtend, Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
        }
        public List<Atendimento> ConsultaAtendimentos()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Usuario> ConsultaTecnicoAtendByChamado()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend, ObjUsuario).ConsultaTecnicoAtendByChamadoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Atendimento ConsultaAtendimentoById()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentoByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Atendimento ConsultaAtendimentoByIdChamado()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentoByIdChamadoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CadastraAtendimento()
        {
            try
            {
                ObjAtend.IdTecnico = new ManterUsuario(ObjUsuario, ObjChamado).GetTecnicoByRegiaoEspec().Id;

                ObjAtend.IdChamado = ObjChamado.Id;
                ObjAtend.IdCliente = ObjChamado.IdCliente;
                ObjAtend.IdRegiaoAtendimento = ObjUsuario.ObjRegiao.Id;

                if (new ManterAtendimentoDAO(ObjAtend).CadastraAtendimentoDAO())
                {
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 3;
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
        public bool CadastraAtendimentoReaberturaChamado()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtend).CadastraAtendimentoReaberturaChamadoDAO())
                {
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 8;
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
        public bool RecusaAtendimentoChamado()
        {
            try
            {
                ObjNotificacao.IdOrigem = 0;
                ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                ObjNotificacao.IdMensagem = 9;
                ObjNotificacao.IdTipo = 4;
                new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                ObjAtend.IdTecnico = new ManterAtendimentoDAO(ObjAtend, ObjChamado).RecusaAtendimentoChamadoDAO().IdTecnico;

                ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                ObjUsuario.Id = ObjAtend.IdTecnico;
                ObjUsuario.IdStatus = 2;

                if (ObjAtend != null && new ManterAtendimentoDAO(ObjAtend, ObjChamado).CadastraAtendimentoReaberturaChamadoDAO() && new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                {
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 3;
                    ObjNotificacao.IdTipo = 4;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    foreach (var Gestor in new ManterUsuario(ObjUsuario).ConsultaUsuariosGestores())
                    {
                        ObjNotificacao.IdDest = Gestor.Id;
                        new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();
                    }

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
        public bool AlterarTecnicoAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtend).AlterarTecnicoAtendimentoDAO())
                {
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 3;
                    ObjNotificacao.IdTipo = 4;
                    return new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();
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
        public bool IniciaAtendimento()
        {
            try
            {
                ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                ObjUsuario.Id = ObjAtend.IdTecnico;
                ObjUsuario.IdStatus = 2;

                if (new ManterAtendimentoDAO(ObjAtend).IniciaAtendimentoDAO() && new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                {
                    ObjChamado = FactoryChamado.GetNew();
                    ObjChamado.Id = ObjAtend.IdChamado;
                    ObjChamado = new ManterChamado(ObjChamado).ConsultaChamadoById();
                    ObjAtend.IdCliente = ObjChamado.IdCliente;

                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.IdMensagem = 4;
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
        public bool CancelaAtendimento()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend, ObjChamado).CancelaAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool EncerraAtendimento()
        {
            try
            {
                ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                ObjUsuario.Id = ObjAtend.IdTecnico;
                ObjUsuario.IdStatus = 1;

                if (new ManterAtendimentoDAO(ObjAtend, ObjChamado).EncerraAtendimentoDAO() && new ManterChamadoDAO(ObjChamado).EncerraChamadoDAO() && new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                {
                    if (ObjChamado.Pendencia)
                    {
                        if (new ManterAtendimentoDAO(ObjAtend, ObjChamado).CadastraAtendimentoDAO())
                        {
                            ObjNotificacao.IdOrigem = 0;
                            ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                            ObjNotificacao.IdMensagem = 7;
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
                    else
                    {
                        ObjNotificacao.IdOrigem = 0;
                        ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                        ObjNotificacao.IdMensagem = 5;
                        ObjNotificacao.IdTipo = 4;
                        new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                        ObjNotificacao.IdDest = ObjAtend.IdCliente;
                        new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                        return true;
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
    }
}
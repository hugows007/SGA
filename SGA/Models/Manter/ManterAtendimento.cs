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
    public class ManterAtendimento
    {
        Atendimento ObjAtend;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        public string Msg;
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
            return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentosDAO();
        }
        public List<Usuario> ConsultaTecnicoAtendByChamado()
        {
            return new ManterAtendimentoDAO(ObjAtend, ObjUsuario).ConsultaTecnicoAtendByChamadoDAO();
        }
        public Atendimento ConsultaAtendimentoById()
        {
            return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentoByIdDAO();
        }
        public Atendimento ConsultaAtendimentoByIdChamado()
        {
            return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentoByIdChamadoDAO();
        }
        public bool CadastraAtendimento()
        {
            try
            {
                foreach (var Tecnico in new ManterUsuario(ObjUsuario, ObjChamado).GetTecnicoByRegiaoEspec())
                {
                    ObjAtend.IdTecnico = Tecnico.Id;
                }

                ObjAtend.IdChamado = ObjChamado.Id;
                ObjAtend.IdCliente = ObjChamado.IdCliente;
                ObjAtend.IdRegiaoAtendimento = ObjUsuario.ObjRegiao.Id;

                if (new ManterAtendimentoDAO(ObjAtend).CadastraAtendimentoDAO())
                {
                    //Notificação de atendimento
                    ObjNotificacao.IdOrigem = 0;
                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                    ObjNotificacao.Mensagem = InfoGlobal.MensagemNovoAtendimento;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    ObjNotificacao.IdDest = ObjAtend.IdCliente;
                    ObjNotificacao.Mensagem = InfoGlobal.MensagemNovoAtendimento;
                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                    return true;
                }
                else
                {
                    new ManterChamado(ObjChamado).DeletaChamado();
                    return false;
                }
            }
            catch (Exception)
            {
                new ManterChamado(ObjChamado).DeletaChamado();
                
                throw;
            }
        }
        public bool AlteraAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtend).AlteraAtendimentoDAO())
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
        public bool IniciaAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtend).IniciaAtendimentoDAO())
                {
                    ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                    ObjUsuario.Id = ObjAtend.IdTecnico;

                    ObjUsuario.IdStatus = 2;

                    if (new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                    {
                        ObjChamado = FactoryChamado.GetNew();
                        ObjChamado.Id = ObjAtend.IdChamado;
                        ObjChamado = new ManterChamado(ObjChamado).ConsultaChamadoById();
                        ObjAtend.IdCliente = ObjChamado.IdCliente;

                        //Notificação de atendimento
                        ObjNotificacao.IdOrigem = 0;
                        ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                        ObjNotificacao.Mensagem = InfoGlobal.MensagemInicioAtendimento;
                        new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                        ObjNotificacao.IdDest = ObjAtend.IdCliente;
                        ObjNotificacao.Mensagem = InfoGlobal.MensagemInicioAtendimento;
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
                if (new ManterAtendimentoDAO(ObjAtend, ObjChamado).EncerraAtendimentoDAO())
                {
                    if (new ManterChamadoDAO(ObjChamado).EncerraChamadoDAO())
                    {
                        ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
                        ObjUsuario.Id = ObjAtend.IdTecnico;
                        ObjUsuario.IdStatus = 1;

                        if (new ManterUsuario(ObjUsuario).AlteraDisponibilidade())
                        {
                            if (ObjChamado.Pendencia)
                            {
                                if (new ManterAtendimentoDAO(ObjAtend, ObjChamado).CadastraAtendimentoDAO())
                                {
                                    //Notificação de atendimento
                                    ObjNotificacao.IdOrigem = 0;
                                    ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                                    ObjNotificacao.Mensagem = InfoGlobal.MensagemRetrabalho;
                                    new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                                    ObjNotificacao.IdDest = ObjAtend.IdCliente;
                                    ObjNotificacao.Mensagem = InfoGlobal.MensagemRetrabalho;
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
                                //Notificação de atendimento
                                ObjNotificacao.IdOrigem = 0;
                                ObjNotificacao.IdDest = ObjAtend.IdTecnico;
                                ObjNotificacao.Mensagem = InfoGlobal.MensagemAtendimentoFinalizado;
                                new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                                ObjNotificacao.IdDest = ObjAtend.IdCliente;
                                ObjNotificacao.Mensagem = InfoGlobal.MensagemAtendimentoFinalizado;
                                new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();

                                return true;
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
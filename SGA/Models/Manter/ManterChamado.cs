using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
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
            catch (Exception Ex)
            {
                DeletaChamado();
                new LogException(Ex).InsereLogBd();
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
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public bool AlteraChamado()
        {
            try
            {
                if (new ManterChamadoDAO(ObjChamado).AlteraChamadoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
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
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public bool DeletaChamado()
        {
            try
            {
                return new ManterChamadoDAO(ObjChamado).DeletaChamadoDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public int GetUltIdChamado()
        {
            return new ManterChamadoDAO().GetUltIdChamadoDAO();
        }
        public int GetQtdChamadosStatusAbertos()
        {
            return new ManterChamadoDAO().GetQtdChamadosStatusAbertosDAO();
        }
    }
}
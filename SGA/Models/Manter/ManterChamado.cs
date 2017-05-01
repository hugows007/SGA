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

                    if(new ManterAtendimento(ObjAtend, ObjUsuario, ObjChamado).CadastraAtendimento())
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
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public List<Chamado> ConsultaChamados()
        {
            return new ManterChamadoDAO(ObjChamado).ConsultaChamadosDAO();
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
                return new ManterChamadoDAO(ObjChamado).CancelaChamadoDAO();
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
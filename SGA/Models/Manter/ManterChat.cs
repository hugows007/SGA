using SGA.Models.Chats;
using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterChat
    {
        Chat ObjChat;
        Usuario ObjUsuario;

        public ManterChat()
        {

        }
        public ManterChat(Chat ObjChat)
        {
            this.ObjChat = ObjChat;
        }
        public ManterChat(Chat ObjChat, Usuario ObjUsuario)
        {
            this.ObjChat = ObjChat;
            this.ObjUsuario = ObjUsuario;
        }
        public bool CriaSalaPrivada(Chat ObjChat)
        {
            try
            {
                this.ObjChat = ObjChat;
                return new ManterChatDAO(ObjChat).CriaSalaPrivadaDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public bool GravaChat(Chat ObjChat)
        {
            try
            {
                this.ObjChat = ObjChat;
                return new ManterChatDAO(ObjChat).GravaChatDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public bool GravaChatPrivado(Chat ObjChat)
        {
            try
            {
                this.ObjChat = ObjChat;
                return new ManterChatDAO(ObjChat).GravaChatPrivadoDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public bool ValidaChatCriado()
        {
            try
            {
                return new ManterChatDAO(ObjChat).ValidaChatCriadoDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<Chat> RetornaSalas()
        {
            try
            {
                return new ManterChatDAO(ObjChat).RetornaSalasDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<Chat> RetornaChat()
        {
            try
            {
                return new ManterChatDAO(ObjChat).RetornaChatDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<Chat> RetornaChatPrivado()
        {
            try
            {
                return new ManterChatDAO(ObjChat).RetornaChatPrivadoDAO();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
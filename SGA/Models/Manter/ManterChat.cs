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
        public bool GravaChat(Chat ObjChat)
        {
            try
            {
                this.ObjChat = ObjChat;
                return new ManterChatDAO(ObjChat).GravaChatDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public List<Chat> RetornaChat()
        {
            try
            {
                return new ManterChatDAO(ObjChat).RetornaChatDAO();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
    }
}
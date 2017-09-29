using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chats
{
    public class FactoryChat
    {
        internal static Chat GetNew(TipoChat TpChat)
        {
            Chat ObjChat = null;

            switch (TpChat)
            {
                case TipoChat.Publico:
                    return new Chat();

                case TipoChat.Privado:
                    ObjChat = new Chat();
                    ObjChat.ObjChatPrivado = new ChatPrivado();
                    return ObjChat;

                default:
                    return new Chat();
            }
            
        }
    }
}
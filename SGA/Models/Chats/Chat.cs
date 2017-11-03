using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chats
{
    public class Chat
    {
        public int IdMensagem { get; set; }
        public string Usuario { get; set; }
        public string Mensagem { get; set; }
        public DateTime DataMensagem { get; set; }
        public ChatPrivado ObjChatPrivado { get; set; }
    }
}
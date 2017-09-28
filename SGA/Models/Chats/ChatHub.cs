using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
using SGA.Models.Manter;
using System.Web.Security;

namespace SGA.Models.Chats
{
    [HubName("ChatOnlineHub")]
    public class ChatHub : Hub
    {
        Chat ObjChat = FactoryChat.GetNew();
        ManterChat ObjManterChat = new ManterChat();
        public void send(string nome, string mensagem)
        {
            try
            {
                if (nome == null && mensagem == null)
                {
                    nome = Membership.GetUser().ToString();
                    mensagem = "Acabou de entrar na conversa.";

                    Clients.All.broadcastMessage(nome, mensagem);
                }
                else if (nome == null && mensagem != null)
                {
                    nome = Membership.GetUser().ToString();
                    mensagem = "Acabou de sair da conversa.";

                    Clients.All.broadcastMessage(nome, mensagem);
                }
                else
                {
                    Clients.All.broadcastMessage(nome, mensagem);

                    ObjChat.Usuario = nome;
                    ObjChat.Mensagem = mensagem;
                    ObjManterChat.GravaChat(ObjChat);
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }
    }
}
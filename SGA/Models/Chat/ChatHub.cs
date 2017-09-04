using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace SGA.Models.Chat
{
    [HubName("ChatOnlineHub")]
    public class ChatHub : Hub
    {
        public void send(string nome, string mensagem)
        {
            Clients.All.broadcastMessage(nome, mensagem);
        }
    }
}
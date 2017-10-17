using SGA.Models;
using SGA.Models.Chats;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VChat
{
    public partial class ChatPrivado : System.Web.UI.Page
    {
        public bool ChatCriado;
        public bool ConversaIniciada;
        public string IdPrivado;
        string Usuarios;
        string[] UsuariosAux;
        Notificacao ObjNotificacao;
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public List<Models.Chats.Chat> ListaSalas = new List<Models.Chats.Chat>();
        Models.Chats.Chat ObjChat = FactoryChat.GetNew(TipoChat.Privado);
        public List<Models.Chats.Chat> ListaMensagens = new List<Models.Chats.Chat>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.QueryString.Count.Equals(0))
                {
                    if (Request.QueryString.AllKeys.Contains("Chat"))
                    {
                        if (!Request.QueryString["Chat"].Equals(""))
                        {
                            Usuarios = Request.QueryString["Chat"];
                            UsuariosAux = Usuarios.Split('!');

                            foreach (var Usr in UsuariosAux)
                            {
                                if (ObjChat.ObjChatPrivado.IdUsrMBOrig == null)
                                {
                                    ObjChat.ObjChatPrivado.IdUsrMBOrig = Usr;
                                }
                                else
                                {
                                    ObjChat.ObjChatPrivado.IdUsrMBDest = Usr;
                                    ObjUsuario.IdMS = Usr;
                                }
                            }

                            if (!new ManterChat(ObjChat).ValidaChatCriado())
                            {
                                if (new ManterChat().CriaSalaPrivada(ObjChat))
                                {
                                    ObjNotificacao = FactoryNotificacao.GetNew();
                                    ObjNotificacao.IdOrigem = (int)Session["id"];
                                    ObjNotificacao.Mensagem = InfoGlobal.MensagemRequisicaoChatPriv;

                                    if (new ManterNotificacao(ObjNotificacao, ObjUsuario).NotificaUsuariosChat())
                                    {
                                        ChatCriado = true;
                                    }
                                }
                            }
                        }
                    }

                    if (Request.QueryString.AllKeys.Contains("Conversa"))
                    {
                        if (!Request.QueryString["Conversa"].Equals(""))
                        {
                            ConversaIniciada = true;
                            IdPrivado = Request.QueryString["Conversa"];
                            ObjChat.ObjChatPrivado.IdPrivado = Convert.ToInt32(IdPrivado);

                            foreach (var ObjChat in new ManterChat(ObjChat).RetornaChatPrivado())
                            {
                                ListaMensagens.Add(ObjChat);
                            }

                            ListaMensagens.Reverse();
                        }
                    }
                }

                ObjChat.ObjChatPrivado.IdUsrMBOrig = (string)Session["idms"];

                foreach (var Salas in new ManterChat(ObjChat).RetornaSalas())
                {
                    if (!Salas.ObjChatPrivado.IdUsrDest.Equals((int)Session["id"]))
                    {
                        ListaSalas.Add(Salas);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }

        }
    }
}
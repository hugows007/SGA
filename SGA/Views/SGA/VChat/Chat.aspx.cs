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
    public partial class Chat : System.Web.UI.Page
    {
        public bool EntrarChat;
        public bool ChamarTecnico;
        public bool NotificaTecnicos;
        public bool ChatPrivado;
        Notificacao ObjNotificacao;
        Models.Chats.Chat ObjChat = FactoryChat.GetNew();
        public List<Models.Chats.Chat> ListaMensagens = new List<Models.Chats.Chat>();
        List<string> Perfil = new List<string>();
        public List<Usuario> ListaUsuario = new List<Usuario>();
        string HashSalaPrivada;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.QueryString.Count.Equals(0))
                {
                    if (!Request.QueryString["Tecnico"].Equals(""))
                    {
                        HashSalaPrivada = Convert.ToBase64String(Guid.NewGuid().ToByteArray()).Substring(1, 15);
                        ChatPrivado = true;
                        Response.Redirect("\\Views\\SGA\\VChat\\Chat.aspx?Sala="+ HashSalaPrivada, false);
                    }
                }

                foreach (var ObjChat in new ManterChat(ObjChat).RetornaChat())
                {
                    ListaMensagens.Add(ObjChat);
                }

                ListaMensagens.Reverse();
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }

        protected void ButtonChamar_Click(object sender, EventArgs e)
        {
            ListaUsuario.Clear();

            ChamarTecnico = true;
            EntrarChat = false;

            Perfil.Add("Técnico");

            foreach (var ObjTecnico in new ManterUsuario().ConsultaUsuariosByPerfil(Perfil))
            {
                Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);

                ObjUsuario.Id = ObjTecnico.Id;
                ObjUsuario.Login = ObjTecnico.Login;
                ObjUsuario.Nome = ObjTecnico.Nome;

                ListaUsuario.Add(ObjUsuario);
            }
            
        }

        protected void ButtonConvocar_Click(object sender, EventArgs e)
        {
            try
            {
                ObjNotificacao = FactoryNotificacao.GetNew();
                ObjNotificacao.IdOrigem = (int)Session["id"];
                ObjNotificacao.Mensagem = "Requisição de chat";

                if (new ManterNotificacao(ObjNotificacao).NotificaUsuarios())
                {
                    NotificaTecnicos = true;
                }
            }
            catch (Exception Ex)
            {
                new LogException(Ex).InsereLogBd();
            }
        }

        protected void ButtonEntrar_Click(object sender, EventArgs e)
        {
            EntrarChat = true;
        }

        protected void ButtonSair_Click(object sender, EventArgs e)
        {
            EntrarChat = false;
        }
    }
}
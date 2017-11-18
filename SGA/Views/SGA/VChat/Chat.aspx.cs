using SGA.Models;
using SGA.Models.Chats;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
        Models.Chats.Chat ObjChat = FactoryChat.GetNew(TipoChat.Publico);
        public List<Models.Chats.Chat> ListaMensagens = new List<Models.Chats.Chat>();
        List<string> Perfil = new List<string>();
        public List<Usuario> ListaUsuario = new List<Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                foreach (var ObjChat in new ManterChat(ObjChat).RetornaChat())
                {
                    ListaMensagens.Add(ObjChat);
                }

                ListaMensagens.Reverse();
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void ButtonChamar_Click(object sender, EventArgs e)
        {
            try
            {
                ListaUsuario.Clear();

                ChamarTecnico = true;
                EntrarChat = false;

                Perfil.Add("Técnico");
                Perfil.Add("Gestor");
                Perfil.Add("Atendente");

                foreach (var ObjTecnico in new ManterUsuario().ConsultaUsuariosByPerfil(Perfil))
                {
                    Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);

                    if (!ObjTecnico.IdMS.Equals(Session["idms"]))
                    {
                        ObjUsuario.Id = ObjTecnico.Id;
                        ObjUsuario.Login = ObjTecnico.Login;
                        ObjUsuario.Nome = ObjTecnico.Nome;
                        ObjUsuario.IdMS = ObjTecnico.IdMS;

                        ListaUsuario.Add(ObjUsuario);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void ButtonConvocar_Click(object sender, EventArgs e)
        {
            try
            {
                ObjNotificacao = FactoryNotificacao.GetNew();
                ObjNotificacao.IdOrigem = (int)Session["id"];
                ObjNotificacao.IdMensagem = 1;
                ObjNotificacao.IdTipo = 1;

                if (new ManterNotificacao(ObjNotificacao).NotificaUsuariosChat())
                {
                    NotificaTecnicos = true;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
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
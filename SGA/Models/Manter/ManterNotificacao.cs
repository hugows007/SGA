using SGA.Models.DAO.ManterDAO;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterNotificacao
    {
        public Notificacao ObjNotificacao;
        public Usuario ObjUsuario;
        public ManterNotificacao()
        {

        }
        public ManterNotificacao(Notificacao ObjNotificacao)
        {
            this.ObjNotificacao = ObjNotificacao;
        }
        public ManterNotificacao(Notificacao ObjNotificacao, Usuario ObjUsuario)
        {
            this.ObjNotificacao = ObjNotificacao;
            this.ObjUsuario = ObjUsuario;
        }
        public bool NotificaUsuariosChat()
        {
            return new ManterNotificacaoDAO(ObjNotificacao, ObjUsuario).NotificaUsuariosChatDAO();
        }
        public bool NotificaUsuariosSistem()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).NotificaUsuariosSistemDAO();
        }
        public bool AtualizaNotificacao()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).AtualizaNotificacaoDAO();
        }
        public List<Notificacao> InformaNotificacao()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).InformaNotificacaoDAO();
        }
    }
}
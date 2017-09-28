using SGA.Models.DAO.ManterDAO;
using SGA.Models.Notificacoes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterNotificacao
    {
        public Notificacao ObjNotificacao;
        public ManterNotificacao()
        {

        }
        public ManterNotificacao(Notificacao ObjNotificacao)
        {
            this.ObjNotificacao = ObjNotificacao;
        }

        public bool NotificaUsuarios()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).NotificaUsuariosDAO();
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
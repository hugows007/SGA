using SGA.Models.DAO.ManterDAO;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterNotificacao
    {
        public Notificacao ObjNotificacao;
        public Usuario ObjUsuario;
        public Usuario ObjUsuarioEmail = FactoryUsuario.GetNew(TipoUsuario.Usuario);

        public Usuario ObjUsuarioCliente = FactoryUsuario.GetNew(TipoUsuario.Usuario);
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
            if (new ManterNotificacaoDAO(ObjNotificacao).NotificaUsuariosSistemDAO())
            {
                return EnviaEmailNotificacao();
            }
            else
            {
                return false;
            }
        }
        public bool AtualizaNotificacao()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).AtualizaNotificacaoDAO();
        }
        public List<Notificacao> InformaNotificacao()
        {
            return new ManterNotificacaoDAO(ObjNotificacao).InformaNotificacaoDAO();
        }
        public bool EnviaEmailNotificacao()
        {
            ObjUsuarioEmail.Id = ObjNotificacao.IdDest;

            ObjUsuarioEmail = new ManterUsuario(ObjUsuarioEmail).ConsultaUsuarioById();

            System.Net.Mail.SmtpClient Client = new System.Net.Mail.SmtpClient();
            Client.Port = 587;
            Client.Host = "smtp.gmail.com";
            Client.EnableSsl = true;
            Client.Credentials = new System.Net.NetworkCredential("noreplysgati@gmail.com", "sgati123");
            MailMessage Mail = new MailMessage();
            Mail.Sender = new System.Net.Mail.MailAddress("noreplysgati@gmail.com", "SGA TI");
            Mail.From = new MailAddress("noreplysgati@gmail.com", "SGA TI");
            Mail.To.Add(new MailAddress(ObjUsuarioEmail.Email, ObjUsuarioEmail.Nome));
            Mail.Subject = "NO-REPLY - Mudança de status do chamado.";
            Mail.IsBodyHtml = true;
            Mail.Priority = MailPriority.High;

            Mail.Body = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou. <br/> O chamado agora está com o status: <br/><br/>";

            switch (ObjNotificacao.Mensagem)
            {
                case "Novo atendimento":
                    Mail.Body += "Novo atendimento iniciado com sucesso. <br/> Favor acompanhar o andamento no sistema SGA TI.<br/>";
                    break;
                case "Início de atendimento":
                    Mail.Body += "O atendimento do chamado está sendo iniciado. <br/> Favor acompanhar o andamento no sistema SGA TI.<br/>";
                    break;
                case "Atendimento finalizado":
                    Mail.Body += "O atendimento do seu chamado foi finalizado. <br/> Favor avalia-lo no sistema SGA TI.<br/>";
                    break;
                case "Chamado cancelado":
                    Mail.Body += "Seu chamado foi cancelado com sucesso. <br/>";
                    break;
                case "Retrabalho":
                    Mail.Body += "Houve pendências no atendimento do seu chamado. <br/> Favor acompanhar o andamento no sistema SGA TI. <br/>";
                    break;
                default:
                    break;
            }

            Mail.Body += "<br/> Para dúvidas ou problemas, favor contatar o suporte técnico.<br/><br/> <b>Equipe SGA TI</b>";

            try
            {
                Client.Send(Mail);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
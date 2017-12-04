using SGA.Models.DAO.ManterDAO;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;

namespace SGA.Models.Manter
{
    public class ManterNotificacao : Notificacao
    {
        public Notificacao ObjNotificacao;
        public Usuario ObjUsuario;
        string Cabecalho;
        string Corpo;

        public Usuario ObjUsuarioEmail = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public Usuario ObjUsuarioCliente = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public ManterNotificacao()
        {

        }
        public ManterNotificacao(Notificacao ObjNotificacao)
        {
            this.ObjNotificacao = ObjNotificacao;
        }
        public ManterNotificacao(Usuario ObjUsuario)
        {
            this.ObjUsuario = ObjUsuario;
        }
        public ManterNotificacao(Notificacao ObjNotificacao, Usuario ObjUsuario)
        {
            this.ObjNotificacao = ObjNotificacao;
            this.ObjUsuario = ObjUsuario;
        }
        public bool NotificaUsuariosChat()
        {
            try
            {
                return new ManterNotificacaoDAO(ObjNotificacao, ObjUsuario).NotificaUsuariosChatDAO();
            }
            catch (Exception)
            {
                throw;
            }
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
            try
            {
                return new ManterNotificacaoDAO(ObjNotificacao).AtualizaNotificacaoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Notificacao> InformaNotificacao()
        {
            try
            {
                return new ManterNotificacaoDAO(ObjNotificacao).InformaNotificacaoDAO();
            }
            catch (Exception)
            {
                throw;
            }
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
            Mail.IsBodyHtml = true;
            Mail.Priority = MailPriority.High;

            switch (ObjNotificacao.IdMensagem)
            {
                case 3:
                    Cabecalho = "NO-REPLY - Abertura de chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O chamado de número <b>" + ObjNotificacao.IdChamado + "</b> foi aberto com sucesso.<br/><br/>";

                    Corpo += "Favor acompanhar o andamento no sistema SGA TI.<br/>";
                    break;
                case 4:
                    Cabecalho = "NO-REPLY - Mudança de status do chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou: ";

                    Corpo += "O atendimento do chamado foi iniciado.<br/> Favor acompanhar o andamento no sistema SGA TI.<br/>";
                    break;
                case 5:
                    Cabecalho = "NO-REPLY - Mudança de status do chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou: ";

                    Corpo += "O atendimento do chamado foi finalizado com sucesso. <br/>";
                    break;
                case 6:
                    Cabecalho = "NO-REPLY - Mudança de status do chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou: ";

                    Corpo += "O chamado foi cancelado com sucesso. <br/>";
                    break;
                case 7:
                    Cabecalho = "NO-REPLY - Mudança de status do chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou: ";

                    Corpo += "Houve pendências no atendimento do chamado. Um novo atendimento será iniciado em seguida.<br/> Favor acompanhar o andamento no sistema SGA TI. <br/>";
                    break;
                case 8:
                    Cabecalho = "NO-REPLY - Mudança de status do chamado: " + ObjNotificacao.IdChamado;
                    Corpo = @"<b>SGA TI informa:</b><br/><br/> O status do chamado mudou: ";

                    Corpo += "O chamado foi reaberto com sucesso. <br/> Favor acompanhar o andamento no sistema SGA TI. <br/>";
                    break;
                default:
                    return true; //Retorna verdadeiro para não enviar e-mail na notificação de "sem contato geográfico".
            }

            Corpo += "<br/> Para dúvidas ou problemas, favor contatar o suporte técnico.<br/><br/> <b>Equipe SGA TI</b><br/><i>Este e-mail foi gerado automaticamente. <br/>Favor não responde-lo.";

            try
            {
                Mail.Subject = Cabecalho;
                Mail.Body = Corpo;
                Client.Send(Mail);
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool EnviaEmailRecuperacao()
        {
            System.Net.Mail.SmtpClient Client = new System.Net.Mail.SmtpClient();
            Client.Port = 587;
            Client.Host = "smtp.gmail.com";
            Client.EnableSsl = true;
            Client.Credentials = new System.Net.NetworkCredential("noreplysgati@gmail.com", "sgati123");
            MailMessage Mail = new MailMessage();
            Mail.Sender = new System.Net.Mail.MailAddress("noreplysgati@gmail.com", "SGA TI");
            Mail.From = new MailAddress("noreplysgati@gmail.com", "SGA TI");
            Mail.To.Add(new MailAddress(ObjUsuario.Email, ObjUsuario.Nome));
            Mail.Subject = "NO-REPLY - Recuperar senha.";
            Mail.IsBodyHtml = true;
            Mail.Priority = MailPriority.High;

            Mail.Body = @"<b>SGA TI informa:</b><br/><br/> Você solicitou uma mudança de senha as " + DateTime.Now + ". <br/> Sua senha agora é: <b>" + ObjUsuario.Senha + "</b>.<br/><br/> Favor altera-la no próximo login.";
            Mail.Body += "<br/> Para dúvidas ou problemas, favor contatar o suporte técnico.<br/><br/> <b>Equipe SGA TI</b>";

            try
            {
                Client.Send(Mail);
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
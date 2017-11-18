using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using SGA.Models.Especialidades;
using SGA.Models.Chamados;
using System.Data.SqlClient;

namespace SGA.Models.Manter
{
    public class ManterUsuario : Usuario
    {
        string UserId;
        string Msg;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        bool Result;
        MembershipUser newUser;
        public ManterUsuario()
        {
        }
        public ManterUsuario(Usuario ObjUsuario)
        {
            this.ObjUsuario = ObjUsuario;
        }
        public ManterUsuario(Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjUsuario = ObjUsuario;
            this.ObjChamado = ObjChamado;
        }
        public string CadastraUsuario()
        {
            try
            {
                newUser = Membership.CreateUser(
                  ObjUsuario.Login,
                  ObjUsuario.Senha,
                  ObjUsuario.Email);

                Roles.AddUserToRole(
                    ObjUsuario.Login,
                    ObjUsuario.Regra);

                MembershipUser Mu = Membership.GetUser(ObjUsuario.Login);
                UserId = Mu.ProviderUserKey.ToString();

                if (newUser != null && new ManterUsuarioDAO(ObjUsuario, UserId).CadastraUsuarioDAO())
                {
                    ObjUsuario.Id = Convert.ToInt32(new ManterUsuarioDAO().GetUltimoIdUsuarioDAO());

                    if (ObjUsuario.Regra.Equals("Técnico"))
                    {
                        RelacionaUsuarioAreaAtendimento();
                        RelacionaUsuarioEspecialidade();
                    }
                    else if (ObjUsuario.Regra.Equals("Cliente Físico") || ObjUsuario.Regra.Equals("Cliente Jurídico"))
                    {
                        RelacionaUsuarioAreaAtendimento();
                    }

                    Msg = "Usuário cadastrado com sucesso!";
                }
                else
                {
                    Membership.DeleteUser(ObjUsuario.Login);
                    Msg = "Ocorreu um erro ao efetuar o cadastro do usuário!";
                }

                return Msg;
            }
            catch (MembershipCreateUserException Ex)
            {
                return GetMensagemErro(Ex.StatusCode);
            }
            catch (HttpException Ex)
            {
                return Ex.Message;
            }
            catch (SqlException)
            {
                Membership.DeleteUser(ObjUsuario.Login);
                return "Ocorreu um erro ao efetuar o cadastro do usuário!";
            }

        }
        public List<Usuario> ConsultaUsuarios()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuariosDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Usuario> ConsultaUsuariosGestores()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuariosGestoresDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Usuario> ConsultaUsuariosByPerfil(List<string> Perfil)
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuariosByPerfilDAO(Perfil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ConsultaUsuarioById()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByIdDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ConsultaUsuarioByEmail()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByEmailDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ConsultaUsuarioByLogin()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByLoginDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ConsultaIdUsuarioByIdMB()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaIdUsuarioByIdMBDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ConsultaUsuarioByNome()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByNomeDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraUsuario()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).AlteraUsuarioDAO();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool AlteraUsuarioAusente()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).AlteraUsuarioAusenteDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraDisponibilidade()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).AlteraDisponibilidadeDAO();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool InativaUsuario()
        {
            try
            {
                ObjUsuario = new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByIdDAO();

                if (new ManterUsuarioDAO(ObjUsuario).InativaUsuarioDAO())
                {
                    MembershipUser Usuario = Membership.GetUser(ObjUsuario.Login);
                    Usuario.IsApproved = false;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool RelacionaUsuarioAreaAtendimento()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).RelacionaUsuarioAreaAtendimentoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool RelacionaUsuarioEspecialidade()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).RelacionaUsuarioEspecialidadeDAO();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetMensagemErro(MembershipCreateStatus Status)
        {
            switch (Status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Este login já existe. Favor escolher outro.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "Este e-mail já existe cadastrado. Favor escolher outro";

                case MembershipCreateStatus.InvalidPassword:
                    return "A senha é inválida. Favor rever.";

                case MembershipCreateStatus.InvalidEmail:
                    return "E-mail inválido. Favor rever";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "Login inválido. Favor rever.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "Erro desconhecido. Caso continue, favor entrar em contato com o administrador.";
            }
        }
        public string[] GetRegrasUsuario()
        {
            try
            {
                string[] rolesArray;
                return rolesArray = Roles.GetAllRoles();
            }
            catch (Exception)
            {
                throw;
            }

        }
        public bool GetUsuariosFunc()
        {
            try
            {
                string[] RegraUsr = Roles.GetRolesForUser(Membership.GetUser().ToString());

                foreach (var Regra in RegraUsr)
                {
                    if (Regra.Equals("Administrador") || Regra.Equals("Gestor") || Regra.Equals("Atendente"))
                    {
                        Result = true;
                    }
                    else
                    {
                        Result = false;
                    }
                }

                return Result;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string GetUsuarioLogado()
        {
            try
            {
                return Membership.GetUser().ToString();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<int> GetIdRegiaoAtendByUsr()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).GetIdRegiaoAtendByUsrDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario GetTecnicoByRegiaoEspec()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario, ObjChamado).GetTecnicoByRegiaoEspecDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario GetUsuarioEmpresa()
        {
            try
            {
                return new ManterUsuarioDAO(ObjUsuario).GetUsuarioEmpresaDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool RecuperarSenha()
        {
            try
            {
                ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioByEmail();

                if (!ObjUsuario.Id.Equals(0))
                {
                    MembershipUser Usuario = Membership.GetUser(ObjUsuario.Login);

                    string Senha = Membership.GeneratePassword(8, 0);
                    Usuario.ChangePassword(Usuario.ResetPassword(), Senha);
                    ObjUsuario.Senha = Senha;

                    return new ManterNotificacao(ObjUsuario).EnviaEmailRecuperacao();
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AlteraSenha()
        {
            try
            {
                MembershipUser Usuario = Membership.GetUser(ObjUsuario.Login);
                Usuario.ChangePassword(Usuario.ResetPassword(), ObjUsuario.Senha);

                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
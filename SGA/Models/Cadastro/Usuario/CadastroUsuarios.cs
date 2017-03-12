using SGA.Models.DAO.UsuarioDAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.Usuario
{
    public class CadastroUsuarios
    {
        string UserId = null;
        string Msg = null;
        IUsuario ObjUsuario;

        public CadastroUsuarios(IUsuario ObjUsr)
        {
            ObjUsuario = ObjUsr;
        }
        public CadastroUsuarios()
        {
        }
        public string[] RegrasUsuario()
        {
            string[] rolesArray;
            return rolesArray = Roles.GetAllRoles();
        }
        public string CadastraUsuario()
        {
            try
            {
                MembershipUser newUser = Membership.CreateUser(
                  ObjUsuario.Login,
                  ObjUsuario.Senha,
                  ObjUsuario.Email);

                Roles.AddUserToRole(
                    ObjUsuario.Login,
                    ObjUsuario.Regra);

                if(newUser != null)
                {
                    MembershipUser Mu = Membership.GetUser(ObjUsuario.Login);
                    UserId = Mu.ProviderUserKey.ToString();

                    if (new CadastroUsuariosDAO
                        (ObjUsuario, UserId).CadastraUsuarioDAO())
                    {
                        Msg = "Usuário cadastrado com sucesso!";
                    }
                    else
                    {
                        Msg = "Ocorreu um erro ao efetuar o cadastro";
                    }
                }

                return Msg;
            }
            catch (MembershipCreateUserException ex)
            {
                return GetMensagemErro(ex.StatusCode);
            }
            catch (HttpException ex)
            {
                return ex.Message;
            }
        }
        public List<IUsuario> ConsultaUsuarios()
        {
            return new CadastroUsuariosDAO(ObjUsuario).ConsultaUsuariosDAO();
        }
        public string GetMensagemErro(MembershipCreateStatus Status)
        {
            switch (Status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
    }
}
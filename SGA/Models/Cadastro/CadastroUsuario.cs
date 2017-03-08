using SGA.Models.DAO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.Usuario
{
    public class CadastroUsuario
    {
        string _Usuario { get; set; }
        string _Senha { get; set; }
        string _Email { get; set; }
        string _Regra { get; set; }
        string _Nome { get; set; }
        string _Endereco { get; set; }
        string _Numero { get; set; }
        string _Cep { get; set; }
        string _Telefone { get; set; }
        string _DocIdent { get; set; }
        string _OrgEmiss { get; set; }
        string _Cpf { get; set; }
        string _Cnpj { get; set; }
        int _Setor { get; set; }
        int _Cargo { get; set; }
        int _Especialidade { get; set; }

        string UserId = null;

        public CadastroUsuario(
            string Usuario,
            string Senha,
            string Email,
            string Regra,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone)
        {
            _Usuario = Usuario;
            _Senha = Senha;
            _Email = Email;
            _Regra = Regra;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
        }

        public CadastroUsuario(
            string Usuario,
            string Senha,
            string Email,
            string Regra,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            string DocIdent,
            string OrgEmiss,
            string Cpf)
        {
            _Usuario = Usuario;
            _Senha = Senha;
            _Email = Email;
            _Regra = Regra;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _DocIdent = DocIdent;
            _OrgEmiss = OrgEmiss;
            _Cpf = Cpf;
        }

        public CadastroUsuario(
            string Usuario,
            string Senha,
            string Email,
            string Regra,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            string Cnpj)
        {
            _Usuario = Usuario;
            _Senha = Senha;
            _Email = Email;
            _Regra = Regra;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Cnpj = Cnpj;
        }

        public CadastroUsuario(
            string Usuario,
            string Senha,
            string Email,
            string Regra,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            int Setor,
            int Cargo)
        {
            _Usuario = Usuario;
            _Senha = Senha;
            _Email = Email;
            _Regra = Regra;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Setor = Setor;
            _Cargo = Cargo;
        }

        public CadastroUsuario(
            string Usuario,
            string Senha,
            string Email,
            string Regra,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            int Especialidade,
            int Cargo,
            int Setor)
        {
            _Usuario = Usuario;
            _Senha = Senha;
            _Email = Email;
            _Regra = Regra;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Especialidade = Especialidade;
            _Cargo = Cargo;
            _Setor = Setor;

        }


        public CadastroUsuario()
        {
        }

        public string[] RegrasUsuario()
        {
            string[] rolesArray;
            return rolesArray = Roles.GetAllRoles();
        }
        public string CadastroUsuarioMemberShip()
        {
            try
            {
                MembershipUser newUser = Membership.CreateUser(
                  _Usuario,
                  _Senha,
                  _Email);

                Roles.AddUserToRole(
                    _Usuario,
                    _Regra);

                return "OK";

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

        public string CadastroUsuarioAdministrador()
        {
            MembershipUser Mu = Membership.GetUser(_Usuario);
            UserId = Mu.ProviderUserKey.ToString();

            if (new CadastroDAO
                (
                UserId,
                _Nome,
                _Endereco,
                _Numero,
                _Cep,
                _Telefone).InsereUsuarioAdmin())
            {
                return "Usuário cadastrado com sucesso!";
            }
            else
            {
                return "Ocorreu um erro ao efetuar o cadastro";
            }
        }

        public string CadastroUsuarioClienteFisico()
        {
            MembershipUser Mu = Membership.GetUser(_Usuario);
            UserId = Mu.ProviderUserKey.ToString();

            if (new CadastroDAO
                (
                UserId,
                _Nome,
                _Endereco,
                _Numero,
                _Cep,
                _Telefone,
                _DocIdent,
                _OrgEmiss,
                _Cpf).InsereUsuarioClienteFisico())
            {
                return "Usuário cadastrado com sucesso!";
            }
            else
            {
                return "Ocorreu um erro ao efetuar o cadastro";
            }
        }

        public string CadastroUsuarioClienteJuridico()
        {
            MembershipUser Mu = Membership.GetUser(_Usuario);
            UserId = Mu.ProviderUserKey.ToString();

            if (new CadastroDAO
                (
                UserId,
                _Nome,
                _Endereco,
                _Numero,
                _Cep,
                _Telefone,
                _Cnpj).InsereUsuarioClienteJuridico())
            {
                return "Usuário cadastrado com sucesso!";
            }
            else
            {
                return "Ocorreu um erro ao efetuar o cadastro";
            }
        }

        public string CadastroUsuarioGestor()
        {
            MembershipUser Mu = Membership.GetUser(_Usuario);
            UserId = Mu.ProviderUserKey.ToString();

            if (new CadastroDAO
                (
                UserId,
                _Nome,
                _Endereco,
                _Numero,
                _Cep,
                _Telefone,
                _Setor,
                _Cargo).InsereUsuarioGestor())
            {
                return "Usuário cadastrado com sucesso!";
            }
            else
            {
                return "Ocorreu um erro ao efetuar o cadastro";
            }
        }

        public string CadastroUsuarioTecnico()
        {
            MembershipUser Mu = Membership.GetUser(_Usuario);
            UserId = Mu.ProviderUserKey.ToString();

            if (new CadastroDAO
                (
                UserId,
                _Nome,
                _Endereco,
                _Numero,
                _Cep,
                _Telefone,
                _Especialidade,
                _Cargo,
                _Setor).InsereUsuarioTecnico())
            {
                return "Usuário cadastrado com sucesso!";
            }
            else
            {
                return "Ocorreu um erro ao efetuar o cadastro";
            }
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
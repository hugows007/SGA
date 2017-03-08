using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.Login
{
    public class Login
    {
        public bool Logar(string Login, string Senha)
        {
            if (Membership.ValidateUser(Login, Senha) && !Roles.GetRolesForUser(Login).Equals(null))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.Manter
{
    public abstract class ManterLogin
    {
        public static bool Logar(string Login, string Senha)
        {
            try
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
            catch (InvalidOperationException)
            {
                throw;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                throw;
            }
        }
    }
}
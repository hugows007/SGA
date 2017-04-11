using SGA.Models.DAO.Log;
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
            catch (InvalidOperationException Ex)
            {
                new LogException(
                    Ex.Message.ToString(),
                    Ex.Source.ToString(),
                    Ex.StackTrace.ToString(),
                    Ex.TargetSite.ToString()
                    );

                throw;
            }
            catch (System.Data.SqlClient.SqlException Ex)
            {
                new LogException(
                    Ex.Message.ToString(),
                    Ex.Source.ToString(),
                    Ex.StackTrace.ToString(),
                    Ex.TargetSite.ToString()
                    );

                throw;
            }
        }
    }
}
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views
{
    public partial class LoginMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MembershipUser newUser;

                newUser = Membership.CreateUser(
                "Admin",
                "12345678",
                "admin@admin.com");

                Roles.AddUserToRole(
                    "Admin",
                    "Administrador");
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
            }
        }
    }
}
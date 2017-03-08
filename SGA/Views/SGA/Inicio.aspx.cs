﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.Site
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogado.Text = Membership.GetUser().ToString();
            MembershipUser mu = Membership.GetUser(UsuarioLogado.Text);
            string userId = mu.ProviderUserKey.ToString();
            UsuarioLogado.Text += " " + userId;
            Usuario.Text = Membership.GetUser(mu.ProviderUserKey).ToString();

        }
    }
}
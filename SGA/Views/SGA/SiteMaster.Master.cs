﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public string UsuarioLogado;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
            UsuarioLogado = Membership.GetUser().ToString();
        }
    }
}
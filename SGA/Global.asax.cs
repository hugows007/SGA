using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SGA
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            BundleTable.EnableOptimizations = true;
        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();

            if (Ex is HttpUnhandledException)
            {
                if (Ex.InnerException != null)
                {
                    Ex = new Exception(Ex.InnerException.Message);
                    LogException.InsereLogBd(Ex);
                    Server.Transfer("/Views/SGA/VErro/Erro.aspx?handler=Application_Error%20-%20Global.asax",
                        true);
                }

                LogException.InsereLogBd(Ex);
                Server.Transfer("/Views/SGA/VErro/Erro.aspx?handler=Application_Error%20-%20Global.asax", true);
            }
        }

    }
}
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VErro
{
    public partial class Erro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create safe error messages.
            string generalErrorMsg = "Ops, ocorreu um erro no sistema. Favor tente novamente. " +
                "Se persistir, favor contatar o suporte técnico.";
            string httpErrorMsg = "Ops, ocorreu um problema. Tente novamente.";
            string unhandledErrorMsg = "Ops, ocorreu um erro no sistema. Contate o suporte técnico.";

            // Display safe error message.
            FriendlyErrorMsg.Text = generalErrorMsg;

            // Determine where error was handled.
            string errorHandler = Request.QueryString["handler"];
            if (errorHandler == null)
            {
                errorHandler = "Error Page";
            }

            // Get the last error from the server.
            Exception Ex = Server.GetLastError();

            // Get the error number passed as a querystring value.
            string errorMsg = Request.QueryString["msg"];
            if (errorMsg == "404")
            {
                Ex = new HttpException(404, httpErrorMsg, Ex);
                FriendlyErrorMsg.Text = Ex.Message;
            }

            // If the exception no longer exists, create a generic exception.
            if (Ex == null)
            {
                Ex = new Exception(unhandledErrorMsg);
            }

            // Show error details to only you (developer). LOCAL ACCESS ONLY.
            if (Request.IsLocal)
            {
                // Detailed Error Message.
                ErrorDetailedMsg.Text = Ex.Message;

                // Show where the error was handled.
                ErrorHandler.Text = errorHandler;

                // Show local access details.
                DetailedErrorPanel.Visible = true;

                if (Ex.InnerException != null)
                {
                    InnerMessage.Text = Ex.GetType().ToString() + "<br/>" +
                        Ex.InnerException.Message;
                    //InnerTrace.Text = Ex.InnerException.StackTrace;
                }
                else
                {
                    InnerMessage.Text = Ex.GetType().ToString();
                    if (Ex.StackTrace != null)
                    {
                        //InnerTrace.Text = Ex.StackTrace.ToString().TrimStart();
                    }
                }
            }

            LogException.InsereLogBd(Ex);
            MsgLabel.Text = LogException.CodigoErroBd();

            Server.ClearError();

        }
    }
}
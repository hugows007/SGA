using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace SGA
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*",
                            "~/Scripts/respond.min.js",
                            "~/Scripts/bootstrap.js",
                            "~/Content/bootstrap.css",
                            "~/Content/bootstrap-theme.css",
                            "~/Scripts/jquery-3.1.1.js",
                            "~/Scripts/jquery-1.10.2.intellisense.js",
                            "~/Scripts/dataTables.bootstrap.min.js",
                            "~/Scripts/jquery.dataTables.min.js",
                            "~/Scripts/google.js"
                            ));

            ScriptManager.ScriptResourceMapping.AddDefinition(
                "respond",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/respond.min.js",
                    DebugPath = "~/Scripts/respond.js",
                });

            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("MsAjaxBundle", new ScriptResourceDefinition
            {
                Path = "~/bundles/modernizr",
                CdnPath = "~/Scripts/WebForms/MSAjax/MicrosoftAjax.js",
                LoadSuccessExpression = "window.WebForm_PostBackOptions",
                CdnSupportsSecureConnection = true
            });

            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/bundles/modernizr",
                CdnPath = "~/Scripts/jquery-3.1.1.js",
                LoadSuccessExpression = "window.WebForm_PostBackOptions",
                CdnSupportsSecureConnection = true
            });

            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("bootstrap", new ScriptResourceDefinition
            {
                Path = "~/bundles/modernizr",
                CdnPath = "~/Scripts/bootstrap.js",
                LoadSuccessExpression = "window.WebForm_PostBackOptions",
                CdnSupportsSecureConnection = true
            });

            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("respond", new ScriptResourceDefinition
            {
                Path = "~/bundles/modernizr",
                CdnPath = "~/Scripts/respond.js",
                LoadSuccessExpression = "window.WebForm_PostBackOptions",
                CdnSupportsSecureConnection = true
            });


            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("WebFormsBundle", new ScriptResourceDefinition
            {
                Path = "~/bundles/modernizr",
                CdnPath = "~/Scripts/WebForms/WebForms.js",
                LoadSuccessExpression = "window.WebForm_PostBackOptions",
                CdnSupportsSecureConnection = true
            });

        }
    }
}
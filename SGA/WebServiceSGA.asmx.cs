using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using SGA.Models.Manter;
using SGA.Models.Usuarios;

namespace SGA.Models.WebService
{
    /// <summary>
    /// Summary description for WebServiceSGA
    /// </summary>
    [WebService(Namespace = "http://192.168.0.12:80/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceSGA : System.Web.Services.WebService
    {

        [WebMethod]
        public string Login()
        {
            Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
            List<Usuario> Lista = new List<Usuario>();
            Lista = new ManterUsuario(ObjUsuario).ConsultaUsuarios();
            return JsonConvert.SerializeObject(Lista, Newtonsoft.Json.Formatting.Indented);
        }
    }
}

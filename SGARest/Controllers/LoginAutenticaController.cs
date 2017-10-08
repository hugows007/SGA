using SGA.Models.DAO.Log;
using SGA.Models.Login;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace SGARest.Controllers
{
    public class LoginAutenticaController : ApiController
    {
        //private readonly Login[] Clientes = new Login[]
        //        {
        //            new Login { uLogin = "1", uSenha = "Hugo"},
        //        };

        //public Login[] Get()
        //{
        //    return Clientes;
        //}

        Usuario ObjUsuario;

        public LoginAutenticaController()
        {
            ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
        }

        public object Post(Usuario usuario)
        {
            try
            {
                if (ModelState.IsValid && usuario != null)
                {
                    ObjUsuario = usuario;

                    if (ManterLogin.Logar(ObjUsuario.Login, ObjUsuario.Senha))
                    {
                        ObjUsuario = new ManterUsuario(ObjUsuario).ConsultaUsuarioByLogin();

                        if (ObjUsuario.Regra.Equals("Técnico"))
                        {
                            return Request.CreateResponse(HttpStatusCode.OK,
                                new
                                {
                                    usuario = ObjUsuario
                                });
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.OK, "usuarionaotecnico");
                        }

                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, "usuarioinvalido");
                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "erro");
                }
            }
            catch (Exception Ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, Ex);
            }
        }

    }
}

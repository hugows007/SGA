using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SGA.Models.WebAPI
{
    public class LoginController : ApiController
    {
        private readonly Models.Login.Login[] Logins = new Models.Login.Login[]
                {
                    new Models.Login.Login { uLogin = "Eduardo Pires", uSenha = "falecom@eduardopires.net.br" },
                };
        public Models.Login.Login[] Get()
        {
            return Logins;
        }
    }
}

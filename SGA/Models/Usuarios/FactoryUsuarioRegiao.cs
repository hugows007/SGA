using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public class FactoryUsuarioRegiao
    {
        internal static UsuarioRelacionamento GetNew()
        {
            return new UsuarioRelacionamento();
        }
    }
}
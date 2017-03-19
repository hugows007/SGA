using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public class UsuarioGestor : Usuario
    {
        public int Setor { get; set; }
        public int Cargo { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public class UsuarioClienteFisico : Usuario
    {
        public string DocIdent { get; set; }
        public string OrgEmiss { get; set; }
        public string Cpf { get; set; }
    }
}
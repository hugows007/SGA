﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public class UsuarioTecnico : Usuario
    {
        public int IdSetor { get; set; }
        public int IdCargo { get; set; }
        public int IdEspecialidade { get; set; }
    }
}
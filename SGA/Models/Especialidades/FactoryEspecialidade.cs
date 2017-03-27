using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Especialidades
{
    public class FactoryEspecialidade
    {
        internal static Especialidade GetNew()
        {
            return new Especialidade();
        }
    }
}
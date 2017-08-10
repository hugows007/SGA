using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Empresas
{
    public class FactoryEmpresa
    {
        internal static Empresa GetNew()
        {
            return new Empresa();
        }
    }
}
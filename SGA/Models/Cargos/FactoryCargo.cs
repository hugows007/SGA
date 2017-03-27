using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Cargos
{
    public class FactoryCargo
    {
        internal static Cargo GetNew()
        {
            return new Cargo();
        }
    }
}
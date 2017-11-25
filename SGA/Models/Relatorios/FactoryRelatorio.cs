using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Relatorios
{
    public class FactoryRelatorio : Relatorio
    {
        internal static Relatorio GetNew()
        {
            return new Relatorio();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados
{
    public class FactoryChamado
    {
        internal static Chamado GetNew()
        {
            return new Chamado();
        }
    }
}
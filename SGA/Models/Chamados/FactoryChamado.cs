using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados
{
    public class FactoryChamado : Chamado
    {
        internal static Chamado GetNew()
        {
            return new Chamado();
        }
    }
}
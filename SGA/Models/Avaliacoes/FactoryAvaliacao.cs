using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Avaliacoes
{
    public class FactoryAvaliacao
    {
        internal static Avaliacao GetNew()
        {
            return new Avaliacao();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Historicos
{
    public class FactoryHistorico : Historico
    {
        internal static Historico GetNew()
        {
            return new Historico();
        }
    }
}
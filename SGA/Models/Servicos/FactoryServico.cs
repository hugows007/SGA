using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Servicos
{
    public class FactoryServico
    {
        internal static Servico GetNew()
        {
            return new Servico();
        }
    }
}
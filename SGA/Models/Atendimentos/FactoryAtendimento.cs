using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Atendimentos
{
    public class FactoryAtendimento
    {
        internal static Atendimento GetNew()
        {
            return new Atendimento();
        }
    }
}
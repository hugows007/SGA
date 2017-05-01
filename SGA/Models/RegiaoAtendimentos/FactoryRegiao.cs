using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.RegiaoAtendimentos
{
    public class FactoryRegiao
    {
        internal static RegiaoAtendimento GetNew()
        {
            return new RegiaoAtendimento();
        }
    }
}
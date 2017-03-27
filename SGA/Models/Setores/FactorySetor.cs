using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Setores
{
    public class FactorySetor
    {
        internal static Setor GetNew()
        {
            return new Setor();
        }
    }
}
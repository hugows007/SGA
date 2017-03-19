using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.AreaAtendimentos
{
    public class FactoryArea
    {
        internal static AreaAtendimento GetNew()
        {
            return new AreaAtendimento();
        }
    }
}
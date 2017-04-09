using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.StatusChamados
{
    public class FactoryStatusChamado
    {
        internal static StatusChamado GetNew()
        {
            return new StatusChamado();
        }
    }
}
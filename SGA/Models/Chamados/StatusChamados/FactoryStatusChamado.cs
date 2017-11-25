using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados.StatusChamados
{
    public class FactoryStatusChamado : StatusChamado
    {
        internal static StatusChamado GetNew()
        {
            return new StatusChamado();
        }
    }
}
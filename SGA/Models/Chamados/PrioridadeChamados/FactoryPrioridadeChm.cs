﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados.PrioridadeChamados
{
    public class FactoryPrioridadeChm : PrioridadeChamado
    {
        internal static PrioridadeChamado GetNew()
        {
            return new PrioridadeChamado();
        }
    }
}
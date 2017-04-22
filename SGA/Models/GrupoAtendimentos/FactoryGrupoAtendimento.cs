using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.GrupoAtendimentos
{
    public class FactoryGrupoAtendimento
    {
        internal static GrupoAtendimento GetNew()
        {
            return new GrupoAtendimento();
        }
    }
}
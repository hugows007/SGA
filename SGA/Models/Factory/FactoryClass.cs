using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuario
{
    public abstract class FactoryClass
    {
        internal static IUsuario GetNew(TipoFactory TpFact)
        {
            switch (TpFact)
            {
                case TipoFactory.Usuario:
                    return new Usuario();
                default:
                    return null;
            }
        }
    }
}
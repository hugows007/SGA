using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Notificacoes
{
    public class FactoryNotificacao
    {
        internal static Notificacao GetNew()
        {
            return new Notificacao();
        }
    }
}
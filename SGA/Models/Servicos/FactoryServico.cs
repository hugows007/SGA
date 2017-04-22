using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Servicos
{
    public class FactoryServico
    {
        internal static Servico GetNewServico()
        {
            return new Servico();
        }

        internal static TipoServico GetNewTpServico()
        {
            return new TipoServico();
        }

    }
}
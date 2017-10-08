using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Geo
{
    public class FactoryGeo
    {
        public static Geo GetNew()
        {
            return new Geo();
        }
    }
}
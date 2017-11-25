using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Geos
{
    public class FactoryGeo : Geo
    {
        public static Geo GetNew()
        {
            return new Geo();
        }
    }
}
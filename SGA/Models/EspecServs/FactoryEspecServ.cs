﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.EspecServs
{
    public class FactoryEspecServ
    {
        internal static EspecServ GetNew()
        {
            return new EspecServ();
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.AreaAtendimentos
{
    public class AreaAtendimento
    {
        public int Id {get; set;}
        public string Regiao { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public int Status { get; set; }

    }
}
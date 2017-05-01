using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.RegiaoAtendimentos
{
    public class RegiaoAtendimento
    {
        public int Id {get; set;}
        public string Regiao { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public int IdStatus { get; set; }

    }
}
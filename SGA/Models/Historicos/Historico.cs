using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Historicos
{
    public class Historico
    {
        public int IdChamado { get; set; }
        public int IdAtendimento { get; set; }
        public int IdServico { get; set; }
        public int Like { get; set; }
        public string NomeServico { get; set; }
        public string DescricaoServ { get; set; }
        public string Resolucao { get; set; }

    }
}
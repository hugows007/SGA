using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Servicos
{
    public class Servico
    {
        public int Id { get; set; }
        public string Tipo { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public double Sla { get; set; }
        public int Status { get; set; }
    }
}
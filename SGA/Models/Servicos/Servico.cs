using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Servicos
{
    public class Servico
    {
        public int Id { get; set; }
        public int IdTipo { get; set; }
        public string NomeServ { get; set; }
        public string DescServ { get; set; }
        public double Sla { get; set; }
        public int IdStatus { get; set; }
        public int IdEmpresa { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Cargos
{
    public class Cargo
    {
        public int Id { get; set; }
        public string CargoDesc { get; set; }
        public decimal Salario { get; set; }
        public int Status { get; set; }
    }
}
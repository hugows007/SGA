using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Especialidades
{
    public class Especialidade
    {
        public int Id { get; set; }
        public string NomeEspec { get; set; }
        public string DetalheEspec { get; set; }
        public int IdStatus { get; set; }
    }
}
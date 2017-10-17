using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Avaliacoes
{
    public class Avaliacao
    {
        public int AvaAtend { get; set; }
        public int AvaChamado { get; set; }
        public string Comentario { get; set; }
        public int IdAtend { get; set; }
        public int IdChamado { get; set; }
    }
}
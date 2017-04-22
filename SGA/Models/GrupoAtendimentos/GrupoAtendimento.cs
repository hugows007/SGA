using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.GrupoAtendimentos
{
    public class GrupoAtendimento
    {
        public int Id { get; set; }
        public string NomeGpAtendimento { get; set; }
        public string DescGpAtendimento { get; set; }
        public int IdStatus { get; set; }
    }
}
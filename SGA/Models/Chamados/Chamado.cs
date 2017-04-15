using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados
{
    public class Chamado
    {
        public int Id { get; set; }
        public string Assunto { get; set; }
        public string Descricao { get; set; }
        public int IdStatus { get; set; }
        public DateTime DataAbertura { get; set; }
        public DateTime DataFechamento { get; set; }
        public int IdAreaAtendimento { get; set; }
        public int IdServico { get; set; }
    }
}
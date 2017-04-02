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
        public int Status { get; set; }
        public DateTime DataAbertura { get; set; }
        public DateTime DataFechamento { get; set; }
        public int AreaAtendimento { get; set; }
        public int Servico { get; set; }
    }
}
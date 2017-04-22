using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Servicos
{
    public class TipoServico
    {
        public int Id { get; set; }
        public string NomeTipoServ { get; set; }
        public int IdStatus { get; set; }
    }
}
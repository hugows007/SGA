using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Relatorios
{
    public class Relatorio
    {
        public int IdUsuario { get; set; }
        public string Usuario { get; set; }
        public int Media { get; set; }
        public int IdRelatorio { get; set; }
        public DateTime DataInicio { get; set; }
        public DateTime DataFim { get; set; }
        public int Status { get; set; }
        public string Mes{ get; set; }
        public bool RelatMes { get; set; }
        public bool RelatAno { get; set; }
        public int QtdChamadosAber { get; set; }
        public int QtdChamadosConc { get; set; }
        public int QtdChamadosEmAnd { get; set; }
        public int QtdChamadosRetra { get; set; }
        public int QtdChamadosCanc { get; set; }
    }
}
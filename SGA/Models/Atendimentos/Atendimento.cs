using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Atendimentos
{
    public class Atendimento
    {
        public int Id { get; set; }
        public DateTime DataInicioAtendimento { get; set; }
        public DateTime DataFimAtendimento { get; set; }
        public string Relatorio { get; set; }
        public int IdChamado { get; set; }
        public int IdTecnico { get; set; }
        public int IdCliente { get; set; }
        public int IdRegiaoAtendimento { get; set; }
        public double TempoAtendimento { get; set; }
        public string InfoPendencias { get; set; }
        public string InfoCancelamento { get; set; }
        public string InfoTramite { get; set; }
        public int IdEmpresa { get; set; }
        public string MotivoRecusa { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Relatorios
{
    public class Relatorio
    {
        #region Dashboard
        public string Usuario { get; set; }
        public int Media { get; set; }
        public int Status { get; set; }
        public string Mes { get; set; }
        public bool RelatMes { get; set; }
        public bool RelatAno { get; set; }
        public int QtdChamadosAber { get; set; }
        public int QtdChamadosConc { get; set; }
        public int QtdChamadosEmAnd { get; set; }
        public int QtdChamadosRetra { get; set; }
        public int QtdChamadosCanc { get; set; }
        #endregion

        #region Relatório
        public int Chamado { get; set; }
        public string Cliente { get; set; }
        public string Tecnico { get; set; }
        public string Assunto { get; set; }
        public string Servico { get; set; }
        public string Regiao { get; set; }
        public string Prioridade { get; set; }
        public string StatusChamado { get; set; }
        public DateTime DataAbertura { get; set; }
        public DateTime DataFechamento { get; set; }
        public DateTime DataInicioAtendimento { get; set; }
        public DateTime DataFimAtendimento { get; set; }
        public TimeSpan TempoAtendimento { get; set; }
        public TimeSpan SLA { get; set; }
        public string InformacaoCancelamento { get; set; }
        public int Reaberturas { get; set; }
        public int Pendencias { get; set; }
        public string FiltroRelatorio { get; set; }
        #endregion
    }
}
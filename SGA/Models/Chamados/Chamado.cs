﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chamados
{
    public class Chamado
    {
        public int Id { get; set; }
        public int IdCliente { get; set; }
        public string Assunto { get; set; }
        public string Descricao { get; set; }
        public int IdStatus { get; set; }
        public string Tramite { get; set; }
        public DateTime DataAbertura { get; set; }
        public DateTime DataFechamento { get; set; }
        public int IdServico { get; set; }
        public int IdPrioridade { get; set; }
        public string InfoCancelamento { get; set; }
        public string InfoTramite { get; set; }
        public string InfoPendencia { get; set; }
        public int IdEmpresa { get; set; }
        public bool Fila { get; set; }
        public bool Pendencia { get; set; }
        public bool Reabertura { get; set; }
    }
}
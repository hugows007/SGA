﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Notificacoes
{
    public class Notificacao
    {
        public int Id { get; set; }
        public int IdOrigem { get; set; }
        public int IdDest { get; set; }
        public string IdMSOrigem { get; set; }
        public string IdMSDest { get; set; }
        public string Mensagem { get; set; }
        public int Vista { get; set; }
        public string Perfil { get; set; }
        public DateTime Data { get; set; }
    }
}
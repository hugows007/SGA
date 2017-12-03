using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Notificacoes
{
    public class Notificacao
    {
        public int Id { get; set; }
        public int IdChamado { get; set; }
        public int IdMensagem { get; set; }
        public int IdOrigem { get; set; }
        public int IdDest { get; set; }
        public string IdMSOrigem { get; set; }
        public string IdMSDest { get; set; }
        public string Mensagem { get; set; }
        public string MensagemGlobal { get; set; }
        public int Vista { get; set; }
        public int IdTipo { get; set; }
        public string Perfil { get; set; }
        public string NomeUsuario { get; set; }
        public DateTime Data { get; set; }
    }
}
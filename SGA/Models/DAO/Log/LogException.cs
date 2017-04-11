using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.Log
{
    public class LogException
    {
        public string Mensagem { get; set; }
        public string Source { get; set; }
        public string StackTrace { get; set; }
        public string TargetSite { get; set; }
        public LogException(string Mensagem, string Source, string StackTrace, string TargetSite)
        {
            this.Mensagem = Mensagem;
            this.Source = Source;
            this.StackTrace = StackTrace;
            this.TargetSite = TargetSite;
        }
    }
}
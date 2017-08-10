using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Empresas
{
    public class Empresa
    {
        public int Id { get; set; }
        public string NomeEmpresa { get; set; }
        public string Endereco { get; set; }
        public string Complemento { get; set; }
        public string Cep { get; set; }
        public string Telefone { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuario
{
    public class UsuarioClienteFisico : IUsuario
    {
        public string Usuario { get; set; }
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Cep { get; set; }
        public string Telefone { get; set; }
        public string DocIdent { get; set; }
        public string OrgEmiss { get; set; }
        public string Cpf { get; set; }
        public string Cnpj { get; set; }
        public int Setor { get; set; }
        public int Cargo { get; set; }
        public int Especialidade { get; set; }
    }
}
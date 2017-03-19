using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
        public string Regra { get; set; }
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Cep { get; set; }
        public string Telefone { get; set; }
        public int IdAreaAtendimento { get; set; }
        public UsuarioClienteFisico ObjCF { get; set; }
        public UsuarioClienteJuridico ObjCJ { get; set; }
        public UsuarioGestor ObjG { get; set; }
        public UsuarioTecnico ObjT { get; set; }
    }
}
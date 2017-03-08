using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGA.Models.Usuario
{
    interface IUsuario
    {
        string Usuario { get; set; }
        string Nome { get; set; }
        string Endereco { get; set; }
        string Numero { get; set; }
        string Cep { get; set; }
        string Telefone { get; set; }
        string DocIdent { get; set; }
        string OrgEmiss { get; set; }
        string Cpf { get; set; }
        string Cnpj { get; set; }
        int Setor { get; set; }
        int Cargo { get; set; }
        int Especialidade { get; set; }
    }
}

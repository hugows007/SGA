using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Validacoes
{
    public static class ValidaCEP
    {
        static string Endereco { get; set; }
        static string Bairro { get; set; }
        static string Cidade { get; set; }
        static string UF { get; set; }
        static string EnderecoCompleto { get; set; }

        public static string GetCEPCorreios(string CEP, string Complemento)
        {
            try
            {
                var Ws = new WSCorreios.AtendeClienteClient();
                var Resposta = Ws.consultaCEP(CEP);

                Endereco = Resposta.end;
                Bairro = Resposta.bairro;
                Cidade = Resposta.cidade;
                UF = Resposta.uf;

                EnderecoCompleto = Endereco + " " + Complemento + " " + Bairro + " " + Cidade + " " + UF;

                return EnderecoCompleto.Replace(",", "");
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
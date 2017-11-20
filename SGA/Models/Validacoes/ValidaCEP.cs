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

        public static string GetCEPCorreios(string CEP)
        {
            try
            {
                var Ws = new WSCorreios.AtendeClienteClient();
                var Resposta = Ws.consultaCEP(CEP);

                Endereco = Resposta.end;
                Bairro = Resposta.bairro;
                Cidade = Resposta.cidade;
                UF = Resposta.uf;

                return Endereco + ", " + Bairro + ", " + Cidade + ", " + UF;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
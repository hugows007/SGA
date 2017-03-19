using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterSetorDAO
    {
        public SqlDataReader ConsultaSetoresDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetSetor = new SqlCommand(@"
                 SELECT [idSetor]
                      ,[setor]
                 FROM [SAS].[dbo].[Setor]
                 WHERE ativo = 1
                 ORDER BY setor", Con);

                SqlDataReader Result = CmdGetSetor.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
    }
}
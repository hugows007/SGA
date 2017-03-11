using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.AreaDeAtendimento
{
    public class AreaAtendimentoDAO
    {
        public SqlDataReader GetAreaDeAtendimento()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetArea = new SqlCommand(@"
                 SELECT [idAreaAtendimento]
                      ,[regiao]
                 FROM [SAS].[dbo].[AreaDeAtendimento]
                 WHERE ativo = 1
                 ORDER BY regiao", Con);

                SqlDataReader Result = CmdGetArea.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
    }
}
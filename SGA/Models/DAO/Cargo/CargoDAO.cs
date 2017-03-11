using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.AreaDeAtendimento
{
    public class CargoDAO
    {
        public SqlDataReader GetCargo()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetCargo = new SqlCommand(@"
                 SELECT [idCargo]
                      ,[cargo]
                 FROM [SAS].[dbo].[Cargo]
                 WHERE ativo = 1
                 ORDER BY cargo", Con);

                SqlDataReader Result = CmdGetCargo.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
    }
}
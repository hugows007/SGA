using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.DAO
{
    public class Conexao
    {
        public SqlConnection ConexaoDB()
        {
            SqlConnection Cn = new SqlConnection();
            Cn.ConnectionString = ConfigurationManager.ConnectionStrings["SASConnectionString"].ConnectionString;
            Cn.Open();

            return Cn;
        }
    }
}
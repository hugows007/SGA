using SGA.Models.DAO.Log;
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
            SqlConnection Cn = null;

            try
            {
                Cn = new SqlConnection();
                Cn.ConnectionString = ConfigurationManager.ConnectionStrings["SGAConnectionString"].ConnectionString;
                Cn.Open();

                return Cn;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
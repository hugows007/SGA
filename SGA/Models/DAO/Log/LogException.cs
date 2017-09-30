using SGA.DAO;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.Log
{
    public abstract class LogException
    {
        public static void InsereLogBd(Exception Ex)
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {

                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[LogExcecoesTratadas]
                ([exMensagem]
                  ,[exSource]
                  ,[exStackTrace]
                  ,[exTargetSite]
                  ,[exDate]
                  ,[exUser])
            VALUES
                (@exMensagem
                ,@exSource
                ,@exStackTrace    
                ,@exTargetSite
                ,@exDate
                ,@exUser);", Con);

                    Cmd.Parameters.AddWithValue("@exMensagem", Ex.Message);
                    Cmd.Parameters.AddWithValue("@exSource", Ex.Source);
                    Cmd.Parameters.AddWithValue("@exStackTrace", Ex.StackTrace);
                    Cmd.Parameters.AddWithValue("@exTargetSite", Ex.TargetSite.ToString());
                    Cmd.Parameters.AddWithValue("@exDate", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@exUser", new ManterUsuario().GetUsuarioLogado());

                    Cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {

                }
            }
        }
    }
}
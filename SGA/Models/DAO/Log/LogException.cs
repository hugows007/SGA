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
    public class LogException
    {
        public string Mensagem { get; set; }
        public string Source { get; set; }
        public string StackTrace { get; set; }
        public string TargetSite { get; set; }
        public LogException(Exception Ex)
        {
            this.Mensagem = Ex.Message;
            this.Source = Ex.Source;
            this.StackTrace = Ex.StackTrace;
            this.TargetSite = Ex.TargetSite.ToString();
        }
        public void InsereLogBd()
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

                    Cmd.Parameters.AddWithValue("@exMensagem", Mensagem);
                    Cmd.Parameters.AddWithValue("@exSource", Source);
                    Cmd.Parameters.AddWithValue("@exStackTrace", StackTrace);
                    Cmd.Parameters.AddWithValue("@exTargetSite", TargetSite);
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
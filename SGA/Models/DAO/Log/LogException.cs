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
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (Exception)
            {

            }
        }
        public static string CodigoErroBd()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
                        select max(id) from LogExcecoesTratadas;", Con);

                    Dr = Cmd.ExecuteReader();

                    return "Ocorreu um problema. Favor informar o código de erro " + Dr.GetInt32(0) + " para o suporte SGA TI.";
                }
            }
            catch (Exception)
            {
                return "Ocorreu um problema sistêmico. Não foi possível obter o código do erro. Favor entrar em contato com o suporte do SGA TI.";
            }
        }
    }
}
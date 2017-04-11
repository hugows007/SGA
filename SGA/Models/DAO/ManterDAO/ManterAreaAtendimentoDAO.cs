using SGA.DAO;
using SGA.Models.AreaAtendimentos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterAreaAtendimentoDAO
    {
        private AreaAtendimento ObjArea;
        public ManterAreaAtendimentoDAO()
        {

        }
        public ManterAreaAtendimentoDAO(AreaAtendimento ObjArea)
        {
            this.ObjArea = ObjArea;
        }
        public SqlDataReader ConsultaAreaAtendimentosDataReaderDAO()
        {
            SqlConnection Con = new Conexao().ConexaoDB();
            SqlDataReader Result = null;

            try
            {
                SqlCommand CmdGetArea = new SqlCommand(@"
                 SELECT [idAreaAtendimento]
                      ,[regiao]
                 FROM [dbo].[AreaDeAtendimento]
                 WHERE ativo = 1
                 ORDER BY regiao", Con);

                Result = CmdGetArea.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                Con.Close();
                Result.Close();
            }
        }
        public List<AreaAtendimento> ConsultaAreaAtendimentosDAO()
        {
            List<AreaAtendimento> AreaList = new List<AreaAtendimento>();
            SqlDataReader Dr = null;
            SqlConnection Con = new Conexao().ConexaoDB();

            try
            {
                SqlCommand CmdArea = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[AreaDeAtendimento]
                  WHERE ativo = 1", Con);

                Dr = CmdArea.ExecuteReader();

                while (Dr.Read())
                {
                    AreaAtendimento Usr = FactoryArea.GetNew();

                    Usr.Id = Dr.GetInt32(0);
                    Usr.Regiao = Dr.GetString(1);
                    Usr.Cidade = Dr.GetString(2);
                    Usr.Estado = Dr.GetString(3);

                    AreaList.Add(Usr);
                }
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                Dr.Close();
                Con.Close();
            }
            return AreaList;
        }
        public bool CadastraAreaAtendimentoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[AreaDeAtendimento]
                ([regiao]
                  ,[cidade]
                  ,[estado]
                  ,[ativo])
            VALUES
                (@Regiao
                ,@Cidade
                ,@Estado    
                ,1);", Con);

                Cmd.Parameters.AddWithValue("@Regiao", ObjArea.Regiao);
                Cmd.Parameters.AddWithValue("@Cidade", ObjArea.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", ObjArea.Estado);

                Cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
        }
        public AreaAtendimento ConsultaAreaAtendimentoByIdDAO()
        {
            SqlDataReader Dr = null;
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[AreaDeAtendimento]
                  WHERE ativo = 1 and idAreaAtendimento = @Id", Con);

                Cmd.Parameters.AddWithValue("@Id", ObjArea.Id);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    ObjArea.Id = Dr.GetInt32(0);
                    ObjArea.Regiao = Dr.GetString(1);
                    ObjArea.Cidade = Dr.GetString(2);
                    ObjArea.Estado = Dr.GetString(3);
                }

                return ObjArea;
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                Dr.Close();
                Con.Close();
            }
        }
        public bool AlteraAreaAtendimentoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[AreaDeAtendimento] SET 
	                    Regiao = @Regiao
                        Cidade = @Cidade
                        Estado = @Estado
                        WHERE idAreaAtendimento = @Id;", Con);

                Cmd.Parameters.AddWithValue("@Regiao", ObjArea.Regiao);
                Cmd.Parameters.AddWithValue("@Cidade", ObjArea.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", ObjArea.Estado);
                Cmd.Parameters.AddWithValue("@Id", ObjArea.Id);

                Cmd.ExecuteNonQuery();

                return true;
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
        }
        public bool InativarAreaAtendimentoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [SAS].[dbo].[AreaDeAtendimento] SET
                        ativo = 0                         
                    WHERE idAreaAtendimento = @Id;", Con);

                Cmd.Parameters.AddWithValue("@Id", ObjArea.Id);
                    
                Cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
            return true;
        }
    }
}
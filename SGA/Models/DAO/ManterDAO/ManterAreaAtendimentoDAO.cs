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
        public List<AreaAtendimento> ConsultaAreaAtendimentosDAO()
        {
            List<AreaAtendimento> AreaList = new List<AreaAtendimento>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

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
                if (Dr != null)
                    Dr.Close();
            }
            return AreaList;
        }
        public bool CadastraAreaAtendimentoDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsr = new SqlCommand(@"
            INSERT INTO [dbo].[AreaDeAtendimento]
                ([regiao]
                  ,[cidade]
                  ,[estado]
                  ,[ativo])
            VALUES
                ('" + ObjArea.Regiao +
                    "','" + ObjArea.Cidade +
                    "','" + ObjArea.Estado +
                    "','" + 1 +
                    "');", Con);

                CmdUsr.ExecuteNonQuery();
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
            SqlDataReader DrArea = null;

            try
            {
                SqlConnection ConArea = new Conexao().ConexaoDB();

                SqlCommand CmdArea = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[AreaDeAtendimento]
                  WHERE ativo = 1 and idAreaAtendimento =" + ObjArea.Id, ConArea);

                DrArea = CmdArea.ExecuteReader();

                while (DrArea.Read())
                {
                    ObjArea.Id = DrArea.GetInt32(0);
                    ObjArea.Regiao = DrArea.GetString(1);
                    ObjArea.Cidade = DrArea.GetString(2);
                    ObjArea.Estado = DrArea.GetString(3);
                }
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                if (DrArea != null)
                    DrArea.Close();
            }
            return ObjArea;
        }
        public bool AlteraAreaAtendimentoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdArea = new SqlCommand(@"
                UPDATE 
	                [dbo].[AreaDeAtendimento] SET 
	                    Regiao='" + ObjArea.Regiao + "'," +
                        "Cidade ='" + ObjArea.Cidade + "'," +
                        "Estado='" + ObjArea.Estado + "' " +
                        "WHERE idAreaAtendimento='" + ObjArea.Id + "'" +
                        ";", Con);

                CmdArea.ExecuteNonQuery();
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
        public bool InativarAreaAtendimentoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdArea = new SqlCommand(@"
                UPDATE 
	                [SAS].[dbo].[AreaDeAtendimento] SET
                        ativo=0 " +
                        "WHERE idAreaAtendimento='" + ObjArea.Id + "'" +
                        ";", Con);

                CmdArea.ExecuteNonQuery();
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
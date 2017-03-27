using SGA.DAO;
using SGA.Models.Especialidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterEspecialidadeDAO
    {
        private Especialidade ObjEspec;
        public ManterEspecialidadeDAO(Especialidade objEspec)
        {
            ObjEspec = objEspec;
        }
        public ManterEspecialidadeDAO()
        {
        }
        public SqlDataReader ConsultaEspecialidadesDataReaderDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idEspecialidade]
                      ,[especialidade]
                 FROM [SAS].[dbo].[Especialidade]
                 WHERE ativo = 1
                 ORDER BY especialidade", Con);

                SqlDataReader Result = Cmd.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
        public List<Especialidade> ConsultaEspecialidadesDAO()
        {
            List<Especialidade> EspecialidadeList = new List<Especialidade>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Especialidade]
                  WHERE ativo = 1", Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Especialidade Especialidades = FactoryEspecialidade.GetNew();

                    Especialidades.Id = Dr.GetInt32(0);
                    Especialidades.EspecialidadeDesc = Dr.GetString(1);
                    Especialidades.DetalheEspec = Dr.GetString(2);

                    EspecialidadeList.Add(Especialidades);
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
            return EspecialidadeList;
        }
        public bool CadastraEspecialidadeDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[especialidade]
                ([especialidade]
                  ,[detalhes]
                  ,[ativo])
            VALUES
                ('" + ObjEspec.EspecialidadeDesc +
                    "','" + ObjEspec.DetalheEspec +
                    "','" + 1 +
                    "');", Con);

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
        public List<Especialidade> ConsultaEspecialidadeByIdDAO()
        {
            List<Especialidade> EspecialidadeList = new List<Especialidade>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[especialidade]
                  WHERE ativo = 1 and idEspecialidade =" + ObjEspec.Id, Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Especialidade Especialidades = FactoryEspecialidade.GetNew();

                    Especialidades.Id = Dr.GetInt32(0);
                    Especialidades.EspecialidadeDesc = Dr.GetString(1);
                    Especialidades.DetalheEspec = Dr.GetString(2);
                    EspecialidadeList.Add(Especialidades);
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
            return EspecialidadeList;
        }
        public bool AlteraEspecialidadeDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[especialidade] SET 
	                    especialidade='" + ObjEspec.EspecialidadeDesc + "'," +
                        "detalhes='" + ObjEspec.DetalheEspec + "' " +
                        "WHERE idEspecialidade='" + ObjEspec.Id + "'" +
                        ";", Con);

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
        public bool InativaEspecialidadeDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Especialidade] SET
                        ativo=0 " +
                        "WHERE idEspecialidade='" + ObjEspec.Id + "'" +
                        ";", Con);

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
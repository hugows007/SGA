using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SGA.Models.Setores;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterSetorDAO
    {
        private Setor ObjSetor;

        public ManterSetorDAO()
        {

        }
        public ManterSetorDAO(Setor objSetor)
        {
            this.ObjSetor = objSetor;
        }
        public SqlDataReader ConsultaSetoresDataReaderDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idSetor]
                      ,[setor]
                 FROM [SAS].[dbo].[Setor]
                 WHERE ativo = 1
                 ORDER BY setor", Con);

                SqlDataReader Result = Cmd.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
        public List<Setor> ConsultaSetoresDAO()
        {
            List<Setor> SetorList = new List<Setor>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdArea = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Setor]
                  WHERE ativo = 1", Con);

                Dr = CmdArea.ExecuteReader();

                while (Dr.Read())
                {
                    Setor Usr = FactorySetor.GetNew();

                    Usr.Id = Dr.GetInt32(0);
                    Usr.SetorDesc = Dr.GetString(1);
                    Usr.Status = Dr.GetInt32(2);

                    SetorList.Add(Usr);
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
            return SetorList;
        }
        public bool CadastraSetorDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Setor]
                ([setor]
                  ,[ativo])
            VALUES
                ('" + ObjSetor.SetorDesc +
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
        public List<Setor> ConsultaSetorByIdDAO()
        {
            List<Setor> SetorList = new List<Setor>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Setor]
                  WHERE ativo = 1 and idSetor =" + ObjSetor.Id, Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Setor Setor = FactorySetor.GetNew();

                    Setor.Id = Dr.GetInt32(0);
                    Setor.SetorDesc = Dr.GetString(1);
                    Setor.Status = Dr.GetInt32(2);
                    SetorList.Add(Setor);
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
            return SetorList;
        }
        public bool AlteraSetorDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Setor] SET 
                        Setor='" + ObjSetor.SetorDesc + "' " +
                        "WHERE idSetor='" + ObjSetor.Id + "'" +
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
        public bool InativaSetorDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Setor] SET
                        ativo=0 " +
                        "WHERE idSetor='" + ObjSetor.Id + "'" +
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
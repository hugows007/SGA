using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SGA.Models.Setores;
using SGA.Models.DAO.Log;
using System.Web.Security;

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
        public List<Setor> ConsultaSetoresDAO()
        {
            List<Setor> SetorList = new List<Setor>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand CmdArea = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Setor]
                  WHERE ativo = 1", Con);

                    Dr = CmdArea.ExecuteReader();

                    while (Dr.Read())
                    {
                        Setor Usr = FactorySetor.GetNew();

                        Usr.Id = Dr.GetInt32(0);
                        Usr.NomeSetor = Dr.GetString(1);
                        Usr.IdStatus = Dr.GetInt32(2);

                        SetorList.Add(Usr);
                    }

                    return SetorList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public List<Setor> ConsultaSetorByIdDAO()
        {
            List<Setor> SetorList = new List<Setor>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Setor]
                  WHERE ativo = 1 and idSetor = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjSetor.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Setor Setor = FactorySetor.GetNew();

                        Setor.Id = Dr.GetInt32(0);
                        Setor.NomeSetor = Dr.GetString(1);
                        Setor.IdStatus = Dr.GetInt32(2);
                        SetorList.Add(Setor);
                    }

                    return SetorList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool CadastraSetorDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Setor]
                ([setor]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Setor
                 ,@Data
                 ,@Usuario 
                 ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Setor", ObjSetor.NomeSetor);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();
                    return true;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool AlteraSetorDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Setor] SET 
                       Setor = @Setor
                      ,dataRegistro = @Data
                      ,usuarioRegistro = @Usuario
                       WHERE idSetor = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Setor", ObjSetor.NomeSetor);
                    Cmd.Parameters.AddWithValue("@Id", ObjSetor.Id);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool InativaSetorDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Setor] SET
                        ativo = 0
                       ,dataRegistro = @Data
                       ,usuarioRegistro = @Usuario
                        WHERE idSetor = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjSetor.Id);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
    }
}
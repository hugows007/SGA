using SGA.DAO;
using SGA.Models.AreaAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterAreaAtendimentoDAO
    {
        private AreaAtendimento ObjArea;
        SqlConnection Con = null;
        public ManterAreaAtendimentoDAO()
        {

        }
        public ManterAreaAtendimentoDAO(AreaAtendimento ObjArea)
        {
            this.ObjArea = ObjArea;
        }
        public SqlDataReader ConsultaAreaAtendimentosDataReaderDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetArea = new SqlCommand(@"
                 SELECT [idAreaAtendimento]
                       ,[regiao]
                 FROM [dbo].[AreaDeAtendimento]
                 WHERE ativo = 1
                 ORDER BY regiao", Con);

                Dr = CmdGetArea.ExecuteReader();
                return Dr;
            }
            catch (SqlException Ex)
            {
                new LogException(Ex).InsereLogBd();

                throw;
            }
        }
        public List<AreaAtendimento> ConsultaAreaAtendimentosDAO()
        {
            List<AreaAtendimento> AreaList = new List<AreaAtendimento>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[AreaDeAtendimento]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        AreaAtendimento Usr = FactoryArea.GetNew();

                        Usr.Id = Dr.GetInt32(0);
                        Usr.Regiao = Dr.GetString(1);
                        Usr.Cidade = Dr.GetString(2);
                        Usr.Estado = Dr.GetString(3);

                        AreaList.Add(Usr);
                    }

                    return AreaList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public AreaAtendimento ConsultaAreaAtendimentoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
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
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool CadastraAreaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[AreaDeAtendimento]
                ([regiao]
                  ,[cidade]
                  ,[estado]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Regiao
                ,@Cidade
                ,@Estado
                ,@Data 
                ,@Usuario    
                ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Regiao", ObjArea.Regiao);
                    Cmd.Parameters.AddWithValue("@Cidade", ObjArea.Cidade);
                    Cmd.Parameters.AddWithValue("@Estado", ObjArea.Estado);
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
        public bool AlteraAreaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[AreaDeAtendimento] SET 
	                    Regiao = @Regiao
                        ,Cidade = @Cidade
                        ,Estado = @Estado
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idAreaAtendimento = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Regiao", ObjArea.Regiao);
                    Cmd.Parameters.AddWithValue("@Cidade", ObjArea.Cidade);
                    Cmd.Parameters.AddWithValue("@Estado", ObjArea.Estado);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());
                    Cmd.Parameters.AddWithValue("@Id", ObjArea.Id);

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
        public bool InativarAreaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[AreaDeAtendimento] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario                         
                    WHERE idAreaAtendimento = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjArea.Id);
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
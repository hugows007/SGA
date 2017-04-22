using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.GrupoAtendimentos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterGrupoAtendimentoDAO
    {
        private GrupoAtendimento ObjGpAtend;
        public ManterGrupoAtendimentoDAO()
        {

        }
        public ManterGrupoAtendimentoDAO(GrupoAtendimento ObjGpAtend)
        {
            this.ObjGpAtend = ObjGpAtend;
        }
        public List<GrupoAtendimento> ConsultaGrupoAtendimentosDAO()
        {
            List<GrupoAtendimento> GpAtendList = new List<GrupoAtendimento>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[GrupoAtendimento]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        GrupoAtendimento Gp = FactoryGrupoAtendimento.GetNew();

                        Gp.Id = Dr.GetInt32(0);
                        Gp.NomeGpAtendimento = Dr.GetString(1);
                        Gp.DescGpAtendimento = Dr.GetString(2);

                        GpAtendList.Add(Gp);
                    }

                    return GpAtendList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public GrupoAtendimento ConsultaGrupoAtendimentoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[GrupoAtendimento]
                  WHERE ativo = 1 and idGrupoAtendimento = @Id", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjGpAtend.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjGpAtend.Id = Dr.GetInt32(0);
                        ObjGpAtend.NomeGpAtendimento = Dr.GetString(1);
                        ObjGpAtend.DescGpAtendimento = Dr.GetString(2);
                    }

                    return ObjGpAtend;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool CadastraGrupoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[GrupoAtendimento]
                ([nome]
                  ,[descricao]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Nome
                ,@Desc
                ,@Data 
                ,@Usuario    
                ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Nome", ObjGpAtend.NomeGpAtendimento);
                    Cmd.Parameters.AddWithValue("@Desc", ObjGpAtend.DescGpAtendimento);
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
        public bool AlteraGrupoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[GrupoAtendimento] SET 
	                    Nome = @Nome
                        ,Descricao = @Desc
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idGrupoAtendimento = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Nome", ObjGpAtend.NomeGpAtendimento);
                    Cmd.Parameters.AddWithValue("@Desc", ObjGpAtend.DescGpAtendimento);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());
                    Cmd.Parameters.AddWithValue("@Id", ObjGpAtend.Id);

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
        public bool InativaGrupoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[GrupoAtendimento] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario                         
                    WHERE idGrupoAtendimento = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjGpAtend.Id);
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
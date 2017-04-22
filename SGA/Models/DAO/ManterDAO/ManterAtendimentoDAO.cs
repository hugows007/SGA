using SGA.DAO;
using SGA.Models.Atendimentos;
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterAtendimentoDAO
    {
        private Atendimento ObjAtendimento;
        public ManterAtendimentoDAO()
        {

        }
        public ManterAtendimentoDAO(Atendimento ObjAtendimento)
        {
            this.ObjAtendimento = ObjAtendimento;
        }
        public List<Atendimento> ConsultaAtendimentosDAO()
        {
            List<Atendimento> List = new List<Atendimento>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[DeAtendimento]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Atendimento Usr = FactoryAtendimento.GetNew();

                        Usr.Id = Dr.GetInt32(0);
                        //Usr.Regiao = Dr.GetString(1);
                        //Usr.Cidade = Dr.GetString(2);
                        //Usr.Estado = Dr.GetString(3);

                        List.Add(Usr);
                    }

                    return List;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public Atendimento ConsultaAtendimentoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[DeAtendimento]
                  WHERE ativo = 1 and idAtendimento = @Id", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjAtendimento.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjAtendimento.Id = Dr.GetInt32(0);
                        //ObjAtendimento.Regiao = Dr.GetString(1);
                        //ObjAtendimento.Cidade = Dr.GetString(2);
                        //ObjAtendimento.Estado = Dr.GetString(3);
                    }

                    return ObjAtendimento;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool CadastraAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Atendimento]
                ([idChamado]
                  ,[idTecnico]
                  ,[idCliente])
            VALUES
                (@IdChamado
                ,@IdTecnico
                ,@IdCliente);", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtendimento.IdChamado);
                    Cmd.Parameters.AddWithValue("@IdTecnico", ObjAtendimento.IdTecnico);
                    Cmd.Parameters.AddWithValue("@IdCliente", ObjAtendimento.IdCliente);

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
        public bool AlteraAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[DeAtendimento] SET 
	                    Regiao = @Regiao
                        ,Cidade = @Cidade
                        ,Estado = @Estado
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idAtendimento = @Id;", Con);

                    //Cmd.Parameters.AddWithValue("@Regiao", ObjAtendimento.Regiao);
                    //Cmd.Parameters.AddWithValue("@Cidade", ObjAtendimento.Cidade);
                    //Cmd.Parameters.AddWithValue("@Estado", ObjAtendimento.Estado);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());
                    Cmd.Parameters.AddWithValue("@Id", ObjAtendimento.Id);

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
        public bool CancelaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[DeAtendimento] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario                         
                    WHERE idAtendimento = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjAtendimento.Id);
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
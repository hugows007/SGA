using SGA.DAO;
using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
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
        Atendimento ObjAtend;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        public ManterAtendimentoDAO()
        {

        }
        public ManterAtendimentoDAO(Atendimento ObjAtendimento)
        {
            this.ObjAtend = ObjAtendimento;
        }
        public ManterAtendimentoDAO(Atendimento ObjAtend, Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
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
                  FROM [dbo].[Atendimento]
                  WHERE idAtendimento = @Id", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjAtend.Id = Dr.GetInt32(0);
                        ObjAtend.IdChamado = Dr.GetInt32(4);
                        ObjAtend.IdTecnico = Dr.GetInt32(5);
                        ObjAtend.IdCliente = Dr.GetInt32(6);
                        ObjAtend.IdRegiaoAtendimento = Dr.GetInt32(7);
                    }

                    return ObjAtend;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public Atendimento ConsultaAtendimentoByIdChamadoDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Atendimento]
                  WHERE idChamado = @IdChamado", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtend.IdChamado);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjAtend.Id = Dr.GetInt32(0);
                        ObjAtend.IdChamado = Dr.GetInt32(4);
                        ObjAtend.IdTecnico = Dr.GetInt32(5);
                        ObjAtend.IdCliente = Dr.GetInt32(6);
                        ObjAtend.IdRegiaoAtendimento = Dr.GetInt32(7);
                    }

                    return ObjAtend;
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
                  ,[idCliente]
                  ,[idRegiaoAtendimento])
            VALUES
                (@IdChamado
                ,@IdTecnico
                ,@IdCliente
                ,@IdRegiao);", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtend.IdChamado);
                    Cmd.Parameters.AddWithValue("@IdTecnico", ObjAtend.IdTecnico);
                    Cmd.Parameters.AddWithValue("@IdCliente", ObjAtend.IdCliente);
                    Cmd.Parameters.AddWithValue("@IdRegiao", ObjAtend.IdRegiaoAtendimento);

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
                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.Id);

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

                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.Id);
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
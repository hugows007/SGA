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
        DateTime D1;
        DateTime D2;
        public ManterAtendimentoDAO()
        {

        }
        public ManterAtendimentoDAO(Atendimento ObjAtendimento)
        {
            this.ObjAtend = ObjAtendimento;
        }
        public ManterAtendimentoDAO(Atendimento ObjAtend, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjAtend = ObjAtend;
        }
        public ManterAtendimentoDAO(Atendimento ObjAtend, Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
        }
        public ManterAtendimentoDAO(Atendimento ObjAtend, Usuario ObjUsuario)
        {
            this.ObjAtend = ObjAtend;
            this.ObjUsuario = ObjUsuario;
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
                  FROM [dbo].[Atendimento]
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
        public List<Usuario> ConsultaTecnicoAtendByChamadoDAO()
        {
            List<Usuario> List = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                   select Atd.idTecnico, Usr.nome from Atendimento Atd inner join Usuario Usr on (Atd.idTecnico = Usr.idUsuario) where 
                        Atd.idChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.IdChamado);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);

                        Usuario.Id = Dr.GetInt32(0);
                        Usuario.Nome = Dr.GetString(1);

                        List.Add(Usuario);
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
                  ,[idEmpresa]
                  ,[idRegiaoAtendimento])
            VALUES
                (@IdChamado
                ,@IdTecnico
                ,@IdCliente
                ,@Empresa
                ,@IdRegiao);", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtend.IdChamado);
                    Cmd.Parameters.AddWithValue("@IdTecnico", ObjAtend.IdTecnico);
                    Cmd.Parameters.AddWithValue("@IdCliente", ObjAtend.IdCliente);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool IniciaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Atendimento] SET 
                        dataInicioAtendimento = @Data
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idChamado = @IdChamado and idTecnico = @Tecnico;

                UPDATE 
	                [dbo].[Chamado] SET 
                        idStatusChamado = 2
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idChamado = @IdChamado;", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtend.IdChamado);
                    Cmd.Parameters.AddWithValue("@Tecnico", ObjAtend.IdTecnico);
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
        public bool CancelaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd;

                    if (GetAtendimentoNaoIniciado())
                    {
                        Cmd = new SqlCommand(@"
                            UPDATE 
	                            [dbo].[Atendimento] SET
                                    ,dataInicioAtendimento = @Data
                                    ,dataFimAtendimento = @Data
                                    ,dataRegistro = @Data
                                    ,usuarioRegistro = @Usuario                         
                                WHERE idAtendimento = @Id;", Con);
                    }
                    else
                    {
                        Cmd = new SqlCommand(@"
                            UPDATE 
	                            [dbo].[Atendimento] SET
                                    ,dataFimAtendimento = @Data
                                    ,dataRegistro = @Data
                                    ,usuarioRegistro = @Usuario                         
                                WHERE idAtendimento = @Id;", Con);
                    }

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
        public bool EncerraAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd;

                    Cmd = new SqlCommand(@"
                            UPDATE 
	                            [dbo].[Atendimento] SET
                                    dataFimAtendimento = @Data
                                    ,relatorioAtendimento = @Relatorio
                                    ,tempoAtendimento = @Tempo
                                    ,dataRegistro = @Data
                                    ,usuarioRegistro = @Usuario                         
                                WHERE idChamado = @Id;", Con);


                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.IdChamado);
                    Cmd.Parameters.AddWithValue("@Relatorio", ObjAtend.Relatorio);
                    Cmd.Parameters.AddWithValue("@Tempo", GetTempoAtendimento());
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
        public bool GetAtendimentoNaoIniciado()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                                select * from Atendimento where 
                                    idChamado = @Id and 
                                    dataInicioAtendimento is null;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjAtend.IdChamado);

                    Dr = Cmd.ExecuteReader();

                    if (Dr.Read())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public string GetTempoAtendimento()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT dataInicioAtendimento
                  FROM [dbo].[Atendimento]
                  WHERE idChamado = @IdChamado", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAtend.IdChamado);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        D1 = Dr.GetDateTime(0);
                        D2 = DateTime.Now;
                    }

                    return String.Format("{0: 0.00}", (D2 - D1).TotalHours).Replace(",", ".");
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
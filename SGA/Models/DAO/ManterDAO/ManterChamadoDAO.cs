using SGA.DAO;
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
    public class ManterChamadoDAO
    {
        private Chamado ObjChamado;
        private Usuario ObjUsuario;
        int QtdChamAbertos;
        int UltimoId;
        int ContadorPendencia;
        public ManterChamadoDAO()
        {

        }
        public ManterChamadoDAO(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public ManterChamadoDAO(Chamado ObjChamado, Usuario ObjUsuario)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
        }
        public List<Chamado> ConsultaChamadosDAO()
        {
            List<Chamado> ChamList = new List<Chamado>();
            SqlDataReader Dr = null;
            SqlCommand Cmd = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    if (ObjUsuario.Id.Equals(0))
                    {
                        Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Chamado] where idEmpresa = @Empresa", Con);

                        Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    }
                    else if (ObjChamado.Fila)
                    {
                        Cmd = new SqlCommand(@"
                 SELECT * FROM Chamado Chm inner join Atendimento Atd on (Chm.idChamado = Atd.idChamado) WHERE
                    Atd.idTecnico = @IdTecnico and Chm.idStatusChamado in (1,2,4) and Atd.dataFimAtendimento is null;", Con);

                        Cmd.Parameters.AddWithValue("@idTecnico", ObjUsuario.Id);
                    }
                    else
                    {
                        Cmd = new SqlCommand(@"
                SELECT * FROM Chamado Chm inner join Atendimento Atd on (Chm.idChamado = Atd.idChamado) WHERE
                    Atd.idTecnico = @IdTecnico;", Con);

                        Cmd.Parameters.AddWithValue("@idTecnico", ObjUsuario.Id);
                    }

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Chamado Cham = FactoryChamado.GetNew();

                        Cham.Id = Dr.GetInt32(0);
                        Cham.IdCliente = Dr.GetInt32(1);
                        Cham.Assunto = Dr.GetString(2);
                        Cham.Descricao = Dr.GetString(3);
                        Cham.IdStatus = Dr.GetInt32(4);
                        Cham.DataAbertura = Dr.GetDateTime(5);
                        Cham.DataFechamento = Dr.GetDateTime(6);
                        Cham.IdServico = Dr.GetInt32(7);
                        Cham.IdPrioridade = Dr.GetInt32(8);

                        ChamList.Add(Cham);
                    }

                    return ChamList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool AbreChamadoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Chamado]
                ([assunto]
                  ,[idCliente]
                  ,[descricao]
                  ,[contReabertura]
                  ,[contPendencia]
                  ,[idStatusChamado]
                  ,[dataAbertura]
                  ,[dataFechamento]
                  ,[idServico]
                  ,[idPrioridade]
                  ,[idEmpresa]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@Assunto
                ,@IdCliente
                ,@Desc
                ,0
                ,0
                ,1
                ,@DataAber
                ,@DataFech
                ,@Servico
                ,@Prioridade
                ,@Empresa
                ,@Data
                ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@Assunto", ObjChamado.Assunto);
                    Cmd.Parameters.AddWithValue("@IdCliente", ObjChamado.IdCliente);
                    Cmd.Parameters.AddWithValue("@Desc", ObjChamado.Descricao);
                    Cmd.Parameters.AddWithValue("@DataAber", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@DataFech", DateTime.Parse("2000-01-01 00:00:00.000"));
                    Cmd.Parameters.AddWithValue("@Servico", ObjChamado.IdServico);
                    Cmd.Parameters.AddWithValue("@Prioridade", ObjChamado.IdPrioridade);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();
                    return true;//
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public Chamado ConsultaChamadoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Chamado]
                  WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjChamado.Id = Dr.GetInt32(0);
                        ObjChamado.IdCliente = Dr.GetInt32(1);
                        ObjChamado.Assunto = Dr.GetString(2);
                        ObjChamado.Descricao = Dr.GetString(3);
                        ObjChamado.IdStatus = Dr.GetInt32(4);
                        ObjChamado.DataAbertura = Dr.GetDateTime(5);
                        ObjChamado.DataFechamento = Dr.GetDateTime(6);
                        ObjChamado.IdServico = Dr.GetInt32(7);
                        ObjChamado.IdPrioridade = Dr.GetInt32(8);

                        if (!Dr.IsDBNull(9))
                        {
                            ObjChamado.InfoCancelamento = Dr.GetString(9);

                        }
                        if (!Dr.IsDBNull(10))
                        {
                            ObjChamado.InfoTramite = Dr.GetString(10);
                        }
                        if (!Dr.IsDBNull(11))
                        {
                            ObjChamado.InfoPendencia = Dr.GetString(11);
                        }
                    }

                    return ObjChamado;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool AlteraChamadoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET 
	                    Assunto = @Assunto
                        ,idServico = @IdServ
                        ,Descricao = @Desc
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Assunto", ObjChamado.Assunto);
                    Cmd.Parameters.AddWithValue("@IdServ", ObjChamado.IdServico);
                    Cmd.Parameters.AddWithValue("@Desc", ObjChamado.Descricao);
                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool CancelaChamadoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET
                        idStatusChamado = 5
                        ,dataRegistro = @Data
                        ,dataFechamento = @Data
                        ,usuarioRegistro = @Usuario
                        ,infoCancelamento = @InfoCancel
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@InfoCancel", ObjChamado.InfoCancelamento);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool EncerraChamadoDAO()
        {
            SqlCommand Cmd;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    if (ObjChamado.Pendencia)
                    {
                        Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET
                        idStatusChamado = 4
                        ,usuarioRegistro = @Usuario
                        ,contPendencia = @CPend
                        ,dataRegistro = @Data
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                        Cmd.Parameters.AddWithValue("@CPend", GetContPendenciaDAO());
                    }
                    else
                    {
                        Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET
                        idStatusChamado = 3
                        ,dataFechamento = @Data
                        ,usuarioRegistro = @Usuario
                        ,dataRegistro = @Data
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);
                    }


                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool DeletaChamadoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                DELETE 
	                [dbo].[Chamado] 
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public int GetUltIdChamadoDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT MAX(idChamado)
                    from Chamado where idEmpresa = @Empresa", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        UltimoId = Dr.GetInt32(0);
                    }

                    return UltimoId;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public int GetQtdChamadosStatusAbertosDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                select count(*) 
                    from chamado 
                    where idStatusChamado = 1 and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        QtdChamAbertos = Dr.GetInt32(0);
                    }

                    return QtdChamAbertos;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public int GetContPendenciaDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT ContPendencia
                    from Chamado where idChamado = @Chamado", Con);

                    Cmd.Parameters.AddWithValue("@Chamado", ObjChamado.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ContadorPendencia = Dr.GetInt32(0);
                    }

                    return ContadorPendencia;
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
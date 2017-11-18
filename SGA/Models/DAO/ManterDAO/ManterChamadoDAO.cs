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
    public class ManterChamadoDAO
    {
        private Chamado ObjChamado;
        private Usuario ObjUsuario;
        private Atendimento ObjAtend;
        int UltimoId;
        int ContadorPendencia;
        int ContadorReabertura;
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
        public ManterChamadoDAO(Chamado ObjChamado, Atendimento ObjAtend)
        {
            this.ObjChamado = ObjChamado;
            this.ObjAtend = ObjAtend;
        }
        public List<Chamado> ConsultaChamadosDAO()
        {
            try
            {
                List<Chamado> ChamList = new List<Chamado>();
                SqlDataReader Dr = null;
                SqlCommand Cmd = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
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
                    else if (ObjUsuario.Perfil != null && ObjUsuario.Perfil.Equals("Cliente"))
                    {
                        Cmd = new SqlCommand(@"
                SELECT * FROM Chamado Chm inner join Atendimento Atd on (Chm.idChamado = Atd.idChamado) WHERE
                    Atd.idCliente = @IdCliente;", Con);

                        Cmd.Parameters.AddWithValue("@IdCliente", ObjUsuario.Id);
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool AbreChamadoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public Chamado ConsultaChamadoByIdDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
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
                        ObjChamado.InfoCancelamento = Dr[9].ToString();
                        ObjChamado.Tramite = Dr[10].ToString();
                        ObjChamado.InfoPendencia = Dr[11].ToString();

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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool AtualizaTramiteDAO()
        {
            try
            {
                SqlCommand Cmd;
                SqlDataReader Dr;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                SELECT infoTramite FROM
	                [dbo].[Chamado]
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Tramite", ObjChamado.Tramite);
                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjChamado.Tramite += Dr[0].ToString();
                    }

                    Dr.Close();

                    Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET 
	                    infoTramite = @Tramite
                        WHERE idChamado = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Tramite", ObjChamado.Tramite);
                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool ReabreChamadoDAO()
        {
            try
            {
                SqlCommand Cmd;
                SqlDataReader Dr;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                SELECT *
                    from Chamado where idChamado = @Chamado", Con);

                    Cmd.Parameters.AddWithValue("@Chamado", ObjChamado.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjChamado.Id = Dr.GetInt32(0);
                        ObjChamado.IdCliente = Dr.GetInt32(1);
                        ObjChamado.Assunto = Dr.GetString(2);
                        ObjChamado.Descricao = Dr.GetString(3);
                        ObjChamado.IdStatus = Dr.GetInt32(4);
                        ObjChamado.IdServico = Dr.GetInt32(7);
                        ObjChamado.IdPrioridade = Dr.GetInt32(8);
                    }

                    Dr.Close();

                    Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET 
	                    dataFechamento = '2000-01-01 00:00:00.000'
                        ,idStatusChamado = 4
                        ,ContPendencia = @ContPendencia
                        WHERE idChamado = @Chamado and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Chamado", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@ContPendencia", new ManterChamadoDAO(ObjChamado).GetContReaberturaDAO() + 1);

                    Cmd.ExecuteNonQuery();
                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool CancelaChamadoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool EncerraChamadoDAO()
        {
            try
            {
                SqlCommand Cmd;

                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool DeletaChamadoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public int GetUltIdChamadoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public int GetContPendenciaDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
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
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public int GetContReaberturaDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT ContReabertura
                    from Chamado where idChamado = @Chamado", Con);

                    Cmd.Parameters.AddWithValue("@Chamado", ObjChamado.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ContadorReabertura = Dr.GetInt32(0);
                    }

                    return ContadorReabertura;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool ValidaTempoFechamentoDAO()
        {
            try
            {
                SqlDataReader Dr = null;
                bool ValidaTempo;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
                        select * from chamado where 
                            dataFechamento > '2000-01-01 00:00:00.000' and 
                            dataFechamento > getdate() - 5 and
                            idChamado = @Chamado and
                            idEmpresa = @Empresa
                            order by 1", Con);

                    Cmd.Parameters.AddWithValue("@Chamado", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    if (Dr.Read())
                    {
                        ValidaTempo = true;
                    }
                    else
                    {
                        ValidaTempo = false;
                    }

                    return ValidaTempo;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
﻿using SGA.DAO;
using SGA.Models.Chamados;
using SGA.Models.DAO.Log;
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
        int QtdChamAbertos;
        int UltimoId;
        public ManterChamadoDAO()
        {

        }
        public ManterChamadoDAO(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public List<Chamado> ConsultaChamadosDAO()
        {
            List<Chamado> ChamList = new List<Chamado>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Chamado]", Con);

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
                  ,[idStatusChamado]
                  ,[dataAbertura]
                  ,[dataFechamento]
                  ,[idServico]
                  ,[idPrioridade]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@Assunto
                ,@IdCliente
                ,@Desc
                ,1
                ,@DataAber
                ,@DataFech
                ,@Servico
                ,@Prioridade
                ,@Data
                ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@Assunto", ObjChamado.Assunto);
                    Cmd.Parameters.AddWithValue("@IdCliente", ObjChamado.IdCliente);
                    Cmd.Parameters.AddWithValue("@Desc", ObjChamado.Descricao);
                    Cmd.Parameters.AddWithValue("@DataAber", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@DataFech", DateTime.Parse("2000-01-01 00:00:00.000"));
                    Cmd.Parameters.AddWithValue("@Servico", ObjChamado.IdServico);
                    Cmd.Parameters.AddWithValue("@Prioridade", ObjChamado.IdPrioridade);
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
                  WHERE idChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);

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
                        WHERE idChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Assunto", ObjChamado.Assunto);
                    Cmd.Parameters.AddWithValue("@IdServ", ObjChamado.IdServico);
                    Cmd.Parameters.AddWithValue("@Desc", ObjChamado.Descricao);
                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
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
                        ,usuarioRegistro = @Usuario
                        ,infoCancelamento = @InfoCancel
                        WHERE idChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
                    Cmd.Parameters.AddWithValue("@InfoCancel", ObjChamado.InfoCancelamento);
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
                        WHERE idChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjChamado.Id);
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
                    from Chamado", Con);

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
                    where idStatusChamado = 1;", Con);

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
    }
}
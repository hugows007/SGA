﻿using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Especialidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterEspecialidadeDAO
    {
        private Especialidade ObjEspec;
        public ManterEspecialidadeDAO(Especialidade objEspec)
        {
            ObjEspec = objEspec;
        }
        public ManterEspecialidadeDAO()
        {
        }
        public List<Especialidade> ConsultaEspecialidadesDAO()
        {
            List<Especialidade> EspecialidadeList = new List<Especialidade>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Especialidade]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Especialidade Especialidades = FactoryEspecialidade.GetNew();

                        Especialidades.Id = Dr.GetInt32(0);
                        Especialidades.NomeEspec = Dr.GetString(1);
                        Especialidades.DescEspec = Dr.GetString(2);

                        EspecialidadeList.Add(Especialidades);
                    }

                    return EspecialidadeList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public Especialidade ConsultaEspecialidadeByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[especialidade] WHERE
                   ativo = 1 and 
                   idEspecialidade = @Id", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjEspec.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjEspec.Id = Dr.GetInt32(0);
                        ObjEspec.NomeEspec = Dr.GetString(1);
                        ObjEspec.DescEspec = Dr.GetString(2);
                    }

                    return ObjEspec;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool CadastraEspecialidadeDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[especialidade]
                  ([especialidade]
                  ,[descricao]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Espec
                ,@Descricao
                ,@Data
                ,@Usuario  
                ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Espec", ObjEspec.NomeEspec);
                    Cmd.Parameters.AddWithValue("@Descricao", ObjEspec.DescEspec);
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
        public bool AlteraEspecialidadeDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[especialidade] SET 
	                    especialidade = @Espec
                        ,descricao= @Descricao
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario  
                        WHERE idEspecialidade= @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Espec", ObjEspec.NomeEspec);
                    Cmd.Parameters.AddWithValue("@Descricao", ObjEspec.DescEspec);
                    Cmd.Parameters.AddWithValue("@Id", ObjEspec.Id);
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
        public bool InativaEspecialidadeDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Especialidade] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idEspecialidade = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjEspec.Id);
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
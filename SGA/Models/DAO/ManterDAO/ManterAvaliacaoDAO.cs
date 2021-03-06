﻿using SGA.DAO;
using SGA.Models.Avaliacoes;
using SGA.Models.Chamados;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterAvaliacaoDAO : ManterAvaliacao
    {
        Avaliacao ObjAvaliacao;

        public ManterAvaliacaoDAO()
        {

        }
        public ManterAvaliacaoDAO(Avaliacao ObjAvaliacao)
        {
            this.ObjAvaliacao = ObjAvaliacao;
        }
        public Avaliacao ConsultaAvaliacaoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                    SELECT *
                      FROM [dbo].[Avaliacao]
                      where idChamado = @IdChamado and idEmpresa = @Empresa", Con);

                    Cmd.Parameters.AddWithValue("@IdChamado", ObjAvaliacao.IdChamado);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjAvaliacao.Comentario = Dr.GetString(2);
                    }

                    return ObjAvaliacao;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool IncluiAvaliacaoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Avaliacao]
                ([avaliacaoTecnico]
                  ,[avaliacaoAtendimento]
                  ,[comentario]
                  ,[idAtendimento]
                  ,[idChamado]
                  ,[idEmpresa]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@AvaTecnico
                ,@AvaAtend
                ,@Coment
                ,@IdAtend
                ,@IdChamad
                ,@IdEmpre
                ,@Data    
                ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@AvaTecnico", ObjAvaliacao.AvaAtend);
                    Cmd.Parameters.AddWithValue("@AvaAtend", ObjAvaliacao.AvaChamado);
                    Cmd.Parameters.AddWithValue("@Coment", ObjAvaliacao.Comentario);
                    Cmd.Parameters.AddWithValue("@IdAtend", ObjAvaliacao.IdAtend);
                    Cmd.Parameters.AddWithValue("@IdChamad", ObjAvaliacao.IdChamado);
                    Cmd.Parameters.AddWithValue("@IdEmpre", InfoGlobal.GlobalIdEmpresa);
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

        public bool IncluiAvaliacaoSolucaoDAO()
        {
            try
            {
                SqlCommand Cmd;
                SqlDataReader Dr;
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"SELECT * FROM AvaliacaoSolucao WHERE idAtendimento = @IdAtend and idChamado = @IdChamad;", Con);

                    Cmd.Parameters.AddWithValue("@IdAtend", ObjAvaliacao.IdAtend);
                    Cmd.Parameters.AddWithValue("@IdChamad", ObjAvaliacao.IdChamado);

                    Dr = Cmd.ExecuteReader();

                    if (Dr.HasRows)
                    {
                        while (Dr.Read())
                        {
                            ObjAvaliacao.LikeSolucao = Dr.GetInt32(0);
                            ObjAvaliacao.IdAtend = Dr.GetInt32(1);
                            ObjAvaliacao.IdChamado = Dr.GetInt32(2);
                        }

                        Dr.Close();

                        ObjAvaliacao.LikeSolucao++;

                        Cmd = new SqlCommand(@"
                            UPDATE [dbo].[AvaliacaoSolucao] SET
                                [likeSolucao] = " + ObjAvaliacao.LikeSolucao + @"
                            WHERE
                                 idAtendimento = @IdAtend AND
                                 idChamado = @IdChamad;", Con);

                        Cmd.Parameters.AddWithValue("@IdAtend", ObjAvaliacao.IdAtend);
                        Cmd.Parameters.AddWithValue("@IdChamad", ObjAvaliacao.IdChamado);

                        Cmd.ExecuteNonQuery();
                        return true;
                    }
                    else
                    {
                        Dr.Close();

                        Cmd = new SqlCommand(@"
                            INSERT INTO [dbo].[AvaliacaoSolucao]
                                ([likeSolucao]
                                  ,[idAtendimento]
                                  ,[idChamado]
                                  ,[idEmpresa]
                                  ,[dataRegistro]
                                  ,[usuarioRegistro])
                            VALUES
                                (@Like
                                ,@IdAtend
                                ,@IdChamad
                                ,@IdEmpre
                                ,@Data    
                                ,@Usuario);", Con);

                        Cmd.Parameters.AddWithValue("@Like", 1);
                        Cmd.Parameters.AddWithValue("@IdAtend", ObjAvaliacao.IdAtend);
                        Cmd.Parameters.AddWithValue("@IdChamad", ObjAvaliacao.IdChamado);
                        Cmd.Parameters.AddWithValue("@IdEmpre", InfoGlobal.GlobalIdEmpresa);
                        Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                        Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                        Cmd.ExecuteNonQuery();
                        return true;
                    }

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
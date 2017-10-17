using SGA.DAO;
using SGA.Models.Avaliacoes;
using SGA.Models.Chamados;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterAvaliacaoDAO
    {
        Avaliacao ObjAvaliacao;

        public ManterAvaliacaoDAO()
        {

        }
        public ManterAvaliacaoDAO(Avaliacao ObjAvaliacao)
        {
            this.ObjAvaliacao = ObjAvaliacao;
        }

        public bool IncluiAvaliacaoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
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
                catch (SqlException)
                {


                    throw;
                }
            }
        }
    }
}
using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Notificacoes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterNotificacaoDAO
    {
        public Notificacao ObjNotificacao;
        public ManterNotificacaoDAO()
        {

        }
        public ManterNotificacaoDAO(Notificacao ObjNotificacao)
        {
            this.ObjNotificacao = ObjNotificacao;
        }
        public bool NotificaUsuariosDAO()
        {
            SqlDataReader Dr = null;
            List<Notificacao> ListaNot = new List<Notificacao>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand CmdConsult = new SqlCommand(@"
                        SELECT Usr.idUsuario
                          FROM Usuario Usr inner join 
                          UsuarioXMemberShipUser UsrMb on (Usr.idUsuario = UsrMb.idUsuario) inner join
                          aspnet_UsersInRoles UsrRoles on (UsrMb.IdUsrMemberShip = UsrRoles.UserId) where
                          UsrRoles.RoleId = '5E106C37-3E4D-4B41-9EEE-F190EA99E534' and 
                          Usr.idUsuario <> @IdOrigem and
                          Usr.idEmpresa = (select idEmpresa from Usuario where idUsuario = @IdOrigem);", Con);

                    CmdConsult.Parameters.AddWithValue("@IdOrigem", ObjNotificacao.IdOrigem);
                    Dr = CmdConsult.ExecuteReader();

                    while (Dr.Read())
                    {
                        Notificacao Obj = FactoryNotificacao.GetNew();
                        Obj.IdDest = Dr.GetInt32(0);
                        ListaNot.Add(Obj);
                    }

                    Dr.Close();

                    foreach(var ListObj in ListaNot)
                    {
                            SqlCommand Cmd = new SqlCommand(@"
                                INSERT INTO [dbo].[notificacao]
                                      ([idUsuarioOrigem]
                                       ,[idUsuarioDestino]
                                       ,[mensagem]
                                       ,[vista]
                                       ,[dataRegistro])
                                VALUES
                                    (@IdOrigem
                                     ,@IdDest
                                     ,@Msg
                                     ,0
                                     ,@Data);", Con);

                        Cmd.Parameters.AddWithValue("@IdOrigem", ObjNotificacao.IdOrigem);
                        Cmd.Parameters.AddWithValue("@IdDest", ListObj.IdDest);
                        Cmd.Parameters.AddWithValue("@Msg", ObjNotificacao.Mensagem);
                        Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                        Cmd.ExecuteNonQuery();
                    }
                    
                    return true;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool AtualizaNotificacaoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Notificacao] SET 
	                    vista = 1
                        WHERE idNotificacao = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjNotificacao.Id);

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
        public List<Notificacao> InformaNotificacaoDAO()
        {
            SqlDataReader Dr = null;
            List<Notificacao> ListaNot = new List<Notificacao>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                        SELECT *
                          FROM [dbo].[Notificacao] 
                          WHERE idUsuarioDestino = @IdDest and vista = 0;", Con);

                    Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Notificacao Obj = FactoryNotificacao.GetNew();
                        Obj.Id = Dr.GetInt32(0);
                        Obj.IdOrigem = Dr.GetInt32(1);
                        Obj.IdDest = Dr.GetInt32(2);
                        Obj.Mensagem = Dr.GetString(3);
                        Obj.Vista = Dr.GetInt32(4);
                        Obj.Data = Dr.GetDateTime(5);
                        ListaNot.Add(Obj);
                    }

                    return ListaNot;
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
using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterNotificacaoDAO : ManterNotificacao
    {
        public ManterNotificacaoDAO()
        {

        }
        public ManterNotificacaoDAO(Notificacao ObjNotificacao)
        {
            this.ObjNotificacao = ObjNotificacao;
        }
        public ManterNotificacaoDAO(Notificacao ObjNotificacao, Usuario ObjUsuario)
        {
            this.ObjNotificacao = ObjNotificacao;
            this.ObjUsuario = ObjUsuario;
        }
        public bool NotificaUsuariosChatDAO()
        {
            try
            {
                SqlDataReader Dr = null;
                List<Notificacao> ListaNot = new List<Notificacao>();

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand CmdConsult = new SqlCommand(@"
                        SELECT Usr.idUsuario
                          FROM Usuario Usr inner join 
                          UsuarioXMemberShipUser UsrMb on (Usr.idUsuario = UsrMb.idUsuario) inner join
                          aspnet_UsersInRoles UsrRoles on (UsrMb.IdUsrMemberShip = UsrRoles.UserId) where
                          UsrRoles.RoleId in ('5E106C37-3E4D-4B41-9EEE-F190EA99E534', '4355C114-EAF9-4B05-B6D2-3CB47FFAE948', '6A0BD300-3942-49E5-8307-F0DBC1591186') and 
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

                    if (ObjUsuario == null)
                    {
                        foreach (var ListObj in ListaNot)
                        {
                            SqlCommand Cmd = new SqlCommand(@"
                                INSERT INTO [dbo].[notificacao]
                                      ([idUsuarioOrigem]
                                       ,[idUsuarioDestino]
                                       ,[idMsgNotificacao]
                                       ,[idTipo]
                                       ,[vista]
                                       ,[dataRegistro])
                                VALUES
                                    (@IdOrigem
                                     ,@IdDest
                                     ,@Msg
                                     ,@Tipo
                                     ,0
                                     ,@Data);", Con);

                            Cmd.Parameters.AddWithValue("@IdOrigem", ObjNotificacao.IdOrigem);
                            Cmd.Parameters.AddWithValue("@IdDest", ListObj.IdDest);
                            Cmd.Parameters.AddWithValue("@Msg", ObjNotificacao.IdMensagem);
                            Cmd.Parameters.AddWithValue("@Tipo", ObjNotificacao.IdTipo);
                            Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                            Cmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        ObjNotificacao.IdDest = new ManterUsuarioDAO(ObjUsuario).ConsultaIdUsuarioByIdMBDAO().Id;

                        SqlCommand Cmd = new SqlCommand(@"
                                 INSERT INTO [dbo].[notificacao]
                                      ([idUsuarioOrigem]
                                       ,[idUsuarioDestino]
                                       ,[idMsgNotificacao]
                                       ,[idTipo]
                                       ,[vista]
                                       ,[dataRegistro])
                                VALUES
                                    (@IdOrigem
                                     ,@IdDest
                                     ,@Msg
                                     ,@Tipo
                                     ,0
                                     ,@Data);", Con);

                        Cmd.Parameters.AddWithValue("@IdOrigem", ObjNotificacao.IdOrigem);
                        Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                        Cmd.Parameters.AddWithValue("@Msg", ObjNotificacao.IdMensagem);
                        Cmd.Parameters.AddWithValue("@Tipo", ObjNotificacao.IdTipo);
                        Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                        Cmd.ExecuteNonQuery();
                    }

                    return true;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool AtualizaNotificacaoDAO()
        {
            try
            {
                SqlCommand Cmd;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    if (!ObjNotificacao.Id.Equals(0))
                    {
                        Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Notificacao] SET 
	                    vista = 1
                        WHERE idNotificacao = @Id;", Con);

                        Cmd.Parameters.AddWithValue("@Id", ObjNotificacao.Id);

                        Cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Notificacao] SET 
	                    vista = 1
                        WHERE idUsuarioDestino = @IdDest and idTipo = @Tipo;", Con);

                        Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                        Cmd.Parameters.AddWithValue("@Tipo", ObjNotificacao.IdTipo);

                        Cmd.ExecuteNonQuery();
                    }

                    return true;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool NotificaUsuariosSistemDAO()
        {
            try
            {
                SqlCommand Cmd;
                SqlDataReader Dr;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                        select * 
                            from Notificacao where 
                            idUsuarioOrigem = @IdOrig and 
                            idUsuarioDestino = @IdDest and 
                            vista = 0 and
                            dataRegistro < getdate() and
                            idMsgNotificacao = @Msg;", Con);

                    Cmd.Parameters.AddWithValue("@IdOrig", ObjNotificacao.IdOrigem);
                    Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                    Cmd.Parameters.AddWithValue("@Msg", ObjNotificacao.IdMensagem);

                    Dr = Cmd.ExecuteReader();

                    if (!Dr.Read())
                    {
                        Dr.Close();

                        Cmd = new SqlCommand(@"
                            INSERT INTO [dbo].[notificacao]
                                      ([idUsuarioOrigem]
                                       ,[idUsuarioDestino]
                                       ,[idMsgNotificacao]
                                       ,[idTipo]
                                       ,[vista]
                                       ,[dataRegistro])
                                VALUES
                                    (@IdOrigem
                                     ,@IdDest
                                     ,@Msg
                                     ,@Tipo
                                     ,0
                                     ,@Data);", Con);


                        Cmd.Parameters.AddWithValue("@IdOrigem", ObjNotificacao.IdOrigem);
                        Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                        Cmd.Parameters.AddWithValue("@Msg", ObjNotificacao.IdMensagem);
                        Cmd.Parameters.AddWithValue("@Tipo", ObjNotificacao.IdTipo);
                        Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                        Cmd.ExecuteNonQuery();

                        return true;
                    }

                    return true;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Notificacao> InformaNotificacaoDAO()
        {
            try
            {
                SqlDataReader Dr = null;
                List<Notificacao> ListaNot = new List<Notificacao>();

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                        SELECT * FROM 
                            Notificacao Nt inner join 
                            NotificacaoMensagem NtMsg on (Nt.idMsgNotificacao = NtMsg.idMsgNotificacao) inner join 
                            Usuario Usr on (Nt.idUsuarioDestino = Usr.idUsuario)  left join 
							Usuario Usr2 on (Nt.idUsuarioOrigem = Usr2.idUsuario) left join
							UsuarioXMemberShipUser UsrMb on (Usr2.idUsuario = UsrMb.idUsuario) left join
							aspnet_Users Mb on (Usrmb.IdUsrMemberShip = Mb.UserId) where
							idUsuarioDestino = @IdDest and 
                            vista = 0;", Con);

                    Cmd.Parameters.AddWithValue("@IdDest", ObjNotificacao.IdDest);
                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Notificacao Obj = FactoryNotificacao.GetNew();
                        Obj.Id = Dr.GetInt32(0);
                        Obj.IdOrigem = Dr.GetInt32(1);
                        Obj.IdDest = Dr.GetInt32(2);
                        Obj.IdMensagem = Dr.GetInt32(3);
                        Obj.IdTipo = Dr.GetInt32(4);
                        Obj.Vista = Dr.GetInt32(5);
                        Obj.Data = Dr.GetDateTime(6);
                        Obj.Mensagem = Dr.GetString(8);
                        if (!Dr.IsDBNull(33))
                        {
                            Obj.NomeUsuario = Dr.GetString(33);
                        }

                        if (Obj.IdMensagem.Equals(10))
                        {
                            Obj.Mensagem += " " + Obj.NomeUsuario;
                        }

                        ListaNot.Add(Obj);
                    }

                    return ListaNot;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
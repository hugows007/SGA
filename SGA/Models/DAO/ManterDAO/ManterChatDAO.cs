using SGA.DAO;
using SGA.Models.Chats;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterChatDAO
    {
        Chat ObjChat;
        Usuario ObjUsuario;

        public ManterChatDAO()
        {

        }
        public ManterChatDAO(Chat ObjChat)
        {
            this.ObjChat = ObjChat;
        }
        public ManterChatDAO(Chat ObjChat, Usuario ObjUsuario)
        {
            this.ObjChat = ObjChat;
            this.ObjUsuario = ObjUsuario;
        }
        public bool CriaSalaPrivadaDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[ChatPrivado]
                  ([idUsuarioOrig]
                  ,[idUsuarioDest]
                  ,[dataSala])
            VALUES
                (@UsrOrig
                ,@UsrDest
                ,@Data);", Con);

                    Cmd.Parameters.AddWithValue("@UsrOrig", ObjChat.ObjChatPrivado.IdUsrMBOrig);
                    Cmd.Parameters.AddWithValue("@UsrDest", ObjChat.ObjChatPrivado.IdUsrMBDest);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                    Cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                throw;
            }
        }
        public bool GravaChatDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Mensagem]
                  ([usuario]
                  ,[mensagem]
                  ,[dataMensagem])
            VALUES
                (@Usuario
                ,@Mensagem
                ,@DataMensagem);", Con);

                    Cmd.Parameters.AddWithValue("@Usuario", ObjChat.Usuario);
                    Cmd.Parameters.AddWithValue("@Mensagem", ObjChat.Mensagem);
                    Cmd.Parameters.AddWithValue("@DataMensagem", DateTime.Now);

                    Cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                throw;
            }
        }
        public bool GravaChatPrivadoDAO()
        {
            SqlDataReader Dr;
            SqlCommand Cmd;

            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Mensagem]
                  ([usuario]
                  ,[mensagem]
                  ,[dataMensagem])
            VALUES
                (@Usuario
                ,@Mensagem
                ,@DataMensagem);", Con);

                    Cmd.Parameters.AddWithValue("@Usuario", ObjChat.Usuario);
                    Cmd.Parameters.AddWithValue("@Mensagem", ObjChat.Mensagem);
                    Cmd.Parameters.AddWithValue("@DataMensagem", DateTime.Now);

                    Cmd.ExecuteNonQuery();

                    Cmd = new SqlCommand(@"
                       SELECT MAX([idChat])
                            FROM [dbo].[Mensagem];", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjChat.IdMensagem = Dr.GetInt32(0);
                    }

                    Dr.Close();

                    Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[MensagemXChatPrivado]
                  ([idChat]
                  ,[idChatPrivado])
            VALUES
                (@IdMensagem
                ,@IdChatP);", Con);

                    Cmd.Parameters.AddWithValue("@IdMensagem", ObjChat.IdMensagem);
                    Cmd.Parameters.AddWithValue("@IdChatP", ObjChat.ObjChatPrivado.IdPrivado);

                    Cmd.ExecuteNonQuery();

                    return true;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                throw;
            }
        }
        public List<Chat> RetornaSalasDAO()
        {
            SqlDataReader Dr = null;
            List<Chat> ChatList = new List<Chat>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                       SELECT	    MsgP.idChatPrivado
	                               ,MsgP.idUsuarioOrig
	                               ,MsgP.idUsuarioDest
								   ,Usr.idUsuario
								   ,Usr.Nome
                      FROM ChatPrivado MsgP INNER JOIN
					  UsuarioXMemberShipUser UsrMB ON (MsgP.idUsuarioOrig = UsrMB.IdUsrMemberShip OR MsgP.idUsuarioDest = UsrMB.IdUsrMemberShip) INNER JOIN
					  Usuario Usr ON (UsrMB.idUsuario = Usr.idUsuario) WHERE
					  MsgP.idUsuarioOrig = @UsrOrig or MsgP.idUsuarioDest = @UsrOrig;", Con);

                    Cmd.Parameters.AddWithValue("@UsrOrig", ObjChat.ObjChatPrivado.IdUsrMBOrig);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Chat Lista = FactoryChat.GetNew(TipoChat.Privado);
                        Lista.ObjChatPrivado.IdPrivado = Dr.GetInt32(0);
                        Lista.ObjChatPrivado.IdUsrMBOrig = Dr.GetGuid(1).ToString();
                        Lista.ObjChatPrivado.IdUsrMBDest = Dr.GetGuid(2).ToString();
                        Lista.ObjChatPrivado.IdUsrDest = Dr.GetInt32(3);
                        Lista.ObjChatPrivado.NomeDest = Dr.GetString(4);
                        ChatList.Add(Lista);
                    }

                    return ChatList;
                }
                catch (SqlException Ex)
                {
                    LogException.InsereLogBd(Ex);
                    throw;
                }
            }
        }
        public List<Chat> RetornaChatDAO()
        {
            SqlDataReader Dr = null;
            List<Chat> ChatList = new List<Chat>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT top 5 *
                  FROM Mensagem Msg WHERE
				  idChat NOT IN 
						(
                          select idChat from 
						    MensagemXChatPrivado MsgP where 
							MsgP.idChat = Msg.idChat
						)
                ORDER BY idChat desc;", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Chat Lista = FactoryChat.GetNew(TipoChat.Publico);
                        Lista.Usuario = Dr.GetString(1);
                        Lista.Mensagem = Dr.GetString(2);
                        Lista.DataMensagem = Dr.GetDateTime(3);
                        ChatList.Add(Lista);
                    }

                    return ChatList;
                }
                catch (SqlException Ex)
                {
                    LogException.InsereLogBd(Ex);
                    throw;
                }
            }
        }
        public List<Chat> RetornaChatPrivadoDAO()
        {
            SqlDataReader Dr = null;
            List<Chat> ChatList = new List<Chat>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                      SELECT  Msg.idChat
	                       ,Msg.usuario
	                       ,Msg.mensagem
	                       ,Msg.dataMensagem
	                       ,MsgP.idChatPrivado
	                       ,MsgP.idUsuarioOrig
	                       ,MsgP.idUsuarioDest
                      FROM Mensagem Msg INNER JOIN 
                      MensagemXChatPrivado MsgX ON (Msg.idChat = MsgX.idChat) INNER JOIN
                      ChatPrivado MsgP ON (MsgX.idChatPrivado = MsgP.idChatPrivado) WHERE
                      MsgP.idChatPrivado = @IdPrivado;", Con);

                    Cmd.Parameters.AddWithValue("@IdPrivado", ObjChat.ObjChatPrivado.IdPrivado);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Chat Lista = FactoryChat.GetNew(TipoChat.Privado);
                        Lista.Usuario = Dr.GetString(1);
                        Lista.Mensagem = Dr.GetString(2);
                        Lista.DataMensagem = Dr.GetDateTime(3);
                        Lista.ObjChatPrivado.IdPrivado = Dr.GetInt32(4);
                        Lista.ObjChatPrivado.IdUsrMBOrig = Dr.GetGuid(5).ToString();
                        Lista.ObjChatPrivado.IdUsrMBDest = Dr.GetGuid(6).ToString();
                        ChatList.Add(Lista);
                    }

                    return ChatList;
                }
                catch (SqlException Ex)
                {
                    LogException.InsereLogBd(Ex);
                    throw;
                }
            }
        }
        public bool ValidaChatCriadoDAO()
        {
            SqlDataReader Dr = null;
            List<Chat> ChatList = new List<Chat>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                        SELECT [idChatPrivado]
                              ,[idUsuarioOrig]
                              ,[idUsuarioDest]
                              ,[dataSala]
                          FROM [dbo].[ChatPrivado] WHERE
                          [idUsuarioOrig] = @IdUsrMBOrig AND [idUsuarioDest] = @IdUsrMBDest OR
                          [idUsuarioOrig] = @IdUsrMBDest AND [idUsuarioDest] = @IdUsrMBOrig;", Con);

                    Cmd.Parameters.AddWithValue("@IdUsrMBOrig", ObjChat.ObjChatPrivado.IdUsrMBOrig);
                    Cmd.Parameters.AddWithValue("@IdUsrMBDest", ObjChat.ObjChatPrivado.IdUsrMBDest);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        return true;
                    }

                    return false;
                }
                catch (SqlException Ex)
                {
                    LogException.InsereLogBd(Ex);
                    throw;
                }
            }
        }
    }
}
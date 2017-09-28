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
                new LogException(Ex).InsereLogBd();
                throw;
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
                  FROM [dbo].[Mensagem] order by idChat desc;", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Chat Lista = new Chat();
                        Lista.Usuario = Dr.GetString(1);
                        Lista.Mensagem = Dr.GetString(2);
                        Lista.DataMensagem = Dr.GetDateTime(3);
                        ChatList.Add(Lista);
                    }

                    return ChatList;
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
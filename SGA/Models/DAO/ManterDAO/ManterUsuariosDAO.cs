using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterUsuarioDAO
    {
        string LastId;
        string MembershipId;
        Usuario ObjUsuario = null;
        string RegraForUSer;

        public ManterUsuarioDAO(Usuario ObjUsr, string MbId)
        {
            ObjUsuario = ObjUsr;
            MembershipId = MbId;
        }
        public ManterUsuarioDAO(Usuario ObjUsr)
        {
            ObjUsuario = ObjUsr;

        }
        public ManterUsuarioDAO() { }
        public List<Usuario> ConsultaUsuariosDAO()
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand CmdUsrs = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Usuario]
                  WHERE idStatusUsuario = 1", Con);

                    Dr = CmdUsrs.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = new Usuario();

                        Usr.Id = Dr.GetInt32(0);
                        Usr.Nome = Dr.GetString(1);
                        Usr.Endereco = Dr.GetString(2);
                        Usr.Numero = Dr.GetString(3);
                        Usr.Cep = Dr.GetString(4);
                        Usr.Telefone = Dr.GetString(5);
                        Usr.Regra = GetRegraUserDAO(Usr.Id);

                        UsrList.Add(Usr);
                    }

                    return UsrList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public List<Usuario> ConsultaUsuariosDAOById()
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlCommand Cmd = null;
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    if (!0.Equals(ObjUsuario.Id))
                    {
                        Cmd = new SqlCommand(@"
                    SELECT *
                      FROM [dbo].[Usuario]
                      WHERE idStatusUsuario = 1 and idUsuario = @Id;", Con);

                        Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);

                    }
                    else if (!ObjUsuario.Nome.Equals("null"))
                    {
                        Cmd = new SqlCommand(@"
                    SELECT 
                        usr.idUsuario
                        ,usr.nome
                        ,usr.endereco
                        ,usr.numero
                        ,usr.cep
                        ,usr.telefone
                        ,usr.idStatusUsuario
                        ,usr.idAreaAtendimento FROM 
                        Usuario usr inner join 
                        UsuarioXMemberShipUser membxusr on (usr.idUsuario = membxusr.idUsuario) inner join
                        aspnet_Users membusr on (membxusr.IdUsrMemberShip = membusr.UserId) WHERE
                        membusr.UserName = @Nome", Con);

                        Cmd.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    }

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = new Usuario();

                        Usr.Id = Dr.GetInt32(0);
                        Usr.Nome = Dr.GetString(1);
                        Usr.Endereco = Dr.GetString(2);
                        Usr.Numero = Dr.GetString(3);
                        Usr.Cep = Dr.GetString(4);
                        Usr.Telefone = Dr.GetString(5);
                        Usr.IdStatus = Dr.GetInt32(6);
                        Usr.IdAreaAtendimento = Dr.GetInt32(7);
                        Usr.Regra = GetRegraUserDAO(Usr.Id);
                        UsrList.Add(Usr);
                    }

                    return UsrList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool CadastraUsuarioDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand CmdUsr = new SqlCommand(@"
            INSERT INTO [dbo].[Usuario]
                ([nome]
                ,[endereco]
                ,[numero]
                ,[cep]
                ,[telefone]
                ,[idAreaAtendimento]
                ,[dataRegistro]
                ,[usuarioRegistro]
                ,[idStatusUsuario])
            VALUES
                (@Nome
                ,@Endereco
                ,@Numero
                ,@Cep
                ,@Telefone
                ,@Area
                ,@Data
                ,@Usuario 
                ,1);", Con);

                    CmdUsr.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    CmdUsr.Parameters.AddWithValue("@Endereco", ObjUsuario.Endereco);
                    CmdUsr.Parameters.AddWithValue("@Numero", ObjUsuario.Numero);
                    CmdUsr.Parameters.AddWithValue("@Cep", ObjUsuario.Cep);
                    CmdUsr.Parameters.AddWithValue("@Telefone", ObjUsuario.Telefone);
                    CmdUsr.Parameters.AddWithValue("@Area", ObjUsuario.IdAreaAtendimento);
                    CmdUsr.Parameters.AddWithValue("@Data", DateTime.Now);
                    CmdUsr.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    CmdUsr.ExecuteNonQuery();

                    LastId = GetUltimoIdUsuarioDAO();

                    SqlCommand CmdUsrMS = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXMemberShipUser]
                ([idUsuario]
                ,[IdUsrMemberShip])
            VALUES
                (@LastId
                ,@MembId);", Con);

                    CmdUsrMS.Parameters.AddWithValue("@LastId", LastId);
                    CmdUsrMS.Parameters.AddWithValue("@MembId", MembershipId);

                    CmdUsrMS.ExecuteNonQuery();

                    switch (ObjUsuario.Regra)
                    {
                        case "Técnico":

                            SqlCommand CmdUsrT = new SqlCommand(@"
            INSERT INTO [dbo].[Tecnico]
                ([idUsuario]
                  ,[idEspecialidade]
                  ,[idCargo]
                  ,[idSetor])
            VALUES
                (@LastId
                ,@Espec
                ,@Cargo
                ,@Setor);", Con);

                            CmdUsrT.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrT.Parameters.AddWithValue("@Espec", ObjUsuario.ObjT.IdEspecialidade);
                            CmdUsrT.Parameters.AddWithValue("@Cargo", ObjUsuario.ObjT.IdCargo);
                            CmdUsrT.Parameters.AddWithValue("@Setor", ObjUsuario.ObjT.IdSetor);

                            CmdUsrT.ExecuteNonQuery();

                            return true;

                        case "Gestor":

                            SqlCommand CmdUsrG = new SqlCommand(@"
            INSERT INTO [dbo].[Gestor]
                ([idUsuario]
                  ,[idSetor]
                  ,[idCargo])
            VALUES
                (@LastId
                ,@Setor
                ,@Cargo);", Con);

                            CmdUsrG.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrG.Parameters.AddWithValue("@Setor", ObjUsuario.ObjG.IdSetor);
                            CmdUsrG.Parameters.AddWithValue("@Cargo", ObjUsuario.ObjG.IdCargo);

                            CmdUsrG.ExecuteNonQuery();

                            return true;

                        case "Cliente Jurídico":

                            SqlCommand CmdUsrCJ = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteJuridico]
                ([idUsuario]
                  ,[cnpj])
            VALUES
                (@LastId
                ,@Cnpj);", Con);

                            CmdUsrCJ.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrCJ.Parameters.AddWithValue("@Cnpj", ObjUsuario.ObjCJ.Cnpj);

                            CmdUsrCJ.ExecuteNonQuery();

                            return true;

                        case "Cliente Físico":

                            SqlCommand CmdUsrCF = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteFisico]
                ([idUsuario]
                  ,[docIdentificador]
                  ,[orgaoEmissor]
                  ,[cpf])
            VALUES
                (@LastId
                ,@Doc
                ,@Org
                ,@Cpf);", Con);

                            CmdUsrCF.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrCF.Parameters.AddWithValue("@Doc", ObjUsuario.ObjCF.DocIdent);
                            CmdUsrCF.Parameters.AddWithValue("@Org", ObjUsuario.ObjCF.OrgEmiss);
                            CmdUsrCF.Parameters.AddWithValue("@Cpf", ObjUsuario.ObjCF.Cpf);

                            CmdUsrCF.ExecuteNonQuery();

                            return true;

                        case "Administrador":
                            return true;

                        default:
                            return false;
                    }

                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool AlteraUsuarioDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Usuario] SET 
	                    NOME = @Nome
                        ,ENDERECO = @Endereco
                        ,NUMERO = @Numero
                        ,CEP = @Cep
                        ,TELEFONE = @Telefone
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario   
                        WHERE idUsuario = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    Cmd.Parameters.AddWithValue("@Endereco", ObjUsuario.Endereco);
                    Cmd.Parameters.AddWithValue("@Numero", ObjUsuario.Numero);
                    Cmd.Parameters.AddWithValue("@Cep", ObjUsuario.Cep);
                    Cmd.Parameters.AddWithValue("@Telefone", ObjUsuario.Telefone);
                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
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
        public bool InativaUsuarioDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Usuario] SET
                        IdStatusUsuario = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario 
                        WHERE idUsuario = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
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
        public string GetRegraUserDAO(int Id)
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT Usr.UserName
                  FROM [dbo].[UsuarioXMemberShipUser] UsMb
                  INNER JOIN [dbo].[aspnet_Users] Usr ON (UsMb.IdUsrMemberShip = Usr.UserId)
                  WHERE UsMb.idUsuario = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = new Usuario();

                        RegraForUSer = Roles.GetRolesForUser(Dr.GetString(0))[0].ToString();
                    }

                    return RegraForUSer;

                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public string GetUltimoIdUsuarioDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                 SELECT MAX ([idUsuario]) FROM [dbo].[Usuario]", Con);

                    return Convert.ToString(Cmd.ExecuteScalar());
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
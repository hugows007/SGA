using SGA.DAO;
using SGA.Models.AreaAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using SGA.Models.GrupoAtendimentos;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterUsuarioDAO
    {
        string LastId;
        string MembershipId;
        Usuario ObjUsuario = null;
        AreaAtendimento ObjArea = null;
        GrupoAtendimento ObjGpAtend = null;
        string RegraForUser;

        public ManterUsuarioDAO(Usuario ObjUsr, string MbId)
        {
            ObjUsuario = ObjUsr;
            MembershipId = MbId;
        }
        public ManterUsuarioDAO(Usuario ObjUsuario)
        {
            this.ObjUsuario = ObjUsuario;
        }
        public ManterUsuarioDAO(Usuario ObjUsuario, AreaAtendimento ObjArea)
        {
            this.ObjUsuario = ObjUsuario;
            this.ObjArea = ObjArea;
        }
        public ManterUsuarioDAO(Usuario ObjUsuario, GrupoAtendimento ObjGpAtend)
        {
            this.ObjUsuario = ObjUsuario;
            this.ObjGpAtend = ObjGpAtend;
        }
        public ManterUsuarioDAO() { }
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
                ,[dataRegistro]
                ,[usuarioRegistro]
                ,[idStatusUsuario])
            VALUES
                (@Nome
                ,@Endereco
                ,@Numero
                ,@Cep
                ,@Telefone
                ,@Data
                ,@Usuario 
                ,1);", Con);

                    CmdUsr.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    CmdUsr.Parameters.AddWithValue("@Endereco", ObjUsuario.Endereco);
                    CmdUsr.Parameters.AddWithValue("@Numero", ObjUsuario.Numero);
                    CmdUsr.Parameters.AddWithValue("@Cep", ObjUsuario.Cep);
                    CmdUsr.Parameters.AddWithValue("@Telefone", ObjUsuario.Telefone);
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
                        case "Gestor":
                        case "Atendente":

                            SqlCommand CmdUsrT = new SqlCommand(@"
            INSERT INTO [dbo].[Funcionario]
                ([idUsuario]
                  ,[idCargo]
                  ,[idSetor])
            VALUES
                (@LastId
                ,@Cargo
                ,@Setor);", Con);

                            CmdUsrT.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrT.Parameters.AddWithValue("@Cargo", ObjUsuario.ObjFunc.IdCargo);
                            CmdUsrT.Parameters.AddWithValue("@Setor", ObjUsuario.ObjFunc.IdSetor);

                            CmdUsrT.ExecuteNonQuery();


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
        public bool RelacionaUsuarioAreaAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXAreaAtendimento]
                ([idUsuario]
                  ,[idAreaAtendimento]
                  ,[ativo]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@IdUsuario
                 ,@IdArea
                 ,1
                 ,@Data
                 ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@IdArea", ObjArea.Id);
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
        public bool RelacionaUsuarioGrupoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXGrupoAtendimento]
                ([idUsuario]
                  ,[idGrupoAtendimento]
                  ,[ativo]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@IdUsuario
                 ,@IdGrupo
                 ,1
                 ,@Data
                 ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@IdGrupo", ObjGpAtend.Id);
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
                        Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.Usuario);

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
        public List<Usuario> ConsultaUsuariosByPerfilDAO(List<string> Perfil)
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    foreach (var P in Perfil)
                    {
                        SqlCommand Cmd = new SqlCommand(@"
                    SELECT * 
                    FROM Usuario Usr INNER JOIN 
                    UsuarioXMemberShipUser UsrMb ON (Usr.idUsuario = UsrMb.idUsuario) INNER JOIN
                    aspnet_UsersInRoles UsrRoles ON (UsrMb.IdUsrMemberShip = UsrRoles.UserId)
                    WHERE UsrRoles.RoleId in (@IdRole1, @IdRole2)", Con);


                        switch (P)
                        {
                            case "Administrador":
                                Cmd.Parameters.AddWithValue("@IdRole1", "06AE01F4-0570-4C5D-87C6-5E3BDA7A9FC4");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente":
                                Cmd.Parameters.AddWithValue("@IdRole1", "ECBD651F-AA68-481F-BCEA-55D3ED9D0456");
                                Cmd.Parameters.AddWithValue("@IdRole2", "1E193EFC-95B0-4B28-8F53-02E0C7EBCEF6");
                                break;
                            case "Gestor":
                                Cmd.Parameters.AddWithValue("@IdRole1", "8D511875-4B63-4960-9550-1D304B1D4D7B");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Técnico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "9BC49B5E-0865-41B2-ACE3-058849D4A9F5");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Atendente":
                                Cmd.Parameters.AddWithValue("@IdRole1", "2BCF6E2E-E484-4368-AC91-DC55E3511F7C");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente Físico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "ECBD651F-AA68-481F-BCEA-55D3ED9D0456");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente Jurídico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "1E193EFC-95B0-4B28-8F53-02E0C7EBCEF6");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                        }

                        Dr = Cmd.ExecuteReader();

                        while (Dr.Read())
                        {
                            Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.Usuario);

                            Usr.Id = Dr.GetInt32(0);
                            Usr.Nome = Dr.GetString(1);
                            Usr.Endereco = Dr.GetString(2);
                            Usr.Numero = Dr.GetString(3);
                            Usr.Cep = Dr.GetString(4);
                            Usr.Telefone = Dr.GetString(5);
                            Usr.Regra = GetRegraUserDAO(Usr.Id);

                            UsrList.Add(Usr);
                        }

                        Dr.Close();
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
        public Usuario ConsultaUsuariosByIdDAO()
        {
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
                        ObjUsuario.Id = Dr.GetInt32(0);
                        ObjUsuario.Nome = Dr.GetString(1);
                        ObjUsuario.Endereco = Dr.GetString(2);
                        ObjUsuario.Numero = Dr.GetString(3);
                        ObjUsuario.Cep = Dr.GetString(4);
                        ObjUsuario.Telefone = Dr.GetString(5);
                        ObjUsuario.IdStatus = Dr.GetInt32(6);
                        ObjUsuario.Regra = GetRegraUserDAO(ObjUsuario.Id);
                    }

                    return ObjUsuario;
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

                    Cmd.Parameters.AddWithValue("@Id", Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = new Usuario();

                        RegraForUser = Roles.GetRolesForUser(Dr.GetString(0))[0].ToString();
                    }

                    return RegraForUser;

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
        public Usuario GetTecnicoByRegiaoDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
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

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjUsuario.Id = Dr.GetInt32(0);
                        ObjUsuario.Nome = Dr.GetString(1);
                        ObjUsuario.Endereco = Dr.GetString(2);
                        ObjUsuario.Numero = Dr.GetString(3);
                        ObjUsuario.Cep = Dr.GetString(4);
                        ObjUsuario.Telefone = Dr.GetString(5);
                        ObjUsuario.IdStatus = Dr.GetInt32(6);
                        ObjUsuario.Regra = GetRegraUserDAO(ObjUsuario.Id);
                    }

                    return ObjUsuario;
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
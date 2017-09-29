using SGA.DAO;
using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Security;
using SGA.Models.Especialidades;
using SGA.Models.Chamados;
using SGA.Models.Atendimentos;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterUsuarioDAO
    {
        string LastId;
        string MembershipId;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        string RegraForUser;

        public ManterUsuarioDAO() { }
        public ManterUsuarioDAO(Usuario ObjUsuario)
        {
            this.ObjUsuario = ObjUsuario;
        }
        public ManterUsuarioDAO(Usuario ObjUsuario, string MbId)
        {
            this.ObjUsuario = ObjUsuario;
            MembershipId = MbId;
        }
        public ManterUsuarioDAO(Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjUsuario = ObjUsuario;
            this.ObjChamado = ObjChamado;
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
                ,[idEmpresa]
                ,[dataRegistro]
                ,[usuarioRegistro]
                ,[idStatusUsuario])
            VALUES
                (@Nome
                ,@Endereco
                ,@Numero
                ,@Cep
                ,@Telefone
                ,@Empresa
                ,@Data
                ,@Usuario 
                ,1);", Con);

                    CmdUsr.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    CmdUsr.Parameters.AddWithValue("@Endereco", ObjUsuario.Endereco);
                    CmdUsr.Parameters.AddWithValue("@Numero", ObjUsuario.Numero);
                    CmdUsr.Parameters.AddWithValue("@Cep", ObjUsuario.Cep);
                    CmdUsr.Parameters.AddWithValue("@Telefone", ObjUsuario.Telefone);

                    if (InfoGlobal.GlobalIdEmpresa.Equals("SGATI"))
                    {
                        CmdUsr.Parameters.AddWithValue("@Empresa", ObjUsuario.IdEmpresa);
                    }
                    else
                    {
                        CmdUsr.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    }

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
                ,[idDisponibilidade])
            VALUES
                (@LastId
                ,1);", Con);

                            CmdUsrT.Parameters.AddWithValue("@LastId", LastId);
                            CmdUsrT.Parameters.AddWithValue("@Data", DateTime.Now);
                            CmdUsrT.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

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
            INSERT INTO [dbo].[UsuarioXRegiaoAtendimento]
                ([idUsuario]
                  ,[idRegiaoAtendimento]
                  ,[ativo]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@IdUsuario
                 ,@IdRegiao
                 ,1
                 ,@Data
                 ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@IdRegiao", ObjUsuario.ObjRegiao.Id);
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
        public bool RelacionaUsuarioEspecialidadeDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXEspecialidade]
                ([idUsuario]
                  ,[idEspecialidade]
                  ,[ativo]
                  ,[dataRegistro]
                  ,[usuarioRegistro])
            VALUES
                (@IdUsuario
                 ,@IdEspec
                 ,1
                 ,@Data
                 ,@Usuario);", Con);

                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@IdEspec", ObjUsuario.ObjEspec.Id);
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
                SELECT usr.idUsuario, usr.nome, usr.endereco, usr.numero, usr.cep, usr.telefone, emp.nome
                  FROM [dbo].[Usuario] Usr left join [dbo].[Empresa] Emp on (Usr.idEmpresa = Emp.idEmpresa)
                  WHERE idStatusUsuario = 1 and Usr.idEmpresa = @Empresa", Con);

                    CmdUsrs.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = CmdUsrs.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);

                        Usr.Id = Dr.GetInt32(0);
                        Usr.Nome = Dr.GetString(1);
                        Usr.Endereco = Dr.GetString(2);
                        Usr.Numero = Dr.GetString(3);
                        Usr.Cep = Dr.GetString(4);
                        Usr.Telefone = Dr.GetString(5);
                        if (!Dr.IsDBNull(6))
                        {
                            Usr.NomeEmpresa = Dr.GetString(6);
                        }
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
                    aspnet_UsersInRoles UsrRoles ON (UsrMb.IdUsrMemberShip = UsrRoles.UserId) INNER JOIN
                    aspnet_Users UsrUsers ON (UsrMb.IdUsrMemberShip = UsrUsers.UserId)
                    WHERE UsrRoles.RoleId in (@IdRole1, @IdRole2) and Usr.idEmpresa = @Empresa", Con);

                        Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                        switch (P)
                        {
                            case "Administrador":
                                Cmd.Parameters.AddWithValue("@IdRole1", "6829B283-EC4D-4ACB-AC7C-B1FA61C71F58");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente":
                                Cmd.Parameters.AddWithValue("@IdRole1", "77DAA669-C0F6-4D2F-8B3A-AD4ACCBF8D1E");
                                Cmd.Parameters.AddWithValue("@IdRole2", "7EDC0ACD-F32C-4946-9BD0-889742053030");
                                break;
                            case "Gestor":
                                Cmd.Parameters.AddWithValue("@IdRole1", "6A0BD300-3942-49E5-8307-F0DBC1591186");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Técnico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "5E106C37-3E4D-4B41-9EEE-F190EA99E534");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Atendente":
                                Cmd.Parameters.AddWithValue("@IdRole1", "4355C114-EAF9-4B05-B6D2-3CB47FFAE948");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente Físico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "77DAA669-C0F6-4D2F-8B3A-AD4ACCBF8D1E");
                                Cmd.Parameters.AddWithValue("@IdRole2", "00000000-0000-0000-0000-000000000000");
                                break;
                            case "Cliente Jurídico":
                                Cmd.Parameters.AddWithValue("@IdRole1", "7EDC0ACD-F32C-4946-9BD0-889742053030");
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
                            Usr.IdMS = Dr.GetGuid(15).ToString();
                            Usr.Login = Dr.GetString(16);

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
        public Usuario ConsultaUsuarioByIdDAO()
        {
            SqlCommand Cmd = null;
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
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
                        ,CASE WHEN usrReg.idRegiaoAtendimento IS NULL THEN 0 ELSE usrReg.idRegiaoAtendimento END AS idRegiaoAtendimento
						,CASE WHEN usrEspec.idEspecialidade IS NULL THEN 0 ELSE usrEspec.idEspecialidade END AS idEspecialidade
						FROM Usuario usr inner join 
                        UsuarioXMemberShipUser membxusr on (usr.idUsuario = membxusr.idUsuario) inner join
                        aspnet_Users membusr on (membxusr.IdUsrMemberShip = membusr.UserId) left join
						UsuarioxRegiaoAtendimento usrReg on (usr.idUsuario = usrreg.idUsuario) left join
						UsuarioXEspecialidade usrEspec on (usr.idUsuario = usrEspec.idUsuario) WHERE
                        usr.idUsuario = @Id and usr.idStatusUsuario = 1 and usr.idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

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
                        ObjUsuario.ObjRegiao.Id = Dr.GetInt32(7);
                        ObjUsuario.ObjEspec.Id = Dr.GetInt32(8);

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
        public Usuario ConsultaIdUsuarioByIdMBDAO()
        {
            SqlCommand Cmd = null;
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    Cmd = new SqlCommand(@"
                        SELECT [idUsuario]
                              ,[IdUsrMemberShip]
                          FROM [dbo].[UsuarioXMemberShipUser] WHERE 
                          IdUsrMemberShip = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.IdMS);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjUsuario.Id = Dr.GetInt32(0);
                        ObjUsuario.IdMS = Dr.GetGuid(1).ToString();
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
        public Usuario ConsultaUsuarioByNomeDAO()
        {
            SqlCommand Cmd = null;
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
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
                        ,CASE WHEN usrReg.idRegiaoAtendimento IS NULL THEN 0 ELSE usrReg.idRegiaoAtendimento END AS idRegiaoAtendimento
						,CASE WHEN usrEspec.idEspecialidade IS NULL THEN 0 ELSE usrEspec.idEspecialidade END AS idEspecialidade
						FROM Usuario usr inner join 
                        UsuarioXMemberShipUser membxusr on (usr.idUsuario = membxusr.idUsuario) inner join
                        aspnet_Users membusr on (membxusr.IdUsrMemberShip = membusr.UserId) left join
						UsuarioxRegiaoAtendimento usrReg on (usr.idUsuario = usrreg.idUsuario) left join
						UsuarioXEspecialidade usrEspec on (usr.idUsuario = usrEspec.idUsuario) WHERE
                        membusr.UserName = @Nome and usr.idStatusUsuario = 1 and usr.idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

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
                        ObjUsuario.ObjRegiao.Id = Dr.GetInt32(7);
                        ObjUsuario.ObjEspec.Id = Dr.GetInt32(8);

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
                        WHERE idUsuario = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Nome", ObjUsuario.Nome);
                    Cmd.Parameters.AddWithValue("@Endereco", ObjUsuario.Endereco);
                    Cmd.Parameters.AddWithValue("@Numero", ObjUsuario.Numero);
                    Cmd.Parameters.AddWithValue("@Cep", ObjUsuario.Cep);
                    Cmd.Parameters.AddWithValue("@Telefone", ObjUsuario.Telefone);
                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool AlteraDisponibilidadeDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Funcionario] SET 
	                    idDisponibilidade = @Status
                        WHERE idUsuario = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@Status", ObjUsuario.IdStatus);

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
                        WHERE idUsuario = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjUsuario.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public List<int> GetIdRegiaoAtendByUsrDAO()
        {
            SqlDataReader Dr = null;
            List<int> ListRegAtend = new List<int>();

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                    SELECT *
                        FROM UsuarioXRegiaoAtendimento
                        WHERE idUsuario = @IdUsuario;", Con);

                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjUsuario.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ListRegAtend.Add(Dr.GetInt32(1));
                    }

                    return ListRegAtend;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public List<Usuario> GetTecnicoByRegiaoEspecDAO()
        {
            List<Usuario> List = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                    SELECT distinct UsrReg.idUsuario
                          ,UsrReg.idRegiaoAtendimento
						  ,ServEspec.idServico
                      FROM UsuarioXRegiaoAtendimento UsrReg inner join 
                      Funcionario UsrFunc on (UsrFunc.idUsuario = UsrReg.idUsuario) inner join 
                      Usuario Usr on (UsrFunc.idUsuario = Usr.idUsuario) inner join 
                      UsuarioXEspecialidade UsrEspec on (Usr.idUsuario = UsrEspec.idUsuario) inner join
					  ServicoXEspecialidade ServEspec on (UsrEspec.idEspecialidade = ServEspec.idEspecialidade)
                      WHERE Usr.idStatusUsuario = 1 and 
                      UsrFunc.idDisponibilidade = 1 and 
                      UsrReg.idRegiaoAtendimento = @IdRegiao and 
                      ServEspec.idServico = @IdServ and Usr.idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@IdRegiao", ObjUsuario.ObjRegiao.Id);
                    Cmd.Parameters.AddWithValue("@IdServ", ObjChamado.IdServico);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.Usuario);

                        Usr.Id = Dr.GetInt32(0);
                        Usr.ObjRegiao.Id = Dr.GetInt32(1);

                        List.Add(Usr);
                    }

                    return List;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public Usuario GetUsuarioEmpresaDAO()
        {
            List<Usuario> List = new List<Usuario>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"select Usr.idUsuario
                                                    ,Usr.nome
                                                    ,Emp.nome
                                                    ,Emp.idEmpresa 
                                                    ,UsrM.IdUsrMemberShip from Usuario Usr inner join
                                                    Empresa Emp on (Usr.idEmpresa = Emp.idEmpresa) inner join
                                                    UsuarioXMemberShipUser UsrM on (Usr.idUsuario = UsrM.idUsuario) inner join
                                                    aspnet_Users AspUsr on (AspUsr.UserId = UsrM.IdUsrMemberShip)
                                                    where AspUsr.UserName = @Usuario", Con);

                    Cmd.Parameters.AddWithValue("@Usuario", ObjUsuario.Login);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjUsuario.Id = Dr.GetInt32(0);
                        ObjUsuario.Nome = Dr.GetString(1);
                        ObjUsuario.NomeEmpresa = Dr.GetString(2);
                        ObjUsuario.IdEmpresa = Dr.GetInt32(3);
                        ObjUsuario.IdMS = Dr.GetGuid(4).ToString();
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
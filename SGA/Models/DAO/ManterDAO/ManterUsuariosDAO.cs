using SGA.DAO;
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
        public bool CadastraUsuarioDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsr = new SqlCommand(@"
            INSERT INTO [dbo].[Usuario]
                ([nome]
                ,[endereco]
                ,[numero]
                ,[cep]
                ,[telefone]
                ,[idStatusUsuario]
                ,[idAreaAtendimento])
            VALUES
                ('" + ObjUsuario.Nome +
                    "','" + ObjUsuario.Endereco +
                    "','" + ObjUsuario.Numero +
                    "','" + ObjUsuario.Cep +
                    "','" + ObjUsuario.Telefone +
                    "','" + 1 +
                    "','" + ObjUsuario.AreaAtendimento +
                    "');", Con);

                CmdUsr.ExecuteNonQuery();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrMS = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXMemberShipUser]
                ([idUsuario]
                ,[IdUsrMemberShip])
            VALUES
                ('" + LastId +
                    "','" + MembershipId +
                    "');", Con);

                CmdUsrMS.ExecuteNonQuery();

                switch (ObjUsuario.Regra)
                {
                    case "Técnico":

                        LastId = GetUltimoId("Usuario", "idUsuario");

                        SqlCommand CmdUsrT = new SqlCommand(@"
            INSERT INTO [dbo].[Tecnico]
                ([idUsuario]
                  ,[idEspecialidade]
                  ,[idCargo]
                  ,[idSetor])
            VALUES
                ('" + LastId +
                            "','" + ObjUsuario.ObjT.Especialidade +
                            "','" + ObjUsuario.ObjT.Cargo +
                            "','" + ObjUsuario.ObjT.Setor +
                            "');", Con);

                        CmdUsrT.ExecuteNonQuery();

                        Con.Close();
                        return true;

                    case "Gestor":
                        LastId = GetUltimoId("Usuario", "idUsuario");

                        SqlCommand CmdUsrG = new SqlCommand(@"
            INSERT INTO [dbo].[Gestor]
                ([idUsuario]
                  ,[idSetor]
                  ,[idCargo])
            VALUES
                ('" + LastId +
                            "','" + ObjUsuario.ObjG.Setor +
                            "','" + ObjUsuario.ObjG.Cargo +
                            "');", Con);

                        CmdUsrG.ExecuteNonQuery();

                        Con.Close();
                        return true;

                    case "Cliente Jurídico":
                        LastId = GetUltimoId("Usuario", "idUsuario");

                        SqlCommand CmdUsrCJ = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteJuridico]
                ([idUsuario]
                  ,[cnpj])
            VALUES
                ('" + LastId +
                            "','" + ObjUsuario.ObjCJ.Cnpj +
                            "');", Con);

                        CmdUsrCJ.ExecuteNonQuery();

                        Con.Close();
                        return true;

                    case "Cliente Físico":
                        LastId = GetUltimoId("Usuario", "idUsuario");

                        SqlCommand CmdUsrCF = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteFisico]
                ([idUsuario]
                  ,[docIdentificador]
                  ,[orgaoEmissor]
                  ,[cpf])
            VALUES
                ('" + LastId +
                            "','" + ObjUsuario.ObjCF.DocIdent +
                            "','" + ObjUsuario.ObjCF.OrgEmiss +
                            "','" + ObjUsuario.ObjCF.Cpf +
                            "');", Con);

                        CmdUsrCF.ExecuteNonQuery();

                        Con.Close();
                        return true;

                    case "Administrador":
                        return true;

                    default:
                        return false;
                }
            }
            catch (SqlException)
            {
                return false;
            }
        }
        public List<Usuario> ConsultaUsuariosDAO()
        {
            List<Usuario> UsrList = new List<Usuario>();

            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsrs = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[Usuario]
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
                    Usr.Regra = GetRegraUser(Usr.Id);

                    UsrList.Add(Usr);
                }
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                if (Dr != null)
                    Dr.Close();
            }
            return UsrList;
        }
        public List<Usuario> ConsultaUsuariosDAOById()
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlDataReader DrUsr = null;
            SqlCommand CmdUsrs = null;

            try
            {
                SqlConnection ConUsr = new Conexao().ConexaoDB();

                if (!0.Equals(ObjUsuario.Id))
                {
                    CmdUsrs = new SqlCommand(@"
                    SELECT *
                      FROM [SAS].[dbo].[Usuario]
                      WHERE idStatusUsuario = 1 and idUsuario =" + ObjUsuario.Id, ConUsr);

                }
                else if (!ObjUsuario.Nome.Equals("null"))
                {
                    CmdUsrs = new SqlCommand(@"
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
                        membusr.UserName = '" + ObjUsuario.Nome + "'", ConUsr);
                }

                DrUsr = CmdUsrs.ExecuteReader();

                while (DrUsr.Read())
                {
                    Usuario Usr = new Usuario();

                    Usr.Id = DrUsr.GetInt32(0);
                    Usr.Nome = DrUsr.GetString(1);
                    Usr.Endereco = DrUsr.GetString(2);
                    Usr.Numero = DrUsr.GetString(3);
                    Usr.Cep = DrUsr.GetString(4);
                    Usr.Telefone = DrUsr.GetString(5);
                    Usr.Status = DrUsr.GetInt32(6);
                    Usr.AreaAtendimento = DrUsr.GetInt32(7);
                    Usr.Regra = GetRegraUser(Usr.Id);
                    UsrList.Add(Usr);
                }
            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                if (DrUsr != null)
                    DrUsr.Close();
            }
            return UsrList;
        }
        public bool AlteraUsuarioDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsr = new SqlCommand(@"
                UPDATE 
	                [SAS].[dbo].[Usuario] SET 
	                    NOME='" + ObjUsuario.Nome + "'," +
                        "ENDERECO ='" + ObjUsuario.Endereco + "'," +
                        "NUMERO='" + ObjUsuario.Numero + "'," +
                        "CEP='" + ObjUsuario.Cep + "'," +
                        "TELEFONE='" + ObjUsuario.Telefone + "' " +
                        "WHERE idUsuario='" + ObjUsuario.Id + "'" +
                        ";", Con);

                CmdUsr.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
            return true;
        }
        public bool InativaUsuarioDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsr = new SqlCommand(@"
                UPDATE 
	                [SAS].[dbo].[Usuario] SET
                        IDSTATUSUSUARIO=0 " +
                        "WHERE idUsuario='" + ObjUsuario.Id + "'" +
                        ";", Con);

                CmdUsr.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
            return true;
        }
        public string GetRegraUser(int Id)
        {
            List<Usuario> UsrList = new List<Usuario>();
            SqlDataReader DrRol = null;

            try
            {
                SqlConnection ConRol = new Conexao().ConexaoDB();

                SqlCommand CmdRol = new SqlCommand(@"
                SELECT Usr.UserName
                  FROM [SAS].[dbo].[UsuarioXMemberShipUser] UsMb
                  INNER JOIN [SAS].[dbo].[aspnet_Users] Usr ON (UsMb.IdUsrMemberShip = Usr.UserId)
                  WHERE UsMb.idUsuario =" + Id, ConRol);

                DrRol = CmdRol.ExecuteReader();

                while (DrRol.Read())
                {
                    Usuario Usr = new Usuario();

                    RegraForUSer = Roles.GetRolesForUser(DrRol.GetString(0))[0].ToString();
                }

            }
            catch (SqlException)
            {
                return null;
            }
            finally
            {
                if (DrRol != null)
                    DrRol.Close();
            }
            return RegraForUSer;
        }
        public string GetUltimoId(string Tabela, string Campo)
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetLastId = new SqlCommand(@"
                 SELECT MAX ([" + Campo + "]) FROM[SAS].[dbo].[" + Tabela + "]", Con);

                return Convert.ToString(CmdGetLastId.ExecuteScalar());
            }
            catch (SqlException)
            {
                return null;
            }
        }
    }
}
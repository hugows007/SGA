using SGA.DAO;
using SGA.Models.Usuario;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.UsuarioDAO
{
    public class CadastroUsuariosDAO
    {
        string LastId;
        string MembershipId;
        IUsuario ObjUsuario;
        string RegraForUSer;

        public CadastroUsuariosDAO(IUsuario ObjUsr, string MbId)
        {
            ObjUsuario = ObjUsr;
            MembershipId = MbId;
        }
        public CadastroUsuariosDAO(IUsuario ObjUsr)
        {
            ObjUsuario = ObjUsr;

        }
        public CadastroUsuariosDAO() { }
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
                    "','" + ObjUsuario.IdAreaAtendimento +
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
                            "','" + ObjUsuario.Especialidade +
                            "','" + ObjUsuario.Cargo +
                            "','" + ObjUsuario.Setor +
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
                            "','" + ObjUsuario.Setor +
                            "','" + ObjUsuario.Cargo +
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
                            "','" + ObjUsuario.Cnpj +
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
                            "','" + ObjUsuario.DocIdent +
                            "','" + ObjUsuario.OrgEmiss +
                            "','" + ObjUsuario.Cpf +
                            "');", Con);

                        CmdUsrCF.ExecuteNonQuery();

                        Con.Close();
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
        public List<IUsuario> ConsultaUsuariosDAO()
        {
            List<IUsuario> UsrList = new List<IUsuario>();

            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdUsrs = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[Usuario]", Con);

                Dr = CmdUsrs.ExecuteReader();

                while (Dr.Read())
                {
                    SGA.Models.Usuario.Usuario Usr = new SGA.Models.Usuario.Usuario();

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
        public List<IUsuario> ConsultaUsuariosDAOById()
        {
            List<IUsuario> UsrList = new List<IUsuario>();
            SqlDataReader DrUsr = null;

            try
            {
                SqlConnection ConUsr = new Conexao().ConexaoDB();

                SqlCommand CmdUsrs = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[Usuario]
                  WHERE idUsuario =" + ObjUsuario.Id, ConUsr);

                DrUsr = CmdUsrs.ExecuteReader();

                while (DrUsr.Read())
                {
                    SGA.Models.Usuario.Usuario Usr = new SGA.Models.Usuario.Usuario();

                    Usr.Id = DrUsr.GetInt32(0);
                    Usr.Nome = DrUsr.GetString(1);
                    Usr.Endereco = DrUsr.GetString(2);
                    Usr.Numero = DrUsr.GetString(3);
                    Usr.Cep = DrUsr.GetString(4);
                    Usr.Telefone = DrUsr.GetString(5);
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
        public string GetRegraUser(int Id)
        {
            List<IUsuario> UsrList = new List<IUsuario>();
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
                    SGA.Models.Usuario.Usuario Usr = new SGA.Models.Usuario.Usuario();

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
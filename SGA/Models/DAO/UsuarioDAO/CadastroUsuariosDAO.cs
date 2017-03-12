using SGA.DAO;
using SGA.Models.Usuario;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.UsuarioDAO
{
    public class CadastroUsuariosDAO
    {

        string LastId;
        string MembershipId;
        IUsuario ObjUsuario;

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

                    Usr.Nome = Dr.GetString(1);
                    Usr.Endereco = Dr.GetString(2);
                    Usr.Numero = Dr.GetString(3);
                    Usr.Cep = Dr.GetString(4);
                    Usr.Telefone = Dr.GetString(5);

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
using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.Usuario
{
    public class CadastroDAO
    {
        string _Usuario { get; set; }
        string _Nome { get; set; }
        string _Endereco { get; set; }
        string _Numero { get; set; }
        string _Cep { get; set; }
        string _Telefone { get; set; }
        string _DocIdent { get; set; }
        string _OrgEmiss { get; set; }
        string _Cpf { get; set; }
        string _Cnpj { get; set; }
        int _Setor { get; set; }
        int _Cargo { get; set; }
        int _Especialidade { get; set; }

        string LastId;
        public CadastroDAO(
            string Usuario,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone)
        {
            _Usuario = Usuario;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
        }

        public CadastroDAO(
            string Usuario,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            string DocIdent,
            string OrgEmiss,
            string Cpf)
        {
            _Usuario = Usuario;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _DocIdent = DocIdent;
            _OrgEmiss = OrgEmiss;
            _Cpf = Cpf;
        }

        public CadastroDAO(
            string Usuario,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            string Cnpj)
        {
            _Usuario = Usuario;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Cnpj = Cnpj;
        }

        public CadastroDAO(
            string Usuario,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            int Setor,
            int Cargo)
        {
            _Usuario = Usuario;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Setor = Setor;
            _Cargo = Cargo;
        }

        public CadastroDAO(
            string Usuario,
            string Nome,
            string Endereco,
            string Numero,
            string Cep,
            string Telefone,
            int Especialidade,
            int Setor,
            int Cargo)
        {
            _Usuario = Usuario;
            _Nome = Nome;
            _Endereco = Endereco;
            _Numero = Numero;
            _Cep = Cep;
            _Telefone = Telefone;
            _Especialidade = Especialidade;
            _Setor = Setor;
            _Cargo = Cargo;
        }


        public CadastroDAO() { }

        public bool InsereUsuarioAdmin()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();
                InsereUsuario();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
        }

        public bool InsereUsuarioClienteFisico()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();
                InsereUsuario();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrCF = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteFisico]
                ([idUsuario]
                  ,[docIdentificador]
                  ,[orgaoEmissor]
                  ,[cpf])
            VALUES
                ('" + LastId +
                    "','" + _DocIdent +
                    "','" + _OrgEmiss +
                    "','" + _Cpf +
                    "');", Con);

                CmdUsrCF.ExecuteNonQuery();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
        }

        public bool InsereUsuarioClienteJuridico()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();
                InsereUsuario();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrCJ = new SqlCommand(@"
            INSERT INTO [dbo].[ClienteJuridico]
                ([idUsuario]
                  ,[cnpj])
            VALUES
                ('" + LastId +
                    "','" + _Cnpj +
                    "');", Con);

                CmdUsrCJ.ExecuteNonQuery();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
        }

        public bool InsereUsuarioGestor()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();
                InsereUsuario();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrG = new SqlCommand(@"
            INSERT INTO [dbo].[Gestor]
                ([idUsuario]
                  ,[idSetor]
                  ,[idCargo])
            VALUES
                ('" + LastId +
                    "','" + _Setor +
                    "','" + _Cargo +
                    "');", Con);

                CmdUsrG.ExecuteNonQuery();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
        }

        public bool InsereUsuarioTecnico()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();
                InsereUsuario();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrG = new SqlCommand(@"
            INSERT INTO [dbo].[Tecnico]
                ([idUsuario]
                  ,[idEspecialidade]
                  ,[idCargo]
                  ,[idSetor])
            VALUES
                ('" + LastId +
                    "','" + _Especialidade +
                    "','" + _Cargo +
                    "','" + _Setor +
                    "');", Con);

                CmdUsrG.ExecuteNonQuery();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
        }

        public bool InsereUsuario()
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
                ,[telefone])
            VALUES
                ('" + _Nome +
                    "','" + _Endereco +
                    "','" + _Numero +
                    "','" + _Cep +
                    "','" + _Telefone +
                    "');", Con);

                CmdUsr.ExecuteNonQuery();

                LastId = GetUltimoId("Usuario", "idUsuario");

                SqlCommand CmdUsrMS = new SqlCommand(@"
            INSERT INTO [dbo].[UsuarioXMemberShipUser]
                ([idUsuario]
                ,[IdUsrMemberShip])
            VALUES
                ('" + LastId +
                    "','" + _Usuario +
                    "');", Con);

                CmdUsrMS.ExecuteNonQuery();

                Con.Close();
                return true;

            }
            catch (SqlException)
            {
                return false;
            }
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
                return "";
            }
        }

        public SqlDataReader GetSetor()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetSetor = new SqlCommand(@"
                 SELECT [idSetor]
                      ,[setor]
                 FROM [SAS].[dbo].[Setor]
                 WHERE ativo = 1
                 ORDER BY setor", Con);

                SqlDataReader Result = CmdGetSetor.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }

        public SqlDataReader GetCargo()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetCargo = new SqlCommand(@"
                 SELECT [idCargo]
                      ,[cargo]
                 FROM [SAS].[dbo].[Cargo]
                 WHERE ativo = 1
                 ORDER BY cargo", Con);

                SqlDataReader Result = CmdGetCargo.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }

        public SqlDataReader GetEspecialidade()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand CmdGetEspec = new SqlCommand(@"
                 SELECT [idEspecialidade]
                      ,[especialidade]
                 FROM [SAS].[dbo].[Especialidade]
                 WHERE ativo = 1
                 ORDER BY especialidade", Con);

                SqlDataReader Result = CmdGetEspec.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
    }
}
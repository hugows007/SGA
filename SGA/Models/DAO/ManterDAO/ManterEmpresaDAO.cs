using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Empresas;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterEmpresaDAO
    {
        private Empresa ObjEmpresa;
        public ManterEmpresaDAO(Empresa objEmpresa)
        {
            ObjEmpresa = objEmpresa;
        }
        public ManterEmpresaDAO()
        {
        }
        public List<Empresa> ConsultaEmpresasDAO()
        {
            List<Empresa> EmpresaList = new List<Empresa>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Empresa]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Empresa Empresas = FactoryEmpresa.GetNew();

                        Empresas.Id = Dr.GetInt32(0);
                        Empresas.NomeEmpresa = Dr.GetString(1);
                        Empresas.Endereco = Dr.GetString(2);
                        Empresas.Complemento = Dr.GetString(3);
                        Empresas.Cep = Dr.GetString(4);
                        Empresas.Telefone = Dr.GetString(5);

                        EmpresaList.Add(Empresas);
                    }

                    return EmpresaList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public Empresa ConsultaEmpresaByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Empresa] WHERE
                   ativo = 1 and 
                   idEmpresa = @Id", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjEmpresa.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjEmpresa.Id = Dr.GetInt32(0);
                        ObjEmpresa.NomeEmpresa = Dr.GetString(1);
                        ObjEmpresa.Endereco = Dr.GetString(2);
                        ObjEmpresa.Complemento = Dr.GetString(3);
                        ObjEmpresa.Cep = Dr.GetString(4);
                        ObjEmpresa.Telefone = Dr.GetString(5);
                    }

                    return ObjEmpresa;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool CadastraEmpresaDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Empresa]
                  ([nome]
                  ,[endereco]
                  ,[complemento]
                  ,[cep]
                  ,[telefone]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Empresa
                ,@Endereco
                ,@Complemento
                ,@Cep
                ,@Telefone
                ,@Data
                ,@Usuario  
                ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", ObjEmpresa.NomeEmpresa);
                    Cmd.Parameters.AddWithValue("@Endereco", ObjEmpresa.Endereco);
                    Cmd.Parameters.AddWithValue("@Complemento", ObjEmpresa.Complemento);
                    Cmd.Parameters.AddWithValue("@Cep", ObjEmpresa.Cep);
                    Cmd.Parameters.AddWithValue("@Telefone", ObjEmpresa.Telefone);
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
        public bool AlteraEmpresaDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Empresa] SET 
	                    nome = @Empresa
	                    ,endereco = @Endereco
	                    ,complemento = @Complemento
	                    ,cep = @Cep
	                    ,telefone = @Telefone
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario  
                        WHERE idEmpresa= @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", ObjEmpresa.NomeEmpresa);
                    Cmd.Parameters.AddWithValue("@Endereco", ObjEmpresa.Endereco);
                    Cmd.Parameters.AddWithValue("@Complemento", ObjEmpresa.Complemento);
                    Cmd.Parameters.AddWithValue("@Cep", ObjEmpresa.Cep);
                    Cmd.Parameters.AddWithValue("@Telefone", ObjEmpresa.Telefone);
                    Cmd.Parameters.AddWithValue("@Id", ObjEmpresa.Id);
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
        public bool InativaEmpresaDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Empresa] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idEmpresa = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjEmpresa.Id);
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
    }
}
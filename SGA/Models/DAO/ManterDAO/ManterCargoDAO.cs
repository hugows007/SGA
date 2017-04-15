using SGA.DAO;
using SGA.Models.Cargos;
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterCargoDAO
    {
        public Cargo ObjCargo = null;
        SqlConnection Con = null;
        public ManterCargoDAO()
        {

        }
        public ManterCargoDAO(Cargo ObjCargo)
        {
            this.ObjCargo = ObjCargo;
        }
        public SqlDataReader ConsultaCargosDataReaderDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idCargo]
                      ,[cargo]
                 FROM [dbo].[Cargo]
                 WHERE ativo = 1
                 ORDER BY cargo;", Con);

                Dr = Cmd.ExecuteReader();
                return Dr;
            }
            catch (SqlException Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public List<Cargo> ConsultaCargoByIdDAO()
        {
            List<Cargo> CargoList = new List<Cargo>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Cargo] WHERE
                    ativo = 1 and 
                    idCargo = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjCargo.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Cargo Cargos = FactoryCargo.GetNew();

                        Cargos.Id = Dr.GetInt32(0);
                        Cargos.CargoDesc = Dr.GetString(1);
                        Cargos.Salario = Dr.GetDecimal(2);
                        CargoList.Add(Cargos);
                    }

                    return CargoList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public List<Cargo> ConsultaCargosDAO()
        {
            List<Cargo> CargoList = new List<Cargo>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Cargo]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Cargo Cargos = FactoryCargo.GetNew();

                        Cargos.Id = Dr.GetInt32(0);
                        Cargos.CargoDesc = Dr.GetString(1);
                        Cargos.Salario = Dr.GetDecimal(2);

                        CargoList.Add(Cargos);
                    }

                    return CargoList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool CadastraCargoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Cargo]
                ([cargo]
                  ,[salario]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Cargo
                ,@Salario
                ,@Data
                ,@Usuario
                ,1;", Con);

                    Cmd.Parameters.AddWithValue("@Cargo", ObjCargo.CargoDesc);
                    Cmd.Parameters.AddWithValue("@Salario", ObjCargo.Salario);
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
        public bool AlteraCargoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Cargo] SET
                        Cargo = @Cargo
                       ,Salario = @Salario
                       ,dataRegistro = @Data
                       ,usuarioRegistro = @Usuario   
                        WHERE idCargo = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Cargo", ObjCargo.CargoDesc);
                    Cmd.Parameters.AddWithValue("@Salario", ObjCargo.Salario);
                    Cmd.Parameters.AddWithValue("@Id", ObjCargo.Id);
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
        public bool InativarCargoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Cargo] SET
                        ativo = 0 
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario   
                        WHERE idCargo = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjCargo.Id);
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
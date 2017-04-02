using SGA.DAO;
using SGA.Models.Cargos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterCargoDAO
    {
        public Cargo ObjCargo = null;
        public ManterCargoDAO()
        {

        }
        public ManterCargoDAO(Cargo ObjCargo)
        {
            this.ObjCargo = ObjCargo;
        }
        public SqlDataReader ConsultaCargosDataReaderDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idCargo]
                      ,[cargo]
                 FROM [SAS].[dbo].[Cargo]
                 WHERE ativo = 1
                 ORDER BY cargo", Con);

                SqlDataReader Result = Cmd.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
        public List<Cargo> ConsultaCargosDAO()
        {
            List<Cargo> CargoList = new List<Cargo>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[Cargo]
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
            return CargoList;
        }
        public bool CadastraCargoDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Cargo]
                ([cargo]
                  ,[salario]
                  ,[ativo])
            VALUES
                ('" + ObjCargo.CargoDesc +
                    "','" + ObjCargo.Salario +
                    "','" + 1 +
                    "');", Con);

                Cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
        }
        public List<Cargo> ConsultaCargoByIdDAO()
        {
            List<Cargo> CargoList = new List<Cargo>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [SAS].[dbo].[Cargo]
                  WHERE ativo = 1 and idCargo =" + ObjCargo.Id, Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Cargo Cargos = FactoryCargo.GetNew();

                    Cargos.Id = Dr.GetInt32(0);
                    Cargos.CargoDesc = Dr.GetString(1);
                    Cargos.Salario = Dr.GetDecimal(2);
                    CargoList.Add(Cargos);
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
            return CargoList;
        }
        public bool AlteraCargoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Cargo] SET 
	                    Cargo='" + ObjCargo.CargoDesc + "'," +
                        "Salario='" + ObjCargo.Salario + "' " +
                        "WHERE idCargo='" + ObjCargo.Id + "'" +
                        ";", Con);

                Cmd.ExecuteNonQuery();
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
        public bool InativarCargoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Cargo] SET
                        ativo=0 " +
                        "WHERE idCargo='" + ObjCargo.Id + "'" +
                        ";", Con);

                Cmd.ExecuteNonQuery();
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
    }
}
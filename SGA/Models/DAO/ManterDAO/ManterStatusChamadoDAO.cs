using SGA.DAO;
using SGA.Models.StatusChamados;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterStatusChamadoDAO
    {
        StatusChamado ObjStatusChm = null;

        public ManterStatusChamadoDAO(StatusChamado ObjStatusChm)
        {
            this.ObjStatusChm = ObjStatusChm;
        }
        public ManterStatusChamadoDAO()
        {

        }
        public StatusChamado ConsultaStatusChamadoByIdDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[StatusChamado]
                  WHERE ativo = 1 and idStatusChamado =" + ObjStatusChm.Id, Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    ObjStatusChm.Id = Dr.GetInt32(0);
                    ObjStatusChm.NomeStatus = Dr.GetString(1);
                    ObjStatusChm.DescStatus = Dr.GetString(2);
                    ObjStatusChm.Status = Dr.GetInt32(3);
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
            return ObjStatusChm;
        }
    }
}
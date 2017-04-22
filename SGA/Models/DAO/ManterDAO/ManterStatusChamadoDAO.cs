﻿using SGA.DAO;
using SGA.Models.DAO.Log;
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

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[StatusChamado]
                  WHERE ativo = 1 and idStatusChamado = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjStatusChm.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjStatusChm.Id = Dr.GetInt32(0);
                        ObjStatusChm.NomeStatus = Dr.GetString(1);
                        ObjStatusChm.DescStatus = Dr.GetString(2);
                        ObjStatusChm.IdStatus = Dr.GetInt32(3);
                    }

                    return ObjStatusChm;
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
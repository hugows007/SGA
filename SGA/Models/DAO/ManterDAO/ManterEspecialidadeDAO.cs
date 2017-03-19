﻿using SGA.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterEspecialidadeDAO
    {
        public SqlDataReader ConsultaEspecialidadesDAO()
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
using SGA.Models.DAO.ManterDAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEspecialidade
    {
        public SqlDataReader ConsultaEspecialidades()
        {
            return new ManterEspecialidadeDAO().ConsultaEspecialidadesDAO();
        }
    }
}
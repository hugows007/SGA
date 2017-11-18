using SGA.DAO;
using SGA.Models.Chamados.PrioridadeChamados;
using SGA.Models.DAO.Log;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterPrioridadeChamadoDAO
    {
        PrioridadeChamado ObjPrioridade;
        public ManterPrioridadeChamadoDAO(PrioridadeChamado ObjPrioridade)
        {
            this.ObjPrioridade = ObjPrioridade;
        }
        public ManterPrioridadeChamadoDAO()
        {

        }
        public PrioridadeChamado ConsultaPrioridadeChamadoByIdDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[PrioridadeChamado]
                  WHERE idPrioridade = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjPrioridade.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjPrioridade.Id = Dr.GetInt32(0);
                        ObjPrioridade.DescPrioridade = Dr.GetString(1);
                    }

                    return ObjPrioridade;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<PrioridadeChamado> ConsultaPrioridadesChamadoDAO()
        {
            try
            {
                List<PrioridadeChamado> Prioridades = new List<PrioridadeChamado>();
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
                 SELECT *
                 FROM [dbo].[PrioridadeChamado]
                 ORDER BY 1;", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        PrioridadeChamado Prior = FactoryPrioridadeChm.GetNew();

                        Prior.Id = Dr.GetInt32(0);
                        Prior.DescPrioridade = Dr.GetString(1);

                        Prioridades.Add(Prior);
                    }

                    return Prioridades;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
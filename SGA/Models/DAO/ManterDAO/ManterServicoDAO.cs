using SGA.DAO;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterServicoDAO
    {
        public Servico ObjServico = null;
        public ManterServicoDAO()
        {

        }
        public ManterServicoDAO(Servico ObjServico)
        {
            this.ObjServico = ObjServico;
        }
        public SqlDataReader ConsultaServicosDataReaderDAO()
        {
            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idServico]
                      ,[nome]
                 FROM [dbo].[Servico]
                 WHERE ativo = 1
                 ORDER BY Servico", Con);

                SqlDataReader Result = Cmd.ExecuteReader();
                return Result;
            }
            catch (SqlException)
            {
                return null;
            }
        }
        public List<Servico> ConsultaServicosDAO()
        {
            List<Servico> ServicoList = new List<Servico>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Servico]
                  WHERE ativo = 1", Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Servico Servicos = FactoryServico.GetNew();

                    Servicos.Id = Dr.GetInt32(0);
                    Servicos.Tipo = Dr.GetString(1);
                    Servicos.Nome = Dr.GetString(2);
                    Servicos.Descricao = Dr.GetString(3);
                    Servicos.Sla = Dr.GetDouble(4);
                    Servicos.Status = Dr.GetInt32(5);

                    ServicoList.Add(Servicos);
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
            return ServicoList;
        }
        public bool CadastraServicoDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Servico]
                ([tipo]
                  ,[nome]
                  ,[descricao]
                  ,[sla]
                  ,[ativo])
            VALUES
                ('" + ObjServico.Tipo +
                    "','" + ObjServico.Nome +
                    "','" + ObjServico.Descricao +
                    "','" + ObjServico.Sla +
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
        public List<Servico> ConsultaServicoByIdDAO()
        {
            List<Servico> ServicoList = new List<Servico>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Servico]
                  WHERE ativo = 1 and idServico =" + ObjServico.Id, Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Servico Servicos = FactoryServico.GetNew();

                    Servicos.Id = Dr.GetInt32(0);
                    Servicos.Tipo = Dr.GetString(1);
                    Servicos.Nome = Dr.GetString(2);
                    Servicos.Descricao = Dr.GetString(3);
                    Servicos.Sla = Dr.GetDouble(4);
                    Servicos.Status = Dr.GetInt32(5);

                    ServicoList.Add(Servicos);
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
            return ServicoList;
        }
        public bool AlteraServicoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Servico] SET 
	                    Tipo='" + ObjServico.Tipo + "'," +
                        "Nome='" + ObjServico.Nome + "' " +
                        "Descricao='" + ObjServico.Descricao + "' " +
                        "Sla='" + ObjServico.Sla + "' " +
                        "WHERE idServico='" + ObjServico.Id + "'" +
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
        public bool InativaServicoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Servico] SET
                        ativo=0 " +
                        "WHERE idServico='" + ObjServico.Id + "'" +
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
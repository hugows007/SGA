using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterServicoDAO
    {
        string ServicoNome = null;
        public Servico ObjServico = null;
        SqlConnection Con = null;
        public ManterServicoDAO()
        {

        }
        public ManterServicoDAO(Servico ObjServico)
        {
            this.ObjServico = ObjServico;
        }
        public SqlDataReader ConsultaServicosDataReaderDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idServico]
                      ,[tipo]
                      ,[nome]
                      ,[descricao]
                 FROM [dbo].[Servico]
                 WHERE ativo = 1
                 ORDER BY Tipo", Con);

                Dr = Cmd.ExecuteReader();
                return Dr;
            }
            catch (SqlException Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public SqlDataReader ConsultaServicosDataReaderByIdTpDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idServico]
                      ,[idTipo]
                      ,[nome]
                      ,[descricao]
                 FROM [dbo].[Servico]
                 WHERE ativo = 1 and idTipo = @Tipo
                 ORDER BY nome;", Con);

                Cmd.Parameters.AddWithValue("@Tipo", ObjServico.Tipo);

                Dr = Cmd.ExecuteReader();
                return Dr;
            }
            catch (SqlException Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public SqlDataReader ConsultaTpServicosDataReaderDAO()
        {
            SqlDataReader Dr = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idTipoServ]
                      ,[tipo]
                 FROM [dbo].[TipoServico]
                 WHERE ativo = 1
                 ORDER BY Tipo;", Con);

                Dr = Cmd.ExecuteReader();
                return Dr;
            }
            catch (SqlException Ex)
            {
                new LogException(Ex).InsereLogBd();
                throw;
            }
        }
        public string ConsultaTpServicoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT [idTipoServ]
                      ,[tipo]
                 FROM [dbo].[TipoServico]
                 WHERE idTipoServ = @Tipo
                 and ativo = 1
                 ORDER BY Tipo;", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjServico.Tipo);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ServicoNome = Dr.GetString(1);
                    }

                    return ServicoNome;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public List<Servico> ConsultaServicosDAO()
        {
            List<Servico> ServicoList = new List<Servico>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Servico]
                  WHERE ativo = 1", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Servico Servicos = FactoryServico.GetNew();

                        Servicos.Id = Dr.GetInt32(0);
                        Servicos.Tipo = Dr.GetInt32(1);
                        Servicos.Nome = Dr.GetString(2);
                        Servicos.Descricao = Dr.GetString(3);
                        Servicos.Sla = Dr.GetInt32(4);
                        Servicos.Status = Dr.GetInt32(5);

                        ServicoList.Add(Servicos);
                    }

                    return ServicoList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public Servico ConsultaServicoByIdDAO()
        {
            SqlDataReader Dr = null;
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Servico]
                  WHERE ativo = 1 and idServico = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjServico.Id = Dr.GetInt32(0);
                        ObjServico.Tipo = Dr.GetInt32(1);
                        ObjServico.Nome = Dr.GetString(2);
                        ObjServico.Descricao = Dr.GetString(3);
                        ObjServico.Sla = Dr.GetInt32(4);
                        ObjServico.Status = Dr.GetInt32(5);
                    }

                    return ObjServico;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();
                    throw;
                }
            }
        }
        public bool CadastraServicoDAO()
        {
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Servico]
                ([idTipo]
                  ,[nome]
                  ,[descricao]
                  ,[sla]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Tipo
                ,@Nome
                ,@Desc
                ,@Sla
                ,@Data
                ,@Usuario
                ,1)", Con);

                Cmd.Parameters.AddWithValue("@Tipo", ObjServico.Tipo);
                Cmd.Parameters.AddWithValue("@Nome", ObjServico.Nome);
                Cmd.Parameters.AddWithValue("@Desc", ObjServico.Descricao);
                Cmd.Parameters.AddWithValue("@Sla", ObjServico.Sla);
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
            finally
            {
                if (Con != null)
                {
                    Con.Close();
                }
            }
        }
        public bool AlteraServicoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Servico] SET 
	                    idTipo = @Tipo
                        ,Nome = @Nome
                        ,Descricao = @Desc
                        ,Sla = @Sla
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario  
                        WHERE idServico = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjServico.Tipo);
                    Cmd.Parameters.AddWithValue("@Nome", ObjServico.Nome);
                    Cmd.Parameters.AddWithValue("@Desc", ObjServico.Descricao);
                    Cmd.Parameters.AddWithValue("@Sla", ObjServico.Sla);
                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);
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
        public bool InativaServicoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Servico] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario   
                        WHERE idServico = @Id;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);
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
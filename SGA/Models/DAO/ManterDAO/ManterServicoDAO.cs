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
        public Servico ObjServico;
        public TipoServico ObjTpServico;

        public ManterServicoDAO()
        {

        }
        public ManterServicoDAO(Servico ObjServico)
        {
            this.ObjServico = ObjServico;
        }
        public ManterServicoDAO(TipoServico ObjTpServico)
        {
            this.ObjTpServico = ObjTpServico;
        }
        public ManterServicoDAO(Servico ObjServico, TipoServico ObjTpServico)
        {
            this.ObjServico = ObjServico;
            this.ObjTpServico = ObjTpServico;
        }
        public List<TipoServico> ConsultaTpServicosDAO()
        {
            try
            {
                List<TipoServico> ServicoTpList = new List<TipoServico>();
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
                 SELECT [idTipoServ]
                      ,[tipo]
                 FROM [dbo].[TipoServico]
                 WHERE ativo = 1
                 ORDER BY Tipo;", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        TipoServico TpServ = FactoryServico.GetNewTpServico();

                        TpServ.Id = Dr.GetInt32(0);
                        TpServ.NomeTipoServ = Dr.GetString(1);

                        ServicoTpList.Add(TpServ);
                    }

                    return ServicoTpList;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public TipoServico ConsultaTpServicoByIdDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                 FROM [dbo].[TipoServico]
                 WHERE idTipoServ = @Tipo
                 and ativo = 1
                 ORDER BY Tipo;", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjTpServico.Id);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjTpServico.Id = Dr.GetInt32(0);
                        ObjTpServico.NomeTipoServ = Dr.GetString(1);
                        ObjTpServico.IdStatus = Dr.GetInt32(2);
                    }

                    return ObjTpServico;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Servico> ConsultaServicosByTipoDAO()
        {
            try
            {
                SqlDataReader Dr;
                SqlCommand Cmd;
                List<Servico> ServicoList = new List<Servico>();

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                        SELECT *
                          FROM [dbo].[Servico]
                          WHERE ativo = 1 and idTipo = @IdTipo", Con);

                    Cmd.Parameters.AddWithValue("@IdTipo", ObjServico.IdTipo);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Servico Servicos = FactoryServico.GetNewServico();

                        Servicos.Id = Dr.GetInt32(0);
                        Servicos.IdTipo = Dr.GetInt32(1);
                        Servicos.NomeServ = Dr.GetString(2);
                        Servicos.DescServ = Dr.GetString(3);
                        Servicos.Sla = Dr.GetInt32(4);
                        Servicos.IdStatus = Dr.GetInt32(5);

                        ServicoList.Add(Servicos);
                    }

                    return ServicoList;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Servico> ConsultaServicosDAO()
        {
            try
            {
                List<Servico> ServicoList = new List<Servico>();
                SqlDataReader Dr = null;
                SqlCommand Cmd = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                        SELECT *
                          FROM [dbo].[Servico]
                          WHERE ativo = 1 and idEmpresa = @Empresa", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Servico Servicos = FactoryServico.GetNewServico();

                        Servicos.Id = Dr.GetInt32(0);
                        Servicos.IdTipo = Dr.GetInt32(1);
                        Servicos.NomeServ = Dr.GetString(2);
                        Servicos.DescServ = Dr.GetString(3);
                        Servicos.Sla = Dr.GetInt32(4);
                        Servicos.IdStatus = Dr.GetInt32(5);

                        ServicoList.Add(Servicos);
                    }

                    return ServicoList;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public Servico ConsultaServicoByIdDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Servico]
                  WHERE ativo = 1 and idServico = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjServico.Id = Dr.GetInt32(0);
                        ObjServico.IdTipo = Dr.GetInt32(1);
                        ObjServico.NomeServ = Dr.GetString(2);
                        ObjServico.DescServ = Dr.GetString(3);
                        ObjServico.Sla = Dr.GetInt32(4);
                        ObjServico.IdStatus = Dr.GetInt32(5);
                    }

                    return ObjServico;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool CadastraServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Servico]
                ([idTipo]
                  ,[nome]
                  ,[descricao]
                  ,[sla]
                  ,[idEmpresa]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Tipo
                ,@Nome
                ,@Desc
                ,@Sla
                ,@Empresa
                ,@Data
                ,@Usuario
                ,1)", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjServico.IdTipo);
                    Cmd.Parameters.AddWithValue("@Nome", ObjServico.NomeServ);
                    Cmd.Parameters.AddWithValue("@Desc", ObjServico.DescServ);
                    Cmd.Parameters.AddWithValue("@Sla", ObjServico.Sla);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();
                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool CadastraTpServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[TipoServico]
                ([Tipo]
                  ,[idEmpresa]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Tipo
                ,@Empresa
                ,@Data
                ,@Usuario
                ,1)", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjTpServico.NomeTipoServ);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();
                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool AlteraServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
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
                        WHERE idServico = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjServico.IdTipo);
                    Cmd.Parameters.AddWithValue("@Nome", ObjServico.NomeServ);
                    Cmd.Parameters.AddWithValue("@Desc", ObjServico.DescServ);
                    Cmd.Parameters.AddWithValue("@Sla", ObjServico.Sla);
                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool AlteraTipoServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {


                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[TipoServico] SET 
                        Tipo = @Tipo
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario  
                        WHERE idTipoServ = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Tipo", ObjTpServico.NomeTipoServ);
                    Cmd.Parameters.AddWithValue("@Id", ObjTpServico.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool InativaServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[Servico] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario   
                        WHERE idServico = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjServico.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool InativaTpServicoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                  [dbo].[TipoServico] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario   
                        WHERE idTipoServ = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjTpServico.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());

                    Cmd.ExecuteNonQuery();

                    return true;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
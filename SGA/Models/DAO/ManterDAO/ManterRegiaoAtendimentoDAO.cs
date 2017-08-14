using SGA.DAO;
using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterRegiaoAtendimentoDAO
    {
        private RegiaoAtendimento ObjRegiao;
        public ManterRegiaoAtendimentoDAO()
        {

        }
        public ManterRegiaoAtendimentoDAO(RegiaoAtendimento ObjRegiao)
        {
            this.ObjRegiao = ObjRegiao;
        }
        public List<RegiaoAtendimento> ConsultaRegiaoAtendimentosDAO()
        {
            List<RegiaoAtendimento> AreaList = new List<RegiaoAtendimento>();
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[RegiaoDeAtendimento]
                  WHERE ativo = 1 and idEmpresa = @Empresa", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        RegiaoAtendimento Usr = FactoryRegiao.GetNew();

                        Usr.Id = Dr.GetInt32(0);
                        Usr.Regiao = Dr.GetString(1);
                        Usr.Cidade = Dr.GetString(2);
                        Usr.Estado = Dr.GetString(3);

                        AreaList.Add(Usr);
                    }

                    return AreaList;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public RegiaoAtendimento ConsultaRegiaoAtendimentoByIdDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[RegiaoDeAtendimento]
                  WHERE ativo = 1 and idRegiaoAtendimento = @Id and idEmpresa = @Empresa", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjRegiao.Id);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjRegiao.Id = Dr.GetInt32(0);
                        ObjRegiao.Regiao = Dr.GetString(1);
                        ObjRegiao.Cidade = Dr.GetString(2);
                        ObjRegiao.Estado = Dr.GetString(3);
                    }

                    return ObjRegiao;
                }
                catch (SqlException Ex)
                {
                    new LogException(Ex).InsereLogBd();

                    throw;
                }
            }
        }
        public bool CadastraRegiaoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[RegiaoDeAtendimento]
                ([regiao]
                  ,[cidade]
                  ,[estado]
                  ,[idEmpresa]
                  ,[dataRegistro]
                  ,[usuarioRegistro]
                  ,[ativo])
            VALUES
                (@Regiao
                ,@Cidade
                ,@Estado
                ,@Empresa
                ,@Data 
                ,@Usuario    
                ,1);", Con);

                    Cmd.Parameters.AddWithValue("@Regiao", ObjRegiao.Regiao);
                    Cmd.Parameters.AddWithValue("@Cidade", ObjRegiao.Cidade);
                    Cmd.Parameters.AddWithValue("@Estado", ObjRegiao.Estado);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
        public bool AlteraRegiaoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[RegiaoDeAtendimento] SET 
	                    Regiao = @Regiao
                        ,Cidade = @Cidade
                        ,Estado = @Estado
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario
                        WHERE idRegiaoAtendimento = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Regiao", ObjRegiao.Regiao);
                    Cmd.Parameters.AddWithValue("@Cidade", ObjRegiao.Cidade);
                    Cmd.Parameters.AddWithValue("@Estado", ObjRegiao.Estado);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Usuario", Membership.GetUser().ToString());
                    Cmd.Parameters.AddWithValue("@Id", ObjRegiao.Id);

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
        public bool InativarRegiaoAtendimentoDAO()
        {
            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
                {
                    SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[RegiaoDeAtendimento] SET
                        ativo = 0
                        ,dataRegistro = @Data
                        ,usuarioRegistro = @Usuario                         
                    WHERE idRegiaoAtendimento = @Id and idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Id", ObjRegiao.Id);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);
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
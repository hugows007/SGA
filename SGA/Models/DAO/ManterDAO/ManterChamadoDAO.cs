using SGA.DAO;
using SGA.Models.Chamados;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterChamadoDAO
    {
        private Chamado ObjChamado;
        int UltimoId;
        public ManterChamadoDAO()
        {

        }
        public ManterChamadoDAO(Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
        }
        public List<Chamado> ConsultaChamadosDAO()
        {
            List<Chamado> ChamList = new List<Chamado>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Chamado]", Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Chamado Cham = FactoryChamado.GetNew();

                    Cham.Id = Dr.GetInt32(0);
                    Cham.Assunto = Dr.GetString(1);
                    Cham.Descricao = Dr.GetString(2);
                    Cham.Status = Dr.GetInt32(3);
                    Cham.DataAbertura = Dr.GetDateTime(4);
                    Cham.DataFechamento = Dr.GetDateTime(5);
                    Cham.AreaAtendimento = Dr.GetInt32(6);
                    Cham.Servico = Dr.GetInt32(7);

                    ChamList.Add(Cham);
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
            return ChamList;
        }
        public bool AbreChamadoDAO()
        {
            SqlConnection Con = null;
            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
            INSERT INTO [dbo].[Chamado]
                ([assunto]
                  ,[descricao]
                  ,[idStatusChamado]
                  ,[dataAbertura]
                  ,[idAreaAtendimento]
                  ,[idServico])
            VALUES
                ('" + ObjChamado.Assunto +
                    "','" + ObjChamado.Descricao +
                    "','" + 1 +
                    "','" + DateTime.Now +
                    "','" + ObjChamado.AreaAtendimento +
                    "','" + ObjChamado.Servico +
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
        public List<Chamado> ConsultaChamadoByIdDAO()
        {
            List<Chamado> ChamList = new List<Chamado>();
            SqlDataReader Dr = null;

            try
            {
                SqlConnection ConArea = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT *
                  FROM [dbo].[Chamado]
                  WHERE idChamado =" + ObjChamado.Id, ConArea);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    Chamado Cham = FactoryChamado.GetNew();

                    Cham.Id = Dr.GetInt32(0);
                    Cham.Assunto = Dr.GetString(1);
                    Cham.Descricao = Dr.GetString(2);
                    Cham.Status = Dr.GetInt32(3);
                    Cham.DataAbertura = Dr.GetDateTime(4);
                    Cham.DataFechamento = Dr.GetDateTime(5);
                    Cham.AreaAtendimento = Dr.GetInt32(6);
                    Cham.Servico = Dr.GetInt32(7);

                    ChamList.Add(Cham);
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
            return ChamList;
        }
        public bool AlteraChamadoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET 
	                    Assunto='" + ObjChamado.Assunto + "'," +
                        "idServico = '" + ObjChamado.Servico + "'," +
                        "Descricao='" + ObjChamado.Descricao + "' " +
                        "WHERE idChamado='" + ObjChamado.Id + "'" +
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
        public bool CancelaChamadoDAO()
        {
            SqlConnection Con = null;

            try
            {
                Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                UPDATE 
	                [dbo].[Chamado] SET
                        ativo=0 " +
                        "WHERE idChamado='" + ObjChamado.Id + "'" +
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
        public int GetUltIdChamado()
        {
            SqlDataReader Dr = null;

            try
            {
                SqlConnection Con = new Conexao().ConexaoDB();

                SqlCommand Cmd = new SqlCommand(@"
                SELECT MAX(idChamado)
                    from Chamado", Con);

                Dr = Cmd.ExecuteReader();

                while (Dr.Read())
                {
                    UltimoId = Dr.GetInt32(0);
                }
            }
            catch (SqlException)
            {
                return 0;
            }
            finally
            {
                if (Dr != null)
                    Dr.Close();
            }
            return UltimoId;
            
        }
    }
}
using SGA.DAO;
using SGA.Models.Historicos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterHistoricoDAO : ManterHistorico
    {
        Historico ObjHistorico;
        public ManterHistoricoDAO()
        {

        }
        public ManterHistoricoDAO(Historico ObjHistorico)
        {
            this.ObjHistorico = ObjHistorico;
        }
        public List<Historico> GetHistoricoDAO()
        {
            try
            {
                List<Historico> List = new List<Historico>();
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                        select
                            Srv.nome
                            ,Srv.descricao
                            ,Atd.relatorioAtendimento as Resolucões 
                            ,Atd.idAtendimento
                            ,Atd.idChamado 
                            ,case when Av.likeSolucao is null then 0 else Av.likeSolucao end from 
                            Atendimento Atd inner join 
                            Chamado Chm on (Atd.idChamado = Chm.idChamado) inner join 
                            Servico Srv on (Chm.idServico = Srv.idServico) left join
							AvaliacaoSolucao Av on (Av.idChamado = Chm.idChamado) where
                            Chm.idStatusChamado = 3 and Chm.idEmpresa = 13 and Chm.idServico = 33 and
							Atd.idAtendimento = (select max(A.idAtendimento) from Atendimento A where A.idChamado = Atd.idChamado)
                            order by 6 desc;", Con);

                    Cmd.Parameters.AddWithValue("@Servico", ObjHistorico.IdServico);
                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Historico Hist = FactoryHistorico.GetNew();

                        Hist.NomeServico = Dr.GetString(0);
                        Hist.DescricaoServ = Dr.GetString(1);
                        Hist.Resolucao = Dr.GetString(2);
                        Hist.IdAtendimento = Dr.GetInt32(3);
                        Hist.IdChamado = Dr.GetInt32(4);
                        Hist.Like = Dr.GetInt32(5);

                        List.Add(Hist);
                    }

                    return List;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
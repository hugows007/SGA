using SGA.DAO;
using SGA.Models.Relatorios;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterRelatorioDAO
    {
        Relatorio ObjRelatorio;
        SqlCommand Cmd;
        List<Relatorio> ListRelat = new List<Relatorio>();

        public ManterRelatorioDAO()
        {

        }
        public ManterRelatorioDAO(Relatorio ObjRelatorio)
        {
            this.ObjRelatorio = ObjRelatorio;
        }
        public List<Relatorio> GetQtdChamadosDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    if (ObjRelatorio.RelatMes)
                    {
                        Cmd = new SqlCommand(@"
                select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 1 and idEmpresa = @Empresa and dataAbertura >= @Mes
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 2 and idEmpresa = @Empresa and dataAbertura >= @Mes
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 3 and idEmpresa = @Empresa and dataAbertura >= @Mes
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 4 and idEmpresa = @Empresa and dataAbertura >= @Mes
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 5 and idEmpresa = @Empresa and dataAbertura >= @Mes
					group by idStatusChamado;", Con);

                        Cmd.Parameters.AddWithValue("@Mes", new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1));
                    }
                    else if (ObjRelatorio.RelatAno)
                    {
                        Cmd = new SqlCommand(@"
					select count(*) AS QTD, MONTH(dataAbertura) AS MES, 1 as Status
                    from chamado 
                    where dataAbertura >= @Ano and idEmpresa = @Empresa
					group by MONTH(dataAbertura)
					union all
					select count(*) AS QTD, MONTH(dataFechamento) AS MES, 3 as Status
                    from chamado 
                    where dataFechamento >= @Ano and idEmpresa = @Empresa
					group by MONTH(dataFechamento)
					order by MES, Status;", Con);

                        Cmd.Parameters.AddWithValue("@Ano", new DateTime(DateTime.Now.Year, 1, 1));
                    }
                    else
                    {
                        Cmd = new SqlCommand(@"
                select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 1 and idEmpresa = @Empresa
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 2 and idEmpresa = @Empresa
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 3 and idEmpresa = @Empresa
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 4 and idEmpresa = @Empresa
					group by idStatusChamado
            union all
            select count(*), idStatusChamado 
                    from chamado 
                    where idStatusChamado = 5 and idEmpresa = @Empresa
					group by idStatusChamado;", Con);

                    }

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        if (ObjRelatorio.RelatAno)
                        {
                            Relatorio Obj = FactoryRelatorio.GetNew();

                            if (Dr.GetInt32(2).Equals(1))
                            {
                                Obj.QtdChamadosAber = Dr.GetInt32(0);
                                Obj.Mes = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Dr.GetInt32(1));
                                Obj.Status = Dr.GetInt32(2);
                                ListRelat.Add(Obj);
                            }
                            else
                            {
                                Obj.QtdChamadosConc = Dr.GetInt32(0);
                                Obj.Mes = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Dr.GetInt32(1));
                                Obj.Status = Dr.GetInt32(2);
                                ListRelat.Add(Obj);
                            }

                        }
                        else
                        {
                            switch (Dr.GetInt32(1))
                            {
                                case 1:
                                    ObjRelatorio.QtdChamadosAber = Dr.GetInt32(0);
                                    ListRelat.Add(ObjRelatorio);
                                    break;
                                case 2:
                                    ObjRelatorio.QtdChamadosEmAnd = Dr.GetInt32(0);
                                    ListRelat.Add(ObjRelatorio);
                                    break;
                                case 3:
                                    ObjRelatorio.QtdChamadosConc = Dr.GetInt32(0);
                                    ListRelat.Add(ObjRelatorio);
                                    break;
                                case 4:
                                    ObjRelatorio.QtdChamadosRetra = Dr.GetInt32(0);
                                    ListRelat.Add(ObjRelatorio);
                                    break;
                                case 5:
                                    ObjRelatorio.QtdChamadosCanc = Dr.GetInt32(0);
                                    ListRelat.Add(ObjRelatorio);
                                    break;
                                default:
                                    break;
                            }
                        }
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetTopTecnicosDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select top 5 (Usr.nome)
                          ,avg(Av.avaliacaoAtendimento + Av.avaliacaoTecnico) as Media from 
                          Avaliacao Av inner join 
                          Atendimento At on (Av.idAtendimento = At.idAtendimento) inner join
                          Usuario Usr on (At.idTecnico = Usr.idUsuario) where 
                          Usr.idEmpresa = @Empresa
                          group by Usr.nome
                          order by avg(Av.avaliacaoAtendimento + Av.avaliacaoTecnico) desc", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Usuario = Dr.GetString(0);
                        Obj.Media = Dr.GetInt32(1);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetTopSolucoesDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                   select top 5 (Usr.nome)
						  ,sum(Avs.likeSolucao) as Soluções_Uteis from 
                          Atendimento At inner join
                          Usuario Usr on (At.idTecnico = Usr.idUsuario) inner join 
						  AvaliacaoSolucao Avs on (At.idAtendimento = Avs.idAtendimento) where
						  Usr.idEmpresa = @Empresa
                          group by Usr.nome
						  order by 2 desc;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Usuario = Dr.GetString(0);
                        Obj.Media = Dr.GetInt32(1);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetQtdPorServicoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                        (TpSrv.tipo +': '+Srv.nome) as Servico
                        ,count(*) as Qtd from 
                        Chamado Chm inner join 
                        Servico Srv on (Chm.idServico = Srv.idServico) inner join
                        TipoServico TpSrv on (Srv.idTipo = TpSrv.idTipoServ) where
                        Chm.idEmpresa = @Empresa
                        group by Srv.nome,TpSrv.tipo;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Servico = Dr.GetString(0);
                        Obj.Media = Dr.GetInt32(1);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioChamadosDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                            Chm.idChamado
                            ,Usr.nome as Cliente
                            ,UsrTec.nome as Tecnico
                            ,Chm.assunto
                            ,Srv.nome as Servico
                            ,RgAtd.regiao
                            ,PrChm.descricao as Prioridade
                            ,StChm.status
                            ,Chm.dataAbertura
                            ,Chm.dataFechamento
                            ,case when Atd.dataInicioAtendimento is NULL then '2000-01-01 00:00:00.000' else Atd.dataInicioAtendimento end
                            ,case when Atd.dataFimAtendimento  is NULL then '2000-01-01 00:00:00.000' else Atd.dataFimAtendimento  end
                            ,case when Atd.tempoAtendimento is NULL then '0.00' else Atd.tempoAtendimento end
                            ,case when Chm.infoCancelamento is NULL then '' else Chm.infoCancelamento end
                            ,case when Chm.ContReabertura is NULL then '0' else Chm.ContReabertura end
                            ,case when Chm.ContPendencia is NULL then '0' else Chm.ContPendencia end
                        from Chamado Chm inner join				
                        Atendimento Atd on (Chm.idChamado = Atd.idChamado) inner join				
                        Usuario Usr on (Usr.idUsuario = Atd.idCliente) inner join
                        Usuario UsrTec on (UsrTec.idUsuario = Atd.idTecnico) inner join
                        StatusChamado StChm on (Chm.idStatusChamado = StChm.idStatusChamado) inner join
                        Servico Srv on (Chm.idServico = Srv.idServico) inner join
                        PrioridadeChamado PrChm on (Chm.idPrioridade = PrChm.idPrioridade) inner join
                        RegiaoDeAtendimento RgAtd on (RgAtd.idRegiaoAtendimento = Atd.idRegiaoAtendimento) where
                            Chm.idEmpresa = @Empresa " + ObjRelatorio.FiltroRelatorio + @"
                        order by Chm.idChamado;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Chamado = Dr.GetInt32(0);
                        Obj.Cliente = Dr.GetString(1);
                        Obj.Tecnico = Dr.GetString(2);
                        Obj.Assunto = Dr.GetString(3);
                        Obj.Servico = Dr.GetString(4);
                        Obj.Regiao = Dr.GetString(5);
                        Obj.Prioridade = Dr.GetString(6);
                        Obj.StatusChamado = Dr.GetString(7);
                        Obj.DataAbertura = Dr.GetDateTime(8);
                        Obj.DataFechamento = Dr.GetDateTime(9);
                        Obj.DataInicioAtendimento = Dr.GetDateTime(10);
                        Obj.DataFimAtendimento = Dr.GetDateTime(11);
                        Obj.TempoAtendimento = TimeSpan.FromMinutes(Convert.ToDouble(Dr[12].ToString()));
                        Obj.InformacaoCancelamento = Dr.GetString(13);
                        Obj.Reaberturas = Dr.GetInt32(14);
                        Obj.Pendencias = Dr.GetInt32(15);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioSLADAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                        Chm.idChamado, Srv.nome as Servico, datediff(SECOND,dataAbertura, dataFechamento) as Tempo_Conclusao_Chamado
                        ,CONVERT(CHAR(5), DATEADD(MINUTE, 60*sla, 0), 108) as SLA_Servico from 
                        Chamado Chm inner join 
                        Servico Srv on (Chm.idServico = Srv.idServico) where
                        idStatusChamado = 3 and Chm.idEmpresa = @Empresa
                        order by 3;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Chamado = Dr.GetInt32(0);
                        Obj.Servico = Dr.GetString(1);
                        Obj.TempoAtendimento = TimeSpan.FromSeconds(Convert.ToDouble(Dr[2]));
                        Obj.SLA = TimeSpan.Parse(Dr[3].ToString());
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioTempoAtendimentoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                        Chm.idChamado
                        ,Srv.nome
                        ,Usr.nome
                        ,case when datediff(SECOND, dataInicioAtendimento, dataFimAtendimento) < 0 then 0 else datediff(SECOND, dataInicioAtendimento, dataFimAtendimento) end from 
                        Atendimento Atd inner join 
                        Chamado Chm on (Atd.idChamado = Chm.idChamado) inner join
                        Usuario Usr on (Atd.idTecnico = Usr.idUsuario) inner join
                        Servico Srv on (Srv.idServico = Chm.idServico) where
                        Chm.idStatusChamado = 3 and Atd.idAtendimento = (select max(idAtendimento) from Atendimento where idChamado = Chm.idChamado) and Chm.idEmpresa = @Empresa
                        order by 4;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Chamado = Dr.GetInt32(0);
                        Obj.Servico = Dr.GetString(1);
                        Obj.Tecnico = Dr.GetString(2);
                        Obj.TempoAtendimento = TimeSpan.FromSeconds(Convert.ToDouble(Dr[3]));
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetRelatorioRecusaAtendimentoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                        Chm.idChamado
                        ,Usr.nome
                        ,Rec.dataRegistro from 
                        RecusaAtendimento Rec inner join
                        Usuario Usr on (Rec.idTecnico = Usr.idUsuario) inner join
                        Chamado Chm on (Rec.idChamado = Chm.idChamado) where
                        Rec.idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Chamado = Dr.GetInt32(0);
                        Obj.Tecnico = Dr.GetString(1);
                        Obj.DataOcorrido = Dr.GetDateTime(2);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public Relatorio GetTempoMedioAtendimentoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"select cast(avg(convert(decimal,tempoAtendimento)) as numeric(15,2)) from atendimento where idEmpresa = @Empresa;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjRelatorio.TempoAtendimento = TimeSpan.FromHours(Convert.ToDouble(Dr[0].ToString()));
                    }
                    return ObjRelatorio;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public List<Relatorio> GetAtendimentoPorRegiaoDAO()
        {
            try
            {
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    Cmd = new SqlCommand(@"
                    select 
                        top 10 Rg.Regiao
                        , COUNT(*) as Quantidade from 
                        Atendimento Atd inner join 
                        RegiaoDeAtendimento Rg on (Atd.idRegiaoAtendimento = Rg.idRegiaoAtendimento) where
						Atd.idEmpresa = @Empresa
                        group by Rg.regiao 
                        order by 2;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Relatorio Obj = FactoryRelatorio.GetNew();
                        Obj.Regiao = Dr.GetString(0);
                        Obj.Media = Dr.GetInt32(1);
                        ListRelat.Add(Obj);
                    }
                    return ListRelat;

                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}
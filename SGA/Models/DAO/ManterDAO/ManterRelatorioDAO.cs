using SGA.DAO;
using SGA.Models.Relatorios;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterRelatorioDAO
    {
        Relatorio ObjRelatorio;
        Usuario ObjUsuario;
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
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
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
                        else {
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
                catch (SqlException)
                {
                    throw;
                }
            }
        }
        public List<Relatorio> GetTopTecnicosDAO()
        {
            SqlDataReader Dr = null;

            using (SqlConnection Con = new Conexao().ConexaoDB())
            {
                try
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
                catch (SqlException)
                {
                    throw;
                }
            }
        }
    }
}
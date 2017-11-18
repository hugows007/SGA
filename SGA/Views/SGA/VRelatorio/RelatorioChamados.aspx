<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RelatorioChamados.aspx.cs" Inherits="SGA.Views.SGA.VRelatorio.RelatorioChamados" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Relatório de chamados</title>

    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 style="text-align: center;">
                <img style="float: left;" src="/Image/Logo.jpeg" alt="" width="185" height="110" /></h2>
            <h1 style="text-align: center;">&nbsp;</h1>
            <h2 style="text-align: center;">Relatório de <%=TipoRelatorio%></h2>
            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
            <p>&nbsp;</p>
            <button id="btn">Clique aqui para imprimir</button>
            <input type="button" value="Voltar" onclick="history.go(-1)" />
            <hr />
            <p>&nbsp;</p>
            <div style="overflow-x: auto;" id="impressao">
                <%if (TipoRelatorio.Equals("Chamados"))
                    { %>
                <table>
                    <thead>
                        <tr>
                            <th>Chamado</th>
                            <th>Cliente</th>
                            <th>Técnico</th>
                            <th>Assunto</th>
                            <th>Serviço</th>
                            <th>Região</th>
                            <th>Prioridade</th>
                            <th>Status</th>
                            <th>Data abertura</th>
                            <th>Data fechamento</th>
                            <th>Início atendimento</th>
                            <th>Fim atendimento</th>
                            <th>Tempo atendimento</th>
                            <th>Informação cancelamento</th>
                            <th>Reaberturas</th>
                            <th>Pendências</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var Lista in ListaRelatorio)
                            { %>
                        <tr>
                            <td><%=Lista.Chamado %> </td>
                            <td><%=Lista.Cliente %> </td>
                            <td><%=Lista.Tecnico %> </td>
                            <td><%=Lista.Assunto %> </td>
                            <td><%=Lista.Servico %> </td>
                            <td><%=Lista.Regiao %> </td>
                            <td><%=Lista.Prioridade %> </td>
                            <td><%=Lista.StatusChamado %> </td>
                            <td><%=Lista.DataAbertura %> </td>
                            <td><%=Lista.DataFechamento %> </td>
                            <td><%=Lista.DataInicioAtendimento %> </td>
                            <td><%=Lista.DataFimAtendimento %> </td>
                            <td><%=Lista.TempoAtendimento.ToString(@"hh\:mm")%> </td>
                            <td><%=Lista.InformacaoCancelamento %> </td>
                            <td><%=Lista.Reaberturas %> </td>
                            <td><%=Lista.Pendencias %> </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <%}
                    else if (TipoRelatorio.Equals("SLA"))
                    { %>
                <table>
                    <thead>
                        <tr>
                            <th>Chamado</th>
                            <th>Serviço</th>
                            <th>Tempo conclusão do chamado</th>
                            <th>SLA do serviço</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var Lista in ListaRelatorio)
                            { %>
                        <tr>
                            <td><%=Lista.Chamado %> </td>
                            <td><%=Lista.Servico %> </td>
                            <td><%=String.Format("{0:%d} dia(s), ", Lista.TempoAtendimento) + new DateTime(Lista.TempoAtendimento.Ticks).ToString("HH:mm:ss")%> </td>
                            <td><%=Lista.SLA %> </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <%}
                    else if (TipoRelatorio.Equals("TempoAtend"))
                    { %>
                <table>
                    <thead>
                        <tr>
                            <th>Chamado</th>
                            <th>Serviço</th>
                            <th>Tecnico</th>
                            <th>Tempo de atendimento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var Lista in ListaRelatorio)
                            { %>
                        <tr>
                            <td><%=Lista.Chamado %> </td>
                            <td><%=Lista.Servico %> </td>
                            <td><%=Lista.Tecnico %> </td>
                            <td><%=String.Format("{0:%d} dia(s), ", Lista.TempoAtendimento) + new DateTime(Lista.TempoAtendimento.Ticks).ToString("HH:mm:ss")%> </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <%}
                    else if (TipoRelatorio.Equals("RecusaAtend"))
                    { %>
                <table>
                    <thead>
                        <tr>
                            <th>Chamado</th>
                            <th>Tecnico</th>
                            <th>Data do ocorrido</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var Lista in ListaRelatorio)
                            { %>
                        <tr>
                            <td><%=Lista.Chamado %> </td>
                            <td><%=Lista.Tecnico %> </td>
                            <td><%=Lista.DataOcorrido%> </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <%} %>
            </div>
        </div>
    </form>
    <script>
        document.getElementById('btn').onclick = function () {
            var conteudo = document.getElementById('impressao').innerHTML,
                tela_impressao = window.open('about:blank');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>
</body>
</html>

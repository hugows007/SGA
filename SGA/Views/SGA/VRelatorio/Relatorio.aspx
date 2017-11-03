<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="SGA.Views.SGA.VRelatorio.Relatorio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Relatório
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <label for="EspecTextBox" class="control-label">Selecione os filtros: </label>
                            <div class="form-group">
                                <div class="col-sm-12 panel-heading">
                                    <%--<asp:CheckBox ID="CheckBoxChmAbert" runat="server" Text="Chamados abertos" />
                                    <asp:CheckBox ID="CheckBoxChmEmAnd" runat="server" Text="Chamados em andamento" />
                                    <asp:CheckBox ID="CheckBoxChmRetr" runat="server" Text="Chamados em retrabalho" />
                                    <asp:CheckBox ID="CheckBoxChmConc" runat="server" Text="Chamados concluídos" />
                                    <asp:CheckBox ID="CheckBoxChmCanc" runat="server" Text="Chamados cancelados" />--%>

                                    <select id="filtrosChm" class="selectpicker" multiple runat="server" clientidmode="Static">
                                        <option value="1">Chamados abertos</option>
                                        <option value="2">Chamados em andamento</option>
                                        <option value="3">Chamados em retrabalho</option>
                                        <option value="4">Chamados em concluídos</option>
                                        <option value="5">Chamados em cancelados</option>
                                    </select>
                                    <select id="filtrosPrioridade" class="selectpicker" multiple runat="server" clientidmode="Static">
                                        <option value="1">Baixa</option>
                                        <option value="2">Média</option>
                                        <option value="3">Alta</option>
                                        <option value="4">Urgente</option>
                                    </select>
                                </div>
                                <asp:Button ID="Gerar" runat="server" Text="Gerar relatório" class="btn btn-default" OnClick="Gerar_Click" />
                                <br />
                                <br />
                                <label for="EspecTextBox" class="control-label">Relatório: </label>
                                <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                    <table id="example" class="table table-striped table-bordered table-hover">
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
                                                <th>Data de abertura</th>
                                                <th>Data de fechamento</th>
                                                <th>Data início de atendimento</th>
                                                <th>Data fim de atendimento</th>
                                                <th>Tempo de atendimento</th>
                                                <th>Informação de cancelamento</th>
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
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-default" href="/Views/SGA/VEspecialidade/ConsultaEspecialidades.aspx">Voltar</a>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

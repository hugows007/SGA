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
                                <br />
                                <br />
                            </div>
                            <asp:Button ID="GerarRelatorioChamado" runat="server" Text="Gerar relatório de chamados" class="btn btn-default" OnClick="GerarRelatorioChamado_Click" />
                        </div>
                        <div class="panel-body">
                            <label for="EspecTextBox" class="control-label">Gerar relatório de SLA: </label>
                            <div class="form-group">
                                <div class="col-sm-12 panel-heading">
                                </div>
                            </div>
                            <asp:Button ID="GerarRelatorioSLA" runat="server" Text="Gerar relatório SLA" class="btn btn-default" OnClick="GerarRelatorioSLA_Click" />
                        </div>
                        <div class="panel-body">
                            <label for="EspecTextBox" class="control-label">Gerar relatório de tempo de atendimento técnico: </label>
                            <div class="form-group">
                                <div class="col-sm-12 panel-heading">
                                </div>
                            </div>
                            <asp:Button ID="GerarRelatorioTempo" runat="server" Text="Gerar relatório de tempo de atendimento" class="btn btn-default" OnClick="GerarRelatorioTempo_Click" />
                        </div>
                        <div class="panel-body">
                            <label for="EspecTextBox" class="control-label">Gerar relatório de recusa de atendimento: </label>
                            <div class="form-group">
                                <div class="col-sm-12 panel-heading">
                                </div>
                            </div>
                            <asp:Button ID="GerarRelatorioRecusa" runat="server" Text="Gerar relatório de recusa de atendimento" class="btn btn-default" OnClick="GerarRelatorioRecusa_Click" />
                        </div>
                        <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

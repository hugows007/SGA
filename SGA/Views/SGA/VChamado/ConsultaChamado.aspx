<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaChamado.aspx.cs" Inherits="SGA.Views.SGA.VChamado.ConsultaChamado" %>

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
                        Informações do chamado
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="panel-body">
                                <%if (ObjChamado != null)
                                    { %>
                                <div class="form-group">
                                    <label class="control-label">Código do chamado: <%=ObjChamado.Id %></label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"><span class="glyphicon glyphicon-flag"></span><%=ObjPrioridade.DescPrioridade %></label>
                                </div>
                                <div class="alert alert-warning">
                                    <label for="Status" class="control-label">Status atual: <%=ObjStatusChm.NomeStatus %></label>
                                </div>
                                <%if (CancButtonClick && !EnceButtonClick)
                                    {%>
                                <script>
                                    alertify.log("Informe o motivo do cancelamento");
                                </script>
                                <div class="form-group">
                                    <label for="DescCancelTextBox" class="control-label">Diga o motivo do cancelamento: </label>
                                    <asp:TextBox ID="DescCancelTextBox" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <%}
                                    else if (!CancButtonClick && EnceButtonClick)
                                    {%>
                                <script>
                                    alertify.log("Informe o relatório do atendimento");
                                </script>
                                <div class="checkbox">
                                    <label class="control-label">
                                        <asp:CheckBox ID="CheckBoxPend" runat="server" OnCheckedChanged="CheckBoxPend_CheckedChanged" AutoPostBack="true" />Existem pendências?</label>
                                </div>
                                <div class="form-group">
                                    <label for="EnceRelatTextBox" class="control-label">Informe o relatório do antedimento: </label>
                                    <asp:TextBox ID="EnceRelatTextBox" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <%if (PendBox)
                                    {
                                %>
                                <div class="form-group">
                                    <label for="PendRelatTextBox" class="control-label">Informe a(s) pendência(s): </label>
                                    <asp:TextBox ID="PendRelatTextBox" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <%}
                                %>
                                <%}
                                    else {%>
                                <div class="form-group">
                                    <label for="Assunto" class="control-label">Assunto do chamado:</label>
                                    <input id="Assunto" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjChamado.Assunto %>" />
                                </div>
                                <div class="form-group">
                                    <label for="Desc" class="control-label">Descrição do problema:</label>
                                    <input id="Desc" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjChamado.Descricao %>" />
                                </div>
                                <div class="form-group">
                                    <label for="DataAbertura" class="control-label">Data e hora de abertura:</label>
                                    <input id="DataAbertura" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjChamado.DataAbertura %>" />
                                </div>
                                <div class="form-group">
                                    <label for="DataFechamento" class="control-label">Data e hora de fechamento:</label>
                                    <input id="DataFechamento" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjChamado.DataFechamento %>" />
                                </div>
                                <div class="form-group">
                                    <label for="AreaAtendimento" class="control-label">Região de atendimento:</label>
                                    <input id="AreaAtendimento" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjRegiao.Regiao %>" />
                                </div>
                                <div class="form-group">
                                    <label for="Servico" class="control-label">Serviço:</label>
                                    <input id="Servico" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjServico.NomeServ%>" />
                                </div>
                                <div class="form-group">
                                    <label for="Cliente" class="control-label">Cliente:</label>
                                    <input id="Cliente" type="text" class="form-control input-sm" disabled="disabled" value="<%=NomeCliente %>" />
                                </div>
                                <div class="form-group">
                                    <label for="TecnicoResp" class="control-label">Técnico responsável:</label>
                                    <input id="TecnicoResp" type="text" class="form-control input-sm" disabled="disabled" value="<%=NomeTecnico %>" />
                                </div>
                                <%}
                                    if (!ObjStatusChm.Id.Equals(5) && !ObjStatusChm.Id.Equals(3) && !EnceButtonClick)
                                    {%>

                                <asp:Button ID="Cancelar" runat="server" Text="Cancelar chamado" class="btn btn-default" OnClick="CancelarButton_Click" />
                                <%}
                                    else if (!ObjStatusChm.Id.Equals(5) && CancButtonClick)
                                    {%>
                                <div class="form-group">
                                    <label for="MotCancelDesc" class="control-label">Motivo do cancelamento: </label>
                                    <asp:TextBox ID="MotCancelDescTextBox" runat="server" TextMode="multiline" disabled="disabled" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <%}
                                    if (ObjStatusChm.Id.Equals(2) && !CancButtonClick)
                                    {%>

                                <asp:Button ID="Encerrar" runat="server" Text="Encerrar atendimento" class="btn btn-default" OnClick="Encerrar_Click" />
                                <asp:Button ID="Historico" runat="server" Text="Consultar soluções" class="btn btn-default" OnClick="Historico_Click"/>
                                <%}
                                    else if (ObjStatusChm.Id.Equals(2) && EnceButtonClick)
                                    {%>
                                <div class="form-group">
                                    <label for="RelatAtend" class="control-label">Relatório do atendimento: </label>
                                    <asp:TextBox ID="RelatAtend" runat="server" TextMode="multiline" disabled="disabled" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <% }
                                    else if (ObjStatusChm.Id.Equals(3))
                                    {%>
                                <asp:LinkButton ID="AvaliarButton" runat="server" CssClass="btn btn-info" OnClick="AvaliarButton_Click" Text="Avaliar este chamado"></asp:LinkButton>
                                <%}
                                    } %>

                                <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <br />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

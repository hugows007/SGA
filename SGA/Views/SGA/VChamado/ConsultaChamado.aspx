<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaChamado.aspx.cs" Inherits="SGA.Views.SGA.VChamado.ConsultaChamado" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
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
                    <script>
                        function Alerta(Texto) {
                            alertify.log(Texto);
                        }
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="panel-body">
                                <%if (ObjChamado != null)
                                    { %>
                                <div class="alert alert-info">
                                    <label for="Chamado" class="control-label">Código do chamado: <%=ObjChamado.Id %></label><br />
                                    <label for="Prioridade" class="control-label">Prioridade: <%=ObjPrioridade.DescPrioridade%>&nbsp;<span class="glyphicon glyphicon-flag"></span></label><br />
                                    <%if (ObjStatusChm.Id.Equals(2) && Session["perfil"].Equals("Técnico"))
                                        {%>
                                    <label for="Mapa" class="control-label">
                                        Ver localização do cliente:
                                        <a href="/Views/SGA/VMapa/Mapa.aspx?IdCliente=<%=ObjAtend.IdCliente%>" class="btn btn-success">Clique aqui
                                        </a>
                                    </label>
                                    <%}
                                        else if (ObjStatusChm.Id.Equals(2) && Session["perfil"].Equals("Cliente Físico") || ObjStatusChm.Id.Equals(2) && Session["perfil"].Equals("Cliente Jurídico"))
                                        {%>
                                    <label for="Mapa" class="control-label">
                                        Ver localização do técnico:
                                        <a href="/Views/SGA/VMapa/Mapa.aspx?IdTecnico=<%=ObjAtend.IdTecnico%>" class="btn btn-success">Clique aqui
                                        </a>
                                    </label>
                                    <%} %>
                                </div>
                                <div class="alert alert-warning">
                                    <label for="Status" class="control-label">Status atual: <%=ObjStatusChm.NomeStatus %></label>
                                </div>
                                <%if (CancButtonClick && !EnceButtonClick)
                                    {%>

                                <div class="form-group">
                                    <label for="DescCancel" class="control-label">Diga o motivo do cancelamento: </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="DescCancel" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <%}
                                    else if (TramiteClick)
                                    {%>
                                <div class="form-group">
                                    <label for="TramiteTextBox" class="control-label">Insira um trâmite para este chamado:</label>
                                    <textarea rows="5" cols="50" maxlength="500" id="TramiteTextBox" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <%}
                                    else if (RecusarClick)
                                    {%>
                                <div class="form-group">
                                    <label for="RecusarMotivo" class="control-label">Justifique o motivo de recusar o atendimento:</label>
                                    <textarea rows="5" cols="50" maxlength="500" id="RecusarMotivo" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <%}
                                    else if (AlteraTecnico)
                                    {%>
                                <div class="form-group">
                                    <label for="ListaTecnicos">Selecione o técnico para alterar:</label><br />
                                    <select class="form-control" id="ListaTecnicos" name="Tecnico" onchange="location = this.value;">
                                        <option>Clique aqui</option>
                                        <%foreach (var Lista in ListaTecnicos)
                                            {
                                        %>
                                        <option value="/Views/SGA/VChamado/AlterarTecnico.aspx?Chamado=<%=ObjChamado.Id%>&TecnicoAntigo=<%=ObjAtend.IdTecnico %>&TecnicoNovo=<%=Lista.Id %>"><%=Lista.Login%></option>
                                        <%} %>
                                    </select>
                                </div>
                                <%}
                                    else if (!CancButtonClick && EnceButtonClick)
                                    {%>
                                <div class="checkbox">
                                    <label class="control-label">
                                        <asp:CheckBox ID="CheckBoxPend" runat="server" OnCheckedChanged="CheckBoxPend_CheckedChanged" AutoPostBack="true" />Existem pendências?</label>
                                </div>
                                <div class="form-group">
                                    <label for="EnceRelat" class="control-label">Informe o relatório do antedimento: </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="EnceRelat" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <%if (PendBox)
                                    {
                                %>
                                <div class="form-group">
                                    <label for="PendRelat" class="control-label">Informe a(s) pendência(s): </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="PendRelat" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <%}
                                %>
                                <%}
                                    else
                                    {%>
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
                                <div class="form-group">
                                    <label for="Tramite" class="control-label">Trâmites:</label>
                                    <textarea rows="5" cols="50" maxlength="100" class="form-control input-sm" disabled="disabled"><%=ObjChamado.Tramite %></textarea>
                                </div>
                                <%}
                                    if (!ObjStatusChm.Id.Equals(5) && !ObjStatusChm.Id.Equals(3) && !EnceButtonClick && !CancButtonClick)
                                    {%>
                                <asp:Button ID="Tramite" runat="server" Text="Inserir trâmite" class="btn btn-default" OnClick="Tramite_Click" />
                                <%}
                                    if (ObjStatusChm.Id.Equals(1) && !Session["perfil"].Equals("Técnico") && !TramiteClick)
                                    {%>
                                <asp:Button ID="Cancelar" runat="server" Text="Cancelar chamado" class="btn btn-default" OnClick="CancelarButton_Click" />
                                <%}
                                    if (ObjStatusChm.Id.Equals(1) && Session["perfil"].Equals("Técnico"))
                                    {%>
                                <asp:Button ID="Recusar" runat="server" Text="Recusar atendimento" class="btn btn-default" OnClick="Recusar_Click" />
                                <%}
                                    if (ObjStatusChm.Id.Equals(1) && Session["perfil"].Equals("Gestor") || ObjStatusChm.Id.Equals(4) && Session["perfil"].Equals("Gestor"))
                                    {%>
                                <asp:Button ID="AlterarTecnico" runat="server" Text="Alterar Técnico" class="btn btn-default" OnClick="AlterarTecnico_Click" />
                                <%}
                                    if (ObjStatusChm.Id.Equals(5))
                                    {%>
                                <div class="form-group">
                                    <label for="MotCancelDesc" class="control-label">Motivo do cancelamento: </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="MotCancelDesc" class="form-control input-sm" disabled runat="server" placeholder="Máximo de 500 caracteres"><%=ObjChamado.InfoCancelamento %></textarea>
                                </div>
                                <%}
                                    if (ObjStatusChm.Id.Equals(3))
                                    {%>
                                <div class="form-group">
                                    <label for="ComentAvaliacao" class="control-label">Comentário de avaliação: </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="ComentAvaliacao" class="form-control input-sm" disabled runat="server" placeholder="Máximo de 500 caracteres"><%=ObjAvaliacao.Comentario %></textarea>
                                </div>
                                <%}
                                    if (ObjStatusChm.Id.Equals(2) && !CancButtonClick && !TramiteClick && !Session["perfil"].Equals("Cliente Físico") && !Session["perfil"].Equals("Cliente Jurídico"))
                                    {%>

                                <asp:Button ID="Encerrar" runat="server" Text="Encerrar atendimento" class="btn btn-default" OnClick="Encerrar_Click" />
                                <asp:Button ID="Historico" runat="server" Text="Consultar soluções" class="btn btn-default" OnClick="Historico_Click" />
                                <%}
                                    else if (ObjStatusChm.Id.Equals(2) && EnceButtonClick && !TramiteClick && !Session["perfil"].Equals("Cliente Físico") && !Session["perfil"].Equals("Cliente Jurídico"))
                                    {%>
                                <div class="form-group">
                                    <label for="RelatorioAtend" class="control-label">Relatório do atendimento: </label>
                                    <textarea rows="5" cols="50" maxlength="500" id="RelatorioAtend" class="form-control input-sm" required runat="server" placeholder="Máximo de 500 caracteres"></textarea>
                                </div>
                                <% }
                                    else if (ObjStatusChm.Id.Equals(3) && Session["perfil"].Equals("Cliente Físico") || ObjStatusChm.Id.Equals(3) && Session["perfil"].Equals("Cliente Jurídico"))
                                    {%>
                                <asp:Button ID="AvaliarChamadoButton" runat="server" CssClass="btn btn-info" OnClick="AvaliarButton_Click" Text="Avaliar este chamado" />
                                <asp:Button ID="ReaberturaButton" runat="server" CssClass="btn btn-default" Text="Reabrir chamado" OnClick="ReaberturaButton_Click" />
                                <%}
                                    if (!Session["perfil"].Equals("Cliente Físico") && !Session["perfil"].Equals("Cliente Jurídico"))
                                    { %>
                                <asp:Button ID="ConsultarClienteButton" runat="server" CssClass="btn btn-default" Text="Consultar dados do cliente" OnClick="ConsultarClienteButton_Click" />
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
    </div>
</asp:Content>

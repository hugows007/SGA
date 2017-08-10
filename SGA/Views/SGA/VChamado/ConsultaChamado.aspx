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
                                <%if (CancButtonClick)
                                    {%>
                                <script>
                                    alertify.log("Informe o motivo do cancelamento");
                                </script>
                                <div class="form-group">
                                    <label for="DescCancelTextBox" class="control-label">Diga o motivo do cancelamento: </label>
                                    <asp:TextBox ID="DescCancelTextBox" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
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
                                    if (!ObjStatusChm.Id.Equals(5))
                                    {%>

                                <asp:Button ID="Cancelar" runat="server" Text="Cancelar chamado" class="btn btn-default" OnClick="CancelarButton_Click" />
                                <%}
                                    else
                                    {%>
                                <div class="form-group">
                                    <label for="MotCancelDesc" class="control-label">Motivo do cancelamento: </label>
                                    <asp:TextBox ID="MotCancelDescTextBox" runat="server" TextMode="multiline" disabled="disabled" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                                <%}
                                    }%>

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

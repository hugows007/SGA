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
                        <label class="control-label">Informação do chamado:</label>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <%if (ObjChamado != null)
                                { %>
                            <div class="form-group">
                                <label class="control-label">Código do chamado: <%=ObjChamado.Id %></label>
                            </div>
                            <div class="alert alert-warning">
                                <label for="Status" class="control-label">Status atual: <%=ObjStatusChm.NomeStatus %></label>
                            </div>
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
                                <input id="AreaAtendimento" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjArea.Regiao %>" />
                            </div>
                            <div class="form-group">
                                <label for="Servico" class="control-label">Serviço:</label>
                                <input id="Servico" type="text" class="form-control input-sm" disabled="disabled" value=" <%=ObjServico.Nome%>" />
                            </div>
                            <div class="form-group">
                                <label for="TecnicoResp" class="control-label">Técnico responsável:</label>
                                <input id="TecnicoResp" type="text" class="form-control input-sm" disabled="disabled" value="" />
                            </div>
                            <%} %>
                            <b>
                                <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label><br>
                                <br>
                            </b>
                            <a class="btn btn-default" href="/Views/SGA/Inicio.aspx">Voltar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

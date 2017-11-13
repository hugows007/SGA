<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Historico.aspx.cs" Inherits="SGA.Views.SGA.VHistorico.Historico" %>

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
                        Histórico de soluções
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="alert alert-info">
                                    <center><label class="control-label">Histórico de resoluções deste tipo de serviço: </label></center>
                                </div>
                                <br>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Serviço</th>
                                            <th>Descrição</th>
                                            <th>Resolução</th>
                                            <th>Informação útil?</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%foreach (var List in ListHistorico)
                                            { %>
                                        <tr>
                                            <td><%=List.NomeServico %></td>
                                            <td><%=List.DescricaoServ %></td>
                                            <td><%=List.Resolucao %></td>
                                            <th><a href="/Views/SGA/VHistorico/Historico.aspx?IdChamado=<%=List.IdChamado %>&IdAtend=<%=List.IdAtendimento%>&Like=sim&Servico=<%=ObjHistorico.IdServico %>">
                                                <span class="glyphicon glyphicon-thumbs-up">&nbsp;<%=List.Like %></span>
                                            </a></th>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

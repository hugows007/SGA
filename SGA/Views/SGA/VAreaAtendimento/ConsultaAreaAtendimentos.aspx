<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaAreaAtendimentos.aspx.cs" Inherits="SGA.Views.SGA.VAreaAtendimento.ConsultaAreaAtendimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
        <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Áreas cadastradas:
                            </h3>
                        </div>
                        <div class="panel-body" style="overflow-x:auto;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Região</th>
                                        <th>Cidade</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%foreach (var Area in ListaAreaSelect)
                                        {%>
                                        <tr>
                                            <td><a href="ModificarAreaAtendimento.aspx?Id=<%=Area.Id %>"><%=Area.Id %></a></td>
                                            <td><%=Area.Regiao%></td>
                                            <td><%=Area.Cidade %></td>
                                            <td><%=Area.Estado %></td>
                                            <td><a href="InativarAreaAtendimento.aspx?Id=<%=Area.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            Clique no número da área para edita-la.<br />
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

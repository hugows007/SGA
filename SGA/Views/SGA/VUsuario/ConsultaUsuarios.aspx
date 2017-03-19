<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuarios.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.ConsultaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Usuários cadastrados:
                            </h3>
                        </div>
                        <div class="panel-body" style="overflow-x:auto;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Endereço</th>
                                        <th>Número</th>
                                        <th>Cep</th>
                                        <th>Telefone</th>
                                        <th>Perfil</th>
                                        <th>Inativar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%foreach (var a in ListaUsrSelect)
                                        {%>
                                        <tr>
                                            <td><a href="ModificarUsuario.aspx?Id=<%=a.Id %>"><%=a.Id %></a></td>
                                            <td><%=a.Nome%></td>
                                            <td><%=a.Endereco %></td>
                                            <td><%=a.Numero %></td>
                                            <td><%=a.Cep%></td>
                                            <td><%=a.Telefone%></td>
                                            <td><%=a.Regra%></td>
                                            <td><a href="InativarUsuario.aspx?Id=<%=a.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            Clique no número do usuário para edita-lo.<br />
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

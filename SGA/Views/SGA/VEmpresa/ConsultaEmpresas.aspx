<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaEmpresas.aspx.cs" Inherits="SGA.Views.SGA.VEmpresa.ConsultaEmpresas" %>

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
                        Empresas cadastradas
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Empresa</th>
                                    <th>Endereço</th>
                                    <th>Complemento</th>
                                    <th>CEP</th>
                                    <th>Telefone</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Empresa in ListaEmpresaSelect)
                                    {%>
                                <tr>
                                    <td><a href="ModificarEmpresa.aspx?Id=<%=Empresa.Id %>"><%=Empresa.Id %></a></td>
                                    <td><%=Empresa.NomeEmpresa%></td>
                                    <td><%=Empresa.Endereco%></td>
                                    <td><%=Empresa.Complemento%></td>
                                    <td><%=Empresa.Cep%></td>
                                    <td><%=Empresa.Telefone%></td>
                                    <td><a href="InativarEmpresa.aspx?Id=<%=Empresa.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número da empresa para edita-la.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

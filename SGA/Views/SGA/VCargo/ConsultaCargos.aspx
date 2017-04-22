<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaCargos.aspx.cs" Inherits="SGA.Views.SGA.VCargo.ConsultaCargos" %>

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
                        Cargos cadastrados
                        <b><br><asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cargo</th>
                                    <th>Salário</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Cargo in ListaCargoSelect)
                                    {%>
                                <tr>
                                    <td><a href="ModificarCargo.aspx?Id=<%=Cargo.Id %>"><%=Cargo.Id %></a></td>
                                    <td><%=Cargo.NomeCargo%></td>
                                    <td><%=Cargo.Salario %></td>
                                    <td><a href="InativarCargo.aspx?Id=<%=Cargo.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número do cargo para edita-lo.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

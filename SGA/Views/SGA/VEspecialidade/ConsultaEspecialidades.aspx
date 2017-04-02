<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaEspecialidades.aspx.cs" Inherits="SGA.Views.SGA.VEspecialidade.ConsultaEspecialidades" %>

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
                        Especialidades cadastradas
                        <b><br><asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Especialidade</th>
                                    <th>Detalhes da especialidade</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Espec in ListaEspecSelect)
                                    {%>
                                <tr>
                                    <td><a href="ModificarEspecialidade.aspx?Id=<%=Espec.Id %>"><%=Espec.Id %></a></td>
                                    <td><%=Espec.EspecialidadeDesc%></td>
                                    <td><%=Espec.DetalheEspec %></td>
                                    <td><a href="InativarEspecialidade.aspx?Id=<%=Espec.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número da especialidade para edita-la.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

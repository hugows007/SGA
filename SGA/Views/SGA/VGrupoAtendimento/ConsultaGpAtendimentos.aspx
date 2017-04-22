<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaGpAtendimentos.aspx.cs" Inherits="SGA.Views.SGA.VGrupoAtendimento.ConsultaGpsAtendimentos" %>

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
                        Grupos de atendimentos cadastrados
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Grupo</th>
                                    <th>Descrição do grupo</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Grupo in ListaGpSelect)
                                    {%>
                                <tr>
                                    <td><a href="ModificarGpAtendimento.aspx?Id=<%=Grupo.Id %>"><%=Grupo.Id %></a></td>
                                    <td><%=Grupo.NomeGpAtendimento%></td>
                                    <td><%=Grupo.DescGpAtendimento%></td>
                                    <td><a href="InativarGpAtendimento.aspx?Id=<%=Grupo.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número do grupo para edita-lo.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

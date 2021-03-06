﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaRegiaoAtendimentos.aspx.cs" Inherits="SGA.Views.SGA.VRegiaoAtendimento.ConsultaRegiaoAtendimentos" %>

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
                        Regiões cadastradas
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
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Região</th>
                                    <th>Cidade</th>
                                    <th>Estado</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Area in ListaAreaSelect)
                                    {%>
                                <tr>
                                    <td><a href="ModificarRegiaoAtendimento.aspx?Id=<%=Area.Id %>"><%=Area.Id %></a></td>
                                    <td><%=Area.Regiao%></td>
                                    <td><%=Area.Cidade %></td>
                                    <td><%=Area.Estado %></td>
                                    <td><a href="InativarRegiaoAtendimento.aspx?Id=<%=Area.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número da área para edita-la.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

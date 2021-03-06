﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaEspecServ.aspx.cs" Inherits="SGA.Views.SGA.VEspecialidade.ConsultaEspecServ" %>

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
                        Serviços e suas especialidades
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        function Alerta(Texto) {
                            alertify.log(Texto);
                        }
                        $("form").submit(function () {
                            $(this).submit(function () {
                                $(this).find(':submit').prop('disabled', true)
                                return false;
                            });
                            return true;
                        });
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Serviço</th>
                                    <th>Especialidade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var Espec in ListaEspecSelect)
                                    {%>
                                <tr>
                                    <td><%=Espec.Especialidade%></td>
                                    <td><%=Espec.Servico %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

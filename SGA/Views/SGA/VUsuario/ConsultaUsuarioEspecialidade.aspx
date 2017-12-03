<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuarioEspecialidade.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.ConsultaUsuarioEspecialidade" %>
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
                        Usuário e suas especialidades
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
                                    <th>Usuario</th>
                                    <th>Especialidade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var UsrReg in ListaUsrRegiao)
                                    {%>
                                <tr>
                                    <td><%=UsrReg.Nome%></td>
                                    <td><%=UsrReg.Especialidade %></td>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaTipoServicos.aspx.cs" Inherits="SGA.Views.SGA.VTipoServico.ConsultaTipoServicos" %>

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
                        Serviços cadastrados
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        alertify.log("<%=Mensagem%>");
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nome</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  foreach (var Tipo in ListaTpServicoSelect)
                                    {
                                %>
                                <tr>
                                    <td><a href="ModificarTipoServico.aspx?Id=<%=Tipo.Id %>"><%=Tipo.Id %></a></td>
                                    <td><%=Tipo.NomeTipoServ %></td>
                                    <td><a href="InativarTipoServico.aspx?Id=<%=Tipo.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% 
                                    } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número do tipo de serviço para edita-lo.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaServicos.aspx.cs" Inherits="SGA.Views.SGA.VServico.ConsultaServicos" %>

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
                                    <th>Tipo</th>
                                    <th>Nome</th>
                                    <th>Descrição</th>
                                    <th>SLA</th>
                                    <th>Inativar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  int QtdServ = 0;
                                    foreach (var Servico in ListaServicoSelect)
                                    {
                                %>
                                <tr>
                                    <td><a href="ModificarServico.aspx?Id=<%=Servico.Id %>"><%=Servico.Id %></a></td>
                                    <td><%=NomeServico[QtdServ]%></td>
                                    <td><%=Servico.NomeServ %></td>
                                    <td><%=Servico.DescServ %></td>
                                    <td><%=Servico.Sla %></td>
                                    <td><a href="InativarServico.aspx?Id=<%=Servico.Id %>"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                                <% QtdServ += 1;
                                    } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número do Servico para edita-lo.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

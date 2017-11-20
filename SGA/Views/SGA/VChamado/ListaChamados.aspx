<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaChamados.aspx.cs" Inherits="SGA.Views.SGA.VChamado.ListaChamados" %>

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
                        Chamados abertos:
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        function Alerta(Texto) {
                            alertify.log(Texto);
                        }
                    </script>
                    <div class="panel-body">
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Assunto</th>
                                    <th>Descrição</th>
                                    <th>Técnico responsável</th>
                                    <th>Status</th>
                                    <th>Data de abertura</th>
                                    <th>Data de fechamento</th>
                                    <th>Serviço</th>
                                    <%int Qtd = 0;
                                        if ((Session["perfil"]).Equals("Técnico"))
                                        { %>
                                    <th>Atendimento
                                    </th>
                                    <%}
                                        else
                                        { %>
                                    <th></th>
                                    <%} %>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (var Result in ListaChamado)
                                    {%>
                                <tr>
                                    <td><a href="ConsultaChamado.aspx?IdChamado=<%=Result.Id %>"><%=Result.Id %></a></td>
                                    <td><%=Result.Assunto %></td>
                                    <td><%=Result.Descricao %></td>
                                    <th><%=NomeTecnico[Qtd] %></th>
                                    <td><%=NomeStatus[Qtd] %></td>
                                    <td><%=Result.DataAbertura %></td>
                                    <td><%=Result.DataFechamento %></td>
                                    <td><%=NomeServico[Qtd] %></td>
                                    <%if ((Session["perfil"]).Equals("Técnico") && NomeStatus[Qtd].Equals("Aberto") || Session["perfil"].Equals("Técnico") && NomeStatus[Qtd].Equals("Retrabalho"))
                                        { %>
                                    <td>
                                        <a href="/Views/SGA/VAtendimento/IniciaAtendimento.aspx?IdChamado=<%=Result.Id %>&StatusChamado=<%=NomeStatus[Qtd] %>" class="btn btn-success">Iniciar atendimento
                                        </a>
                                    </td>
                                    <%}
                                        else
                                        {%>
                                    <td></td>
                                    <%}  %>
                                </tr>
                                <% Qtd += 1;
                                    } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        Clique no número do chamado para ve-lo em detalhe<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaChamados.aspx.cs" Inherits="SGA.Views.SGA.VChamado.ListaChamados" %>

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
                        Chamados abertos:
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
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
                                    <td>
                                        <%if ((Session["perfil"]).Equals("Técnico") && NomeStatus[Qtd].Equals("Aberto") || NomeStatus[Qtd].Equals("Retrabalho"))
                                            { %>

                                        <a href="/Views/SGA/VAtendimento/IniciaAtendimento.aspx?IdChamado=<%=Result.Id %>&StatusChamado=<%=NomeStatus[Qtd] %>">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </a>

                                        <%} %>
                                    </td>
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

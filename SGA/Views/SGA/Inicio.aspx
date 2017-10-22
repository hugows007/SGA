﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SGA.Views.Site.Inicio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <script>
        <% int Contador = 1;%>
        var locations = [
        <%foreach (var Lista in ListaGeo)
        {%>

     ['<%=Lista.NomeUsuario%>', <%=Lista.Latitude%>, <%=Lista.Longitude%>, <%=Contador%>],

        <% Contador++;
        }%>];
    </script>
    <meta http-equiv="refresh" content="30">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-briefcase fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=ObjRelatorio.QtdChamadosAber%></div>
                                <div>Aberto(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-flag-checkered  fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=ObjRelatorio.QtdChamadosConc%></div>
                                <div>Concluído(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-gears fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=ObjRelatorio.QtdChamadosEmAnd%></div>
                                <div>Em andamento(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-flag-o fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=ObjRelatorio.QtdChamadosRetra%></div>
                                <div>Retrabalho(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-lock fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=ObjRelatorio.QtdChamadosCanc%></div>
                                <div>Cancelado(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Chamados - Mês: <%=DateTime.Now.ToString("MMMM") %>
                    </div>
                    <div class="panel-body">
                        <div id="donut-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Chamados - Ano: <%=DateTime.Now.Year %>
                    </div>
                    <div class="panel-body">
                        <div id="bar-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-star fa-fw"></i>Ranking de técnicos
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <%foreach (var Lista in ListAtend)
                                        { %>
                                    <thead>
                                        <tr class="success">
                                            <th></th>
                                            <th>Técnico</th>
                                            <th>Média</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="success">
                                            <td>
                                                <img src="<%# ResolveClientUrl("~/Image/Estrela.png") %>" /></td>
                                            <td><%=Lista.Usuario %></td>
                                            <td><%=Lista.Media %></td>
                                        </tr>
                                    </tbody>
                                    <%} %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-map-marker fa-fw"></i>Técnicos em campo
                        </div>
                        <div class="panel-body google-maps" id="map">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        Morris.Donut({
            element: 'donut-chart',
            data: [
              { label: "Concluídos", value: <%=ObjRelatorioDonut.QtdChamadosConc %> },
              { label: "Em andamentos", value: <%=ObjRelatorioDonut.QtdChamadosEmAnd %> },
              { label: "Retrabalhos", value: <%=ObjRelatorioDonut.QtdChamadosRetra %> },
              { label: "Cancelados", value: <%=ObjRelatorioDonut.QtdChamadosCanc %> },
              { label: "Abertos", value: <%=ObjRelatorioDonut.QtdChamadosAber %> }
            ]
        });
        Morris.Bar({
            element: 'bar-chart',
            data: [
                <%foreach (var Lista in ListRelat)
            if (Lista.Mes != null)
            {
                {%>
              { y: '<%=Lista.Mes%>', a: <%=Lista.QtdChamadosAber%>, b: <%=Lista.QtdChamadosConc%> },
        <%}
            }%>
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Abertos', 'Fechados']
        });
    </script>
</asp:Content>

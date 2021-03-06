﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SGA.Views.Site.Inicio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <%if (Session["perfil"].Equals("Administrador") || Session["perfil"].Equals("Gestor"))
        { %>
    <script> 
        google.maps.event.addDomListener(window, 'load', init);
        var map, markersArray = [];

        function bindInfoWindow(marker, map, location) {
            google.maps.event.addListener(marker, 'click', function() {
                function close(location) {
                    location.ib.close();
                    location.infoWindowVisible = false;
                    location.ib = null;
                }

                if (location.infoWindowVisible === true) {
                    close(location);
                } else {
                    markersArray.forEach(function(loc, index){
                        if (loc.ib && loc.ib !== null) {
                            close(loc);
                        }
                    });

                    var boxText = document.createElement('div');
                    boxText.style.cssText = 'background: #fff;';
                    boxText.classList.add('md-whiteframe-2dp');

                    function buildPieces(location, el, part, icon) {
                        if (location[part] === '') {
                            return '';
                        } else if (location.iw[part]) {
                            switch(el){
                                case 'photo':
                                    if (location.photo){
                                        return '<div class="iw-photo" style="background-image: url(' + location.photo + ');"></div>';
                                    } else {
                                        return '';
                                    }
                                    break;
                                case 'iw-toolbar':
                                    return '<div class="iw-toolbar"><h3 class="md-subhead">' + location.title + '</h3></div>';
                                    break;
                                case 'div':
                                    switch(part){
                                        case 'email':
                                            return '<div class="iw-details"><i class="material-icons" style="color:#4285f4;"><img src="//cdn.mapkit.io/v1/icons/' + icon + '.svg"/></i><span><a href="mailto:' + location.email + '" target="_blank">' + location.email + '</a></span></div>';
                                            break;
                                        case 'web':
                                            return '<div class="iw-details"><i class="material-icons" style="color:#4285f4;"><img src="//cdn.mapkit.io/v1/icons/' + icon + '.svg"/></i><span><a href="' + location.web + '" target="_blank">' + location.web_formatted + '</a></span></div>';
                                            break;
                                        case 'desc':
                                            return '<label class="iw-desc" for="cb_details"><input type="checkbox" id="cb_details"/><h3 class="iw-x-details">Details</h3><i class="material-icons toggle-open-details"><img src="//cdn.mapkit.io/v1/icons/' + icon + '.svg"/></i><p class="iw-x-details">' + location.desc + '</p></label>';
                                            break;
                                        default:
                                            return '<div class="iw-details"><i class="material-icons"><img src="//cdn.mapkit.io/v1/icons/' + icon + '.svg"/></i><span>' + location[part] + '</span></div>';
                                            break;
                                    }
                                    break;
                                case 'open_hours':
                                    var items = '';
                                    if (location.open_hours.length > 0){
                                        for (var i = 0; i < location.open_hours.length; ++i) {
                                            if (i !== 0){
                                                items += '<li><strong>' + location.open_hours[i].day + '</strong><strong>' + location.open_hours[i].hours +'</strong></li>';
                                            }
                                            var first = '<li><label for="cb_hours"><input type="checkbox" id="cb_hours"/><strong>' + location.open_hours[0].day + '</strong><strong>' + location.open_hours[0].hours +'</strong><i class="material-icons toggle-open-hours"><img src="//cdn.mapkit.io/v1/icons/keyboard_arrow_down.svg"/></i><ul>' + items + '</ul></label></li>';
                                        }
                                        return '<div class="iw-list"><i class="material-icons first-material-icons" style="color:#4285f4;"><img src="//cdn.mapkit.io/v1/icons/' + icon + '.svg"/></i><ul>' + first + '</ul></div>';
                                    } else {
                                        return '';
                                    }
                                    break;
                            }
                        } else {
                            return '';
                        }
                    }

                    boxText.innerHTML = 
                        buildPieces(location, 'photo', 'photo', '') +
                        buildPieces(location, 'iw-toolbar', 'title', '') +
                        buildPieces(location, 'div', 'address', 'location_on') +
                        buildPieces(location, 'div', 'web', 'public') +
                        buildPieces(location, 'div', 'email', 'email') +
                        buildPieces(location, 'div', 'tel', 'phone') +
                        buildPieces(location, 'div', 'int_tel', 'phone') +
                        buildPieces(location, 'open_hours', 'open_hours', 'access_time') +
                        buildPieces(location, 'div', 'desc', 'keyboard_arrow_down');

                    var myOptions = {
                        alignBottom: true,
                        content: boxText,
                        disableAutoPan: true,
                        maxWidth: 0,
                        pixelOffset: new google.maps.Size(-140, -40),
                        zIndex: null,
                        boxStyle: {
                            opacity: 1,
                            width: '280px'
                        },
                        closeBoxMargin: '0px 0px 0px 0px',
                        infoBoxClearance: new google.maps.Size(1, 1),
                        isHidden: false,
                        pane: 'floatPane',
                        enableEventPropagation: false
                    };

                    location.ib = new InfoBox(myOptions);
                    location.ib.open(map, marker);
                    location.infoWindowVisible = true;
                }
            });
        }

        function init() {
            var mapOptions = {
                center: new google.maps.LatLng(-22.90864599436547,-43.170069586694325),
                zoom: 11,
                gestureHandling: 'auto',
                fullscreenControl: true,
                zoomControl: true,
                disableDoubleClickZoom: true,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                },
                scaleControl: true,
                scrollwheel: true,
                streetViewControl: true,
                draggable : true,
                clickableIcons: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                styles: [{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#C6E2FF"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#C5E3BF"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#D1D1B8"}]}]
            }
            var mapElement = document.getElementById('mapnew');
            var map = new google.maps.Map(mapElement, mapOptions);
            var locations = [
                <%foreach (var Lista in ListaGeo)
        {%>
                {"title":"<%=Lista.NomeUsuario%>","address":"","desc":"Ultimo contato: <%=Lista.Data%>","tel":"","int_tel":"","email":"","web":"","web_formatted":"","open":"","time":"","lat":<%=Lista.Latitude%>,"lng":<%=Lista.Longitude%>,"vicinity":"Brazil","open_hours":"","marker":{"fillColor":"#F44336","fillOpacity":1,"strokeWeight":0,"scale":1.5,"path":"M10.2,2.5v4.2c0,0,0,0,0,0L10.2,2.5c-6,0-10.9,4.9-10.9,10.9s10.9,23.8,10.9,23.8v0c0,0,10.9-17.8,10.9-23.8 S16.2,2.5,10.2,2.5z M10.2,17.9c-2.5,0-4.6-2.1-4.6-4.6s2.1-4.6,4.6-4.6s4.6,2.1,4.6,4.6S12.8,17.9,10.2,17.9z M16.8,14.1 c0-0.2,0-0.3,0-0.5C16.9,13.8,16.9,14,16.8,14.1z","anchor":{"x":10,"y":30},"origin":{"x":0,"y":0},"style":0},"iw":{"address":true,"desc":true,"email":true,"enable":true,"int_tel":true,"open":true,"open_hours":true,"photo":true,"tel":true,"title":true,"web":true}},

        <%}%>
            ];
            for (i = 0; i < locations.length; i++) {
                marker = new google.maps.Marker({
                    icon: locations[i].marker,
                    position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                    map: map,
                    title: locations[i].title,
                    address: locations[i].address,
                    desc: locations[i].desc,
                    tel: locations[i].tel,
                    int_tel: locations[i].int_tel,
                    vicinity: locations[i].vicinity,
                    open: locations[i].open,
                    open_hours: locations[i].open_hours,
                    photo: locations[i].photo,
                    time: locations[i].time,
                    email: locations[i].email,
                    web: locations[i].web,
                    iw: locations[i].iw
                });
                markersArray.push(marker);

                if (locations[i].iw.enable === true){
                    bindInfoWindow(marker, map, locations[i]);
                }
            }
        }
    </script>
    <meta http-equiv="refresh" content="30">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
                <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-6">
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Serviços mais requisitados
                    </div>
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="flot-pie-chart"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i>Tempo médio de conclusão de um atendimento
                    </div>
                    <div class="panel-body">
                        <div id="body" class="container-fluid">
                            <div id="div1">
                                <p id="time"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-map-marker fa-fw"></i>Atendimentos por região
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Região</th>
                                        <th>Quantidade</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%foreach (var Lista in ListRegiao)
                                        { %>
                                    <tr>
                                        <td><%=Lista.Regiao %></td>
                                        <td><%=Lista.Media %></td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-star fa-fw"></i>Ranking de avaliações
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="success">
                                            <th></th>
                                            <th>Técnico</th>
                                            <th>Média</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%foreach (var Lista in ListTopAtend)
                                            { %>
                                        <tr class="success">
                                            <td>
                                                <img src="<%# ResolveClientUrl("~/Image/Estrela.png") %>" /></td>
                                            <td><%=Lista.Usuario %></td>
                                            <td><%=Lista.Media %></td>
                                        </tr>
                                        <%} %>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-star fa-fw"></i>Ranking de tempo de atendimento
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr class="success">
                                        <th>Chamado</th>
                                        <th>Técnico</th>
                                        <th>Tempo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%foreach (var Lista in ListTopTempo)
                                        { %>
                                    <tr class="success">
                                        <td><%=Lista.Chamado %></td>
                                        <td><%=Lista.Tecnico %></td>
                                        <td><%=String.Format("{0:%d} dia(s), ", Lista.TempoAtendimento) + new DateTime(Lista.TempoAtendimento.Ticks).ToString("HH:mm:ss")%> </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-star fa-fw"></i>Ranking de soluções técnicas
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="success">
                                            <th>Técnico</th>
                                            <th>Soluções úteis</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%foreach (var Lista in ListTopSoluc)
                                            { %>
                                        <tr class="success">
                                            <td><%=Lista.Usuario %></td>
                                            <td><%=Lista.Media %></td>
                                        </tr>
                                        <%} %>
                                    </tbody>

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
                        <div class="panel-body google-maps" id="mapnew"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.setInterval(ut, 1000);

        function ut() {
            document.getElementById("time").innerHTML = "<%=ObjRelatorioTempoMedio.TempoAtendimento.ToString(@"hh\:mm")%>"
        }

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
        $(function() {

            var data = [
         <%foreach (var List in ListServico)
        {%>
                {
                    label: "<%=List.Servico%>",
                    data: <%=List.Media%>
                    },
                            <%}%>];

            var plotObj = $.plot($("#flot-pie-chart"), data, {
                series: {
                    pie: {
                        show: true
                    }
                },
                grid: {
                    hoverable: true
                },
                tooltip: true,
                tooltipOpts: {
                    content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                    shifts: {
                        x: 20,
                        y: 0
                    },
                    defaultTheme: false
                }
            });

        });
    </script>
    <%}
        else
        { %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Início</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <br />
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="col-lg-4">
                            <br />
                            <center><img style="max-width: 100%; height: auto;" src="<%# ResolveClientUrl("~/Image/Logo.jpeg") %>" alt=""></center>
                        </div>
                        <div class="col-lg-8">
                            <h3>Olá, <%=Session["nome"].ToString()%>, seja muito bem-vindo ao SGA TI - Sistema de Gestão de Atendimento em Tecnologia da informação.</h3>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Navegue através dos menus a sua esquerda.
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

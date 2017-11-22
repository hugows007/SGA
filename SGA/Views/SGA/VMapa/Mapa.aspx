<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Mapa.aspx.cs" Inherits="SGA.Views.SGA.VMapa.Mapa" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <script>
        google.maps.event.addDomListener(window, 'load', init);
        var map, markersArray = [];

        function bindInfoWindow(marker, map, location) {
            google.maps.event.addListener(marker, 'click', function () {
                function close(location) {
                    location.ib.close();
                    location.infoWindowVisible = false;
                    location.ib = null;
                }

                if (location.infoWindowVisible === true) {
                    close(location);
                } else {
                    markersArray.forEach(function (loc, index) {
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
                            switch (el) {
                                case 'photo':
                                    if (location.photo) {
                                        return '<div class="iw-photo" style="background-image: url(' + location.photo + ');"></div>';
                                    } else {
                                        return '';
                                    }
                                    break;
                                case 'iw-toolbar':
                                    return '<div class="iw-toolbar"><h3 class="md-subhead">' + location.title + '</h3></div>';
                                    break;
                                case 'div':
                                    switch (part) {
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
                                    if (location.open_hours.length > 0) {
                                        for (var i = 0; i < location.open_hours.length; ++i) {
                                            if (i !== 0) {
                                                items += '<li><strong>' + location.open_hours[i].day + '</strong><strong>' + location.open_hours[i].hours + '</strong></li>';
                                            }
                                            var first = '<li><label for="cb_hours"><input type="checkbox" id="cb_hours"/><strong>' + location.open_hours[0].day + '</strong><strong>' + location.open_hours[0].hours + '</strong><i class="material-icons toggle-open-hours"><img src="//cdn.mapkit.io/v1/icons/keyboard_arrow_down.svg"/></i><ul>' + items + '</ul></label></li>';
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
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;

            var mapOptions = {
                center: new google.maps.LatLng(-22.81416198339641, -43.15796003125001),
                zoom: 10,
                gestureHandling: 'auto',
                fullscreenControl: false,
                zoomControl: true,
                disableDoubleClickZoom: true,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                },
                scaleControl: true,
                scrollwheel: true,
                streetViewControl: true,
                draggable: true,
                clickableIcons: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            var mapElement = document.getElementById('mapnew1');
            var map = new google.maps.Map(mapElement, mapOptions);
                <%if (!ObjGeoCliente.Id.Equals(0))
        {%>
            directionsDisplay.setMap(map);
            directionsDisplay.setOptions({ suppressMarkers: true });

            calculateAndDisplayRoute(directionsService, directionsDisplay);
            document.getElementById('mode').addEventListener('change', function () {
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            });
            <%}%>

            var locations = [
                {"title":"<%=ObjGeo.NomeUsuario%>","address":"","desc":"Endereço: <%=ObjGeo.Endereco%>","tel":"","int_tel":"","email":"","web":"","web_formatted":"","open":"","time":"","lat":<%=ObjGeo.Latitude%>,"lng":<%=ObjGeo.Longitude%>,"vicinity":"Brazil","open_hours":"","marker":{"fillColor":"#F44336","fillOpacity":1,"strokeWeight":0,"scale":1.5,"path":"M10.2,2.5v4.2c0,0,0,0,0,0L10.2,2.5c-6,0-10.9,4.9-10.9,10.9s10.9,23.8,10.9,23.8v0c0,0,10.9-17.8,10.9-23.8 S16.2,2.5,10.2,2.5z M10.2,17.9c-2.5,0-4.6-2.1-4.6-4.6s2.1-4.6,4.6-4.6s4.6,2.1,4.6,4.6S12.8,17.9,10.2,17.9z M16.8,14.1 c0-0.2,0-0.3,0-0.5C16.9,13.8,16.9,14,16.8,14.1z","anchor":{"x":10,"y":30},"origin":{"x":0,"y":0},"style":0},"iw":{"address":true,"desc":true,"email":true,"enable":true,"int_tel":true,"open":true,"open_hours":true,"photo":true,"tel":true,"title":true,"web":true}}
                <%if (!ObjGeoCliente.Id.Equals(0))
        {%>
                ,{"title":"<%=ObjGeoCliente.NomeUsuario%>","address":"","desc":" <%=ObjGeoCliente.Endereco%>","tel":"","int_tel":"","email":"","web":"","web_formatted":"","open":"","time":"","lat":<%=ObjGeoCliente.Latitude%>,"lng":<%=ObjGeoCliente.Longitude%>,"vicinity":"Brazil","open_hours":"","marker":{"fillColor":"#F44336","fillOpacity":1,"strokeWeight":0,"scale":1.5,"path":"M10.2,2.5v4.2c0,0,0,0,0,0L10.2,2.5c-6,0-10.9,4.9-10.9,10.9s10.9,23.8,10.9,23.8v0c0,0,10.9-17.8,10.9-23.8 S16.2,2.5,10.2,2.5z M10.2,17.9c-2.5,0-4.6-2.1-4.6-4.6s2.1-4.6,4.6-4.6s4.6,2.1,4.6,4.6S12.8,17.9,10.2,17.9z M16.8,14.1 c0-0.2,0-0.3,0-0.5C16.9,13.8,16.9,14,16.8,14.1z","anchor":{"x":10,"y":30},"origin":{"x":0,"y":0},"style":0},"iw":{"address":true,"desc":true,"email":true,"enable":true,"int_tel":true,"open":true,"open_hours":true,"photo":true,"tel":true,"title":true,"web":true}}
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

                if (locations[i].iw.enable === true) {
                    bindInfoWindow(marker, map, locations[i]);
                }
            }
        }

                        <%if (!ObjGeoCliente.Id.Equals(0))
        {%>
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            var selectedMode = document.getElementById('mode').value;
            directionsService.route({
                origin: { lat: <%=ObjGeo.Latitude%>, lng: <%=ObjGeo.Longitude%> },  
                destination: { lat: <%=ObjGeoCliente.Latitude%>, lng: <%=ObjGeoCliente.Longitude%> },
                travelMode: google.maps.TravelMode[selectedMode]
            }, function (response, status) {
                if (status == 'OK') {
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
        <%}%>
    </script>
    <meta http-equiv="refresh" content="30">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Mapa</h1>
                <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a><br />
                <br />
                <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
            </div>
            <script>
                function Alerta(Texto) {
                    alertify.log(Texto);
                }
            </script>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-map-marker fa-fw"></i>Localização:
                                            <div id="floating-panel">
                                                <b>Modo de viagem: </b>
                                                <select id="mode">
                                                    <option value="DRIVING">Carro</option>
                                                    <option value="TRANSIT">Transporte público</option>
                                                </select>
                                            </div>
                        </div>
                        <div class="panel-body google-maps" id="mapnew1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

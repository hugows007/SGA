<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ChatPrivado.aspx.cs" Inherits="SGA.Views.SGA.VChat.ChatPrivado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
    <script type="text/javascript">
        $(function () {
            // Declar um proxy para referenciar o  hub. 
            var chat = $.connection.ChatOnlineHub;
            // Cria a função que o run pode chamar para mensagens de broadcast
            chat.client.broadcastMessage = function (nome, mensagem) {
                // Html encode exibe o nome e mensagem
                var encodednome = $('<div />').text(nome).html();
                var encodedMsg = $('<div />').text(mensagem).html();
                // Adiciona a mensagem na pagina
                $('#discussion').append('<li><strong>' + encodednome
                    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
            };
            // Pega o nome do usuário e armazena 
            $('#exibenome').val('<%=Membership.GetUser()%>');
            // Define o focus inicial para a caixa de mensagem
            $('#MensagemChat').focus();
            // Inicia a conexão
            $.connection.hub.start().done(function () {
                $('#EnviarMensagem').click(function () {
                    // Chama o método Send no  hub. 
                    chat.server.sendPrivado($('#exibenome').val(), $('#MensagemChat').val(), '<%=IdPrivado%>');
                    // Limpa o textbox e reseta o focus para o proximo comentario
                    $('#MensagemChat').val('').focus();
                });
            });
        });

        conterstart = 1;
        function checa(counter) {
            cont = conterstart;
            if (cont == counter) {
                block = document.getElementById("mensagens");
                block.style.display = "block";
                conterstart = 1;
            } else {
                block = document.getElementById("mensagens");
                block.style.display = "none";
                conterstart = 0;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">

    <!-- Chat -->
    <link href="<%= ResolveClientUrl("~/Content/chat/style.css") %>" rel="stylesheet" />
    <script src="<%= ResolveClientUrl("~/Scripts/chat/index.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Scripts/chat/index.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Scripts/jquery.signalR-2.2.2.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/signalr/hubs")%>"></script>

    <link href="<%= ResolveClientUrl("~/Content/chat/styleP.css") %>" rel="stylesheet" />

    <div id="page-wrapper">
        <div class="row">
        </div>
        <div class="panel panel-default w3-container">
            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                <div class="chat">
                    <div class="chat-header clearfix w3-container w3-half">
                        <img src="<%= ResolveClientUrl("~/Image/Chat.png") %>" alt="avatar" />
                        <div class="chat-about">
                            <div class="chat-with">Chat Privado</div>
                            <div class="chat-num-messages">Conversas</div>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                        <div class="message-data align-right clearfix">
                        </div>
                    </div>
                    <div class="chat-history">
                        <%if (!ConversaIniciada)
                            {
                                foreach (var Salas in ListaSalas)
                                {%>
                        <table class="table table-filter">
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="/Views/SGA/VChat/ChatPrivado.aspx?Conversa=<%=Salas.ObjChatPrivado.IdPrivado%>" class="pull-left">
                                            <div class="media w3-container w3-half">

                                                <img src="<%= ResolveClientUrl("~/Image/User.png") %>" class="media-photo  pull-left">
                                                <div class="w3-container w3-half pull-right">
                                                    <h4 class="title"><%=Salas.ObjChatPrivado.NomeDest%></h4>
                                                </div>
                                            </div>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%}
                            } %>
                        <%if (ConversaIniciada)
                            {
                        %>
                        <div class="message-data">
                            <a class="btn btn-info btn-lg" onclick="checa(0)" style="float: right">Visualizar/Ocultar</a>
                            <span class="message-data-time">Mensagens anteriores: </span>
                            <br />
                            <br />
                            <br />
                        </div>
                        <div id="mensagens" class="message my-message w3-container w3-half">
                            <%foreach (var Lista in ListaMensagens)
                                { %>
                            <span><b><%=Lista.Usuario%></b>: <%=Lista.Mensagem%> <i style="color: Gray"><strong>&nbsp;&nbsp;&nbsp;&nbsp; Enviada em: <%=Lista.DataMensagem%></strong></i> </span>
                            <br />
                            <%}%>
                        </div>
                        <div class="message-data align-right clearfix">
                            <span class="message-data-time">Você entrou nesta conversa em: </span>
                            <span class="message-data-name"><%=DateTime.Now%></span>
                        </div>
                        <div class="message other-message float-right" id="discussion">
                            <span id="exibenome"></span>
                        </div>
                    </div>
                    <div class="chat-message clearfix w3-container w3-half">
                        <textarea name="message-to-send" id="MensagemChat" placeholder="Digite sua mensagem..." rows="3"></textarea>
                        <input type="button" id="EnviarMensagem" value="Enviar..." class="btn" />
                    </div>
                    <%}
                        if (ChatCriado)
                        { %>
                    <script>
                        alertify.log("Conversa iniciada e técnico informado.");
                    </script>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

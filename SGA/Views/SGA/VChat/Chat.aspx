<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="SGA.Views.SGA.VChat.Chat" %>

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
                    chat.server.send($('#exibenome').val(), $('#MensagemChat').val());
                    // Limpa o textbox e reseta o focus para o proximo comentario
                    $('#MensagemChat').val('').focus();
                });
                $('#ButtonEntrar').click(function () {
                    // Chama o método Send no  hub. 
                    chat.server.send($('').val(), $('#MensagemChat').val());
                    // Limpa o textbox e reseta o focus para o proximo comentario
                    $('').val('').focus();
                });
                $('#ButtonSair').click(function () {
                    $('#MensagemChat').val('Sair');
                    // Chama o método Send no  hub. 
                    chat.server.send($('').val(), $('#MensagemChat').val());
                    // Limpa o textbox e reseta o focus para o proximo comentario
                    $('').val('').focus();
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

        $("form").submit(function () {
            $(this).submit(function () {
                $(this).find(':submit').prop('disabled', true);
                return false;
            });
            return true;
        });
    </script>

    <!-- Chat -->
    <link href="<%= ResolveClientUrl("~/Content/chat/style.css") %>" rel="stylesheet" />
    <script src="<%= ResolveClientUrl("~/Scripts/chat/index.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Scripts/chat/index.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Scripts/jquery.signalR-2.2.2.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/signalr/hubs")%>"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">

    <div id="page-wrapper">
        <div class="row">
        </div>
        <div class="panel panel-default w3-container">
            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                <div class="chat">
                    <div class="chat-header clearfix w3-container w3-half">
                        <img src="<%= ResolveClientUrl("~/Image/Chat.png") %>" alt="avatar" />
                        <div class="chat-about">
                            <div class="chat-with">Chat Técnico</div>
                            <div class="chat-num-messages">Mensagens</div>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                        <div class="message-data align-right clearfix">
                            <%if (!EntrarChat)
                                { %>
                            <asp:Button ID="ButtonEntrar" runat="server" Text="Entrar" ClientIDMode="Static" CssClass="btn btn-success btn-lg" OnClick="ButtonEntrar_Click"  />
                            <%}
                                else
                                {
                            %>
                            <asp:Button ID="ButtonSair" runat="server" Text="Sair" ClientIDMode="Static" CssClass="btn btn-warning btn-lg" OnClick="ButtonSair_Click"  />
                            <%} %>
                            <asp:Button ID="ButtonConversas" runat="server" Text="Conversas" CssClass="btn btn-info btn-lg" OnClick="ButtonConversas_Click"  />
                            <asp:Button ID="ButtonConvocar" runat="server" Text="Convocar Equipe" CssClass="btn btn-info btn-lg" OnClick="ButtonConvocar_Click"  />
                            <asp:Button ID="ButtonChamar" runat="server" ClientIDMode="Static" Text="Conversa privada" CssClass="btn btn-info btn-lg" OnClick="ButtonChamar_Click"  />
                        </div>
                    </div>

                    <%if (!ChamarTecnico && EntrarChat)
                        { %>
                    <div class="chat-history">
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
                            <span class="message-data-time">Você entrou na conversa em: </span>
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
                    <% }
                        else if (ChamarTecnico)
                        {%>
                    <div class="chat-history">
                        <div class="form-group">
                            <label for="ListaTecnicos">Selecione o técnico para iniciar:</label><br />
                            <select class="form-control" id="ListaTecnicos" name="Tecnico" onchange="location = this.value;">
                                <option>Clique aqui</option>
                                <%foreach (var Lista in ListaUsuario)
                                    {
                                %>
                                <option value="/Views/SGA/VChat/ChatPrivado.aspx?Chat=<%=(string)(Session["idms"])%>!<%=Lista.IdMS%>"><%=Lista.Login%></option>
                                <%} %>
                            </select>
                            <br />
                        </div>
                    </div>
                    <%}
                        if (NotificaTecnicos)
                        { %>
                    <script>
                        alertify.log("Técnicos e Gestores notificados");
                    </script>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

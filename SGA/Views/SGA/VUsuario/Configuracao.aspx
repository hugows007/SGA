<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Configuracao.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.Configuracao" ClientIDMode="Static" %>

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
                        Meus dados de cadastro
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        alertify.log("<%=Mensagem%>");
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <%if (!TrocarSenha)
                                { %>
                            <div class="form-group">
                                <label for="Nome" class="control-label">Nome:</label>
                                <input type="text" id="Nome" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Endereco" class="control-label">Endereço:</label>
                                <input type="text" id="Endereco" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Complemento" class="control-label">Complemento:</label>
                                <input type="text" id="Complemento" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="CEP" class="control-label">CEP:</label>
                                <input type="text" id="CEP" required class="form-control input-sm" runat="server" maxlength="11" placeholder="Máximo de 11 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Telefone" class="control-label">Telefone:</label>
                                <input type="tel" id="Telefone" required class="form-control input-sm" runat="server" maxlength="10" placeholder="Máximo de 10 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Email" class="control-label">E-mail:</label>
                                <input type="email" id="Email" required class="form-control input-sm" runat="server" maxlength="30" placeholder="Máximo de 30 caracteres" />
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Modificar informações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <asp:Button ID="SenhaAlterarButton" runat="server" Text="Trocar senha" class="btn btn-default" OnClick="SenhaAlterarButton_Click" />
                            <%}
                                else
                                { %>
                            <div class="form-group">
                                <label for="Senha" class="control-label">Digite uma nova senha:</label>
                                <input type="password" id="Senha" required class="form-control input-sm" runat="server" maxlength="15" minlength="8" placeholder="Mínimo de 8 e máximo de 15 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="SenhaConfirm" class="control-label">Repita a senha:</label>
                                <input type="password" id="SenhaConfirm" required class="form-control input-sm" runat="server" maxlength="15" minlength="8" placeholder="Mínimo de 8 e máximo de 15 caracteres" />
                            </div>
                            <asp:Button ID="SalvarSenhaButton" runat="server" Text="Salvar Senha" class="btn btn-default" OnClick="SalvarSenhaButton_Click" />
                            <%} %>
                            <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Favor alterar os campos e clicar em salvar.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var password = document.getElementById("Senha"), confirm_password = document.getElementById("SenhaConfirm");

        function validatePassword() {
            if (password.value != confirm_password.value) {
                confirm_password.setCustomValidity("A senha digitada não confere.");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    </script>
</asp:Content>

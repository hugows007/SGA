<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Configuracao.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.Configuracao" %>

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
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <%if (!TrocarSenha)
                                { %>
                            <div class="form-group">
                                <label for="NomeTextBox" class="control-label">Nome:</label>
                                <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="EndTextBox" class="control-label">Endereço:</label>
                                <asp:TextBox ID="EndTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="NumTextBox" class="control-label">Complemento:</label>
                                <asp:TextBox ID="NumTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="CEPTextBox" class="control-label">CEP:</label>
                                <asp:TextBox ID="CEPTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="TelTextBox" class="control-label">Telefone:</label>
                                <asp:TextBox ID="TelTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="EmailTextBox" class="control-label">E-mail:</label>
                                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Modificar informações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <asp:Button ID="SenhaAlterarButton" runat="server" Text="Trocar senha" class="btn btn-default" OnClick="SenhaAlterarButton_Click" />
                            <%}
                                else
                                { %>
                            <div class="form-group">
                                <label for="SenhaTextBox" class="control-label">Digite uma nova senha:</label>
                                <asp:TextBox ID="SenhaTextBox" runat="server" TextMode="Password" ClientIDMode="Static" CssClass="form-control input-sm" minlength="8" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="ConfirmacaoTextBox" class="control-label">Repita a senha:</label>
                                <asp:TextBox ID="ConfirmacaoTextBox" runat="server" TextMode="Password" ClientIDMode="Static" CssClass="form-control input-sm" minlength="8" required="required"></asp:TextBox>
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
        var password = document.getElementById("SenhaTextBox"), confirm_password = document.getElementById("ConfirmacaoTextBox");

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

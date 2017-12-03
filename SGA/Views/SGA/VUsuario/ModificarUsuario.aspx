<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.ModificarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
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
                        Usuário do sistema
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        function Alerta(Texto) {
                            alertify.log(Texto);
                        }
                        $("form").submit(function () {
                            $(this).submit(function () {
                                $(this).find(':submit').prop('disabled', true)
                                return false;
                            });
                            return true;
                        });
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
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
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" CssClass="btn btn-default" OnClick="AlterarButton_Click"  />
                            <asp:Button ID="Ausente" runat="server" CssClass="btn btn-default" OnClick="Ausente_Click"/>
                            <a class="btn btn-default" onclick="location.href = document.referrer; return false;">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Favor alterar os campos e clicar em salvar.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

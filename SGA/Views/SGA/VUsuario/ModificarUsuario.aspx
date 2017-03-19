<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.ModificarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
 <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Usuário selecionado:</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="NomeTextBox" class="control-label">Nome:</label>
                                <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="EndTextBox" class="control-label">Endereço:</label>
                                <asp:TextBox ID="EndTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="NumTextBox" class="control-label">Número:</label>
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
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/VUsuario/ConsultaUsuarios.aspx">Cancelar</a>
                        </div>
                        <div class="panel-footer">Favor alterar os campos e clicar em salvar.<br />
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

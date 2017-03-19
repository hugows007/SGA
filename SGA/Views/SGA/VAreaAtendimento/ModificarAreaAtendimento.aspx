<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarAreaAtendimento.aspx.cs" Inherits="SGA.Views.SGA.VAreaAtendimento.ModificarAreaAtendimento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Área selecionada:</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="RegiaoTextBox" class="control-label">Região:</label>    
                                <asp:TextBox ID="RegiaoTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="CidadeTextBox" class="control-label">Cidade:</label>
                                <asp:TextBox ID="CidadeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="EstadoTextBox" class="control-label">Estado:</label>
                                <asp:TextBox ID="EstadoTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/Inicio.aspx">Cancelar</a>
                        </div>
                        <div class="panel-footer">Favor alterar os campos e clicar em salvar alterações.<br />
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

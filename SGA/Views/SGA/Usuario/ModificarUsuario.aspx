﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SGA.Views.SGA.Usuario.ModificarUsuario" %>

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
                                Nome:
                                <asp:Label ID="NomeLabel" runat="server" Text="Nome" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                Endereço:
                                <asp:Label ID="EndLabel" runat="server" Text="Endereço" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="EndTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                Número:
                                <asp:Label ID="NumLabel" runat="server" Text="Número" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="NumTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                CEP:
                                <asp:Label ID="CEPLabel" runat="server" Text="CEP" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="CEPTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                Telefone:
                                <asp:Label ID="TelLabel" runat="server" Text="Telefone" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="TelTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/Usuario/ConsultaUsuarios.aspx">Cancelar</a>
                        </div>
                        <div class="panel-footer">Favor alterar os campos e clicar em salvar.<br />
                            <asp:Label ID="MsgLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
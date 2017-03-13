<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGA.Login" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadLogin" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Bem vindo ao SGA!</h3>
                        </div>
                        <div class="panel-body">
                            <p class="text-center">Favor inserir seu usuário e senha para se autenticar no sistema</p>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="inputEmail3" class="control-label">Usuário</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="TxtLogin" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="inputPassword3" class="control-label">Senha</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="TxtSenha" runat="server" TextMode="Password" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <asp:Button ID="BotaoEntrar" Text="Entrar" OnClick="BotaoEntrar_Click" runat="server" class="btn btn-default" />
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

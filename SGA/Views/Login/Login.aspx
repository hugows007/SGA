<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGA.Login" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">
    <div class="container">
        <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <center><img src="<%= ResolveClientUrl("~/Image/Logo.jpeg") %>"/></center>
            <br />
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Bem-vindo! Favor efetuar o login</div>
                </div>
                <%if (!EsqueciSenha)
                    { %>
                <div style="padding-top: 30px" class="panel-body">
                    <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                    <form id="loginform" class="form-horizontal" role="form">

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="TxtLogin" runat="server" CssClass="form-control" placeholder="Insira seu login"  />
                        </div>

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="TxtSenha" runat="server" TextMode="Password" CssClass="form-control" placeholder="Insira sua senha" />
                        </div>

                        <div style="margin-top: 10px" class="form-group">
                            <div class="col-sm-12 controls">
                                <asp:Button ID="BotaoEntrar" Text="   Entrar   " OnClick="BotaoEntrar_Click" runat="server" class="btn btn-success" />
                                <div style="float: right; font-size: 80%; position: relative; top: -10px">
                                    <asp:Button ID="EsqueciButton" CssClass="btn-info" runat="server" Text="Esqueceu sua senha?" OnClick="EsqueciButton_Click" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <%}
                    else
                    { %>
                <div style="padding-top: 30px" class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Insira seu e-mail" />
                        </div>
                        <div style="margin-top: 10px" class="form-group">
                            <div class="col-sm-12 controls">
                                <asp:Button ID="RecuperarButton" Text="   Recuperar   " runat="server" class="btn btn-success" OnClick="RecuperarButton_Click" />
                                <a class="btn btn-default" onclick="location.href = document.referrer; return false;">Voltar</a>
                            </div>
                        </div>
                    </form>
                </div>
                <%} %>
                <div style="padding-top: 30px" class="panel-body">
                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top: 15px; font-size: 85%">
                                <b>
                                    <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

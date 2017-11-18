<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Erro.aspx.cs" Inherits="SGA.Views.SGA.VErro.Erro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadLogin" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <div class="container">
        <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <center><img src="<%= ResolveClientUrl("~/Image/Logo.jpeg") %>"/></center>
            <br />
            <div class="panel panel-info">
                <div style="padding-top: 30px" class="panel-body">
                    <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                    <form id="loginform" class="form-horizontal" role="form">

                        <h2>Erro:</h2>
                        <p></p>
                        <asp:Label ID="FriendlyErrorMsg" runat="server" Text="Label" Font-Size="Large" Style="color: red"></asp:Label>
                        <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>

                        <asp:Panel ID="DetailedErrorPanel" runat="server" Visible="false">
                            <p>&nbsp;</p>
                            <h4>Datalhe do Erro:</h4>
                            <p>
                                <asp:Label ID="ErrorDetailedMsg" runat="server" Font-Size="Small" /><br />
                            </p>

                            <h4>Erro Handler:</h4>
                            <p>
                                <asp:Label ID="ErrorHandler" runat="server" Font-Size="Small" /><br />
                            </p>

                            <h4>Mensagem de erro detalhada:</h4>
                            <p>
                                <asp:Label ID="InnerMessage" runat="server" Font-Size="Small" /><br />
                            </p>
                            <p>
                                <asp:Label ID="InnerTrace" runat="server" />
                            </p>
                        </asp:Panel>
                    </form>
                </div>
            </div>
        </div>
        <div class="container container-table">
            <div class="row vertical-center-row">
                <a href="/Views/SGA/Inicio.aspx" class="btn btn-info text-center col-md-4 col-md-offset-4" role="button">Ir para a página inicial</a>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGA.Login" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadLogin" runat="server">
</asp:Content>


<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <asp:Label ID="LabelBemVindo" runat="server" Text="Label">Bem vindo!</asp:Label>
   
    <table cellpadding="3" border="0">
        <tr>
            <td>Username:</td>
            <td>
                <asp:TextBox ID="TxtLogin" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server"
                    ControlToValidate="TxtLogin" ForeColor="red"
                    Display="Static" ErrorMessage="Required" />
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <asp:TextBox ID="TxtSenha" runat="server" TextMode="Password" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server"
                    ControlToValidate="TxtSenha" ForeColor="red"
                    Display="Static" ErrorMessage="Required" />
            </td>
        </tr>
         <tr>
            <td></td>
            <td>
                <asp:button id="BotaoEntrar" text="Entrar" onclick="BotaoEntrar_Click" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

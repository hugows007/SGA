<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuarios.aspx.cs" Inherits="SGA.Views.SGA.Usuario.ConsultaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th>Endereço</th>
            <th>Número</th>
            <th>CEP</th>
            <th>Telefone</th>
            <th>Perfil</th>
        </tr>
        <asp:Literal ID="LitUsrList" runat="server"></asp:Literal>
    </table>
</asp:Content>

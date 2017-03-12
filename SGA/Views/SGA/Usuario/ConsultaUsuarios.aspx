<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuarios.aspx.cs" Inherits="SGA.Views.SGA.Usuario.ConsultaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    
    
    <asp:GridView ID="GridViewUsuarios" runat="server" CaptionAlign="Top" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Nome" HeaderText="Nome"/>
            <asp:BoundField DataField="Endereco" HeaderText="Endereço"/>
            <asp:BoundField DataField="Numero" HeaderText="Número"/>
            <asp:BoundField DataField="Cep" HeaderText="CEP"/>
            <asp:BoundField DataField="Telefone" HeaderText="Telefone"/>
        </Columns>
    </asp:GridView>

</asp:Content>

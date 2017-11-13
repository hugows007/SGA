<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RelacionamentoUsrRegiao.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.RelacionamentoUsrRegiao" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
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
                        Relacionamento de um usuário técnico ou um cliente a uma região de atendimento
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        alertify.log("<%=Mensagem%>");
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <table class="table table-bordered table-condensed">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="DropDownListTipo" class="control-label">Selecione o tipo de usuário:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListTipo" AutoPostBack="True" runat="server" CssClass="dropdown-toggle" OnSelectedIndexChanged="DropDownListTipo_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <%if (DropDownListTipo.SelectedIndex > 0)
                                        { %>
                                    <tr>
                                        <td>
                                            <label for="DropDownListUsuario" class="control-label">Usuário:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListUsuario" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="DropDownListRegiao" class="control-label">Região de atendimento:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListRegiao" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                        <asp:Button ID="RelacionarButton" runat="server" Text="Relacionar usuário e área de atendimento" class="btn btn-default" OnClick="RelacionarButton_Click" />
                        <a class="btn btn-default" href="/Views/SGA/Inicio.aspx">Voltar para o início</a>
                    </div>
                    <div class="panel-footer">
                        Favor selecionar as opções e quando finalizado, clicar em relacionar.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

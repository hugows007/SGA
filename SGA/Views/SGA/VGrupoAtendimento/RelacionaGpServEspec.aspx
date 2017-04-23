<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RelacionaGpServEspec.aspx.cs" Inherits="SGA.Views.SGA.VGrupoAtendimento.RelaGpAreaServEspec" %>

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
                        Grupo de atendimento - Relacionamento entre serviço e especialidade.
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <table class="table table-bordered table-condensed">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="DropDownListGrupo" class="control-label">Selecione o grupo de atendimento:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListGrupo" AutoPostBack="True" runat="server" CssClass="dropdown-toggle" OnSelectedIndexChanged="DropDownListGrupo_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <%if (DropDownListGrupo.SelectedIndex > 0)
                                        { %>
                                    <tr>
                                        <td>
                                            <label for="DropDownListServ" class="control-label">Serviço:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListServ" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="DropDownListEspec" class="control-label">Especialidade:</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListEspec" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                        <asp:Button ID="RelacionarButton" runat="server" Text="Relacionar itens" class="btn btn-default" OnClick="RelacionarButton_Click" />
                        <a class="btn btn-default" href="/Views/SGA/Inicio.aspx">Voltar para o início</a>
                    </div>
                    <div class="panel-footer">
                        Favor selecionar as opções e quando finalizado, clicar em relacionar itens.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

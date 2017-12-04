<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RelacionaEspecServ.aspx.cs" Inherits="SGA.Views.SGA.VEspecialidade.RelacionaEspecServ" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
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
                        Relacionamento entre serviço e especialidade.
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        function Alerta(Texto) {
                            alertify.log(Texto);
                        }
                        $("form").submit(function () {
                            $(this).submit(function () {
                                $(this).find(':submit').prop('disabled', true)
                                return false;
                            });
                            return true;
                        });
                    </script>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <div class="panel-body">
                                    <table class="table table-bordered table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label for="DropDownListServ" class="control-label">Serviço:</label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListServ" AppendDataBoundItems="true" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="DropDownListEspec" class="control-label">Especialidade:</label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListEspec" AppendDataBoundItems="true" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <asp:Button ID="RelacionarButton" runat="server" Text="Relacionar itens" class="btn btn-default" OnClick="RelacionarButton_Click" />
                                <a class="btn btn-default" onclick="location.href = document.referrer; return false;">Voltar</a>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    Favor selecionar as opções e quando finalizado, clicar em relacionar itens.<br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

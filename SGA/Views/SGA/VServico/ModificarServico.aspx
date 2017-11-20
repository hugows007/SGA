<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarServico.aspx.cs" Inherits="SGA.Views.SGA.VServico.ModificarServico" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
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
                                Serviços do sistema
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                            </div>
                            <script>
                                function Alerta(Texto) {
                                    alertify.log(Texto);
                                }
                            </script>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <div class="panel-body">

                                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                        <table class="table table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label for="DropDownListTpServico" class="control-label">Tipo de serviço:</label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownListTpServico" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="form-group">
                                        <label for="Nome" class="control-label">Nome: </label>
                                        <input type="text" id="Nome" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 50 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="DescServ" class="control-label">Descrição: </label>
                                        <input type="text" id="DescServ" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 100 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="SLA" class="control-label">SLA: </label>
                                        <input type="number" id="SLA" required class="form-control input-sm" runat="server" max="100" placeholder="Máximo de 100 horas" />
                                    </div>
                                    <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                                    <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                                </div>
                            </div>
                            <div class="panel-footer">
                                Favor alterar os campos e clicar em salvar alterações.<br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

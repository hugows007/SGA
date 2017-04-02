<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarServico.aspx.cs" Inherits="SGA.Views.SGA.VServico.ModificarServico" %>

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
                        Serviços do sistema
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
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
                                <label for="NomeTextBox" class="control-label">Nome: </label>
                                <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="DescServTextBox" class="control-label">Descrição: </label>
                                <asp:TextBox ID="DescServTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="SLATextBox" class="control-label">SLA: </label>
                                <asp:TextBox ID="SLATextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/VServico/ConsultaServicos.aspx">Voltar</a>
                        </div>
                        <div class="panel-footer">
                            Favor alterar os campos e clicar em salvar alterações.<br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarCargo.aspx.cs" Inherits="SGA.Views.SGA.VCargo.ModificarCargo" %>

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
                        Cargos do sistema
                        <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="CargoDescTextBox" class="control-label">Região:</label>
                                <asp:TextBox ID="CargoDescTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="SalarioTextBox" class="control-label">Cidade:</label>
                                <asp:TextBox ID="SalarioTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/Inicio.aspx">Cancelar</a>
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

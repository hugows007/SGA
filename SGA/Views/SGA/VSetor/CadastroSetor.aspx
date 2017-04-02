<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CadastroSetor.aspx.cs" Inherits="SGA.Views.SGA.VSetor.CadastroSetor" %>

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
                        Cadastrar setor
                       <b><br><asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="SetorTextBox" class="control-label">Setor: </label>
                                <asp:TextBox ID="SetorTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="Cadastrar" runat="server" Text="Cadastrar" class="btn btn-default" OnClick="CadastrarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/VSetor/ConsultaSetores.aspx">Voltar</a>
                        </div>
                        <div class="panel-footer">
                            Favor alterar os campos e clicar em salvar.<br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

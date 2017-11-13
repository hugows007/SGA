﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CadastroEspecialidade.aspx.cs" Inherits="SGA.Views.SGA.VEspecialidade.CadastroEspecialidade" %>

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
                        Cadastrar especialidade técnica
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label></b>
                    </div>
                    <script>
                        alertify.log("<%=Mensagem%>");
                    </script>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="Espec" class="control-label">Especialidade: </label>
                                <input type="text" id="Espec" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="DetalhesEspec" class="control-label">Detalhes da especialidade: </label>
                                <input type="text" id="DetalhesEspec" required class="form-control input-sm" runat="server" maxlength="100" placeholder="Máximo de 100 caracteres" />
                            </div>
                            <asp:Button ID="Cadastrar" runat="server" Text="Cadastrar" class="btn btn-default" OnClick="CadastrarButton_Click" />
                            <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Favor alterar os campos e clicar em salvar.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

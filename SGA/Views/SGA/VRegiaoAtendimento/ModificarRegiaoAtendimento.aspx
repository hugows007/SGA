<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarRegiaoAtendimento.aspx.cs" Inherits="SGA.Views.SGA.VRegiaoAtendimento.ModificarRegiaoAtendimento" %>

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
                        Alteração de área
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
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="Regiao" class="control-label">Região: </label>
                                <input type="text" id="Regiao" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 20 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Cidade" class="control-label">Cidade: </label>
                                <input type="text" id="Cidade" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 20 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="Estado" class="control-label">Estado: </label>
                                <input type="text" id="Estado" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 20 caracteres" />
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" class="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA/VAreaAtendimento/ConsultaRegiaoAtendimentos.aspx">Voltar</a>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ModificarTipoServico.aspx.cs" Inherits="SGA.Views.SGA.VTipoServico.ModificarTipoServico" %>

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
                        Tipos de serviços do sistema
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
                                <label for="Nome" class="control-label">Nome: </label>
                                <input type="text" id="Nome" required class="form-control input-sm" runat="server" maxlength="20" placeholder="Máximo de 20 caracteres" />
                            </div>
                            <asp:Button ID="AlterarButton" runat="server" Text="Salvar alterações" CssClass="btn btn-default" OnClick="AlterarButton_Click" />
                            <a class="btn btn-default" onclick="location.href = document.referrer; return false;">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Favor alterar os campos e clicar em salvar alterações.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

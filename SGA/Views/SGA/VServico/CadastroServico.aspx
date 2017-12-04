<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CadastroServico.aspx.cs" Inherits="SGA.Views.SGA.VServico.CadastroServico" %>

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
                        Cadastrar serviço
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
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                        <table class="table table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label for="DropDownListTpServico" class="control-label">Tipo de serviço:</label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownListTpServico" AppendDataBoundItems="true" AutoPostBack="True" runat="server" CssClass="dropdown-toggle">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-group">
                                <label for="Nome" class="control-label">Nome: </label>
                                <input type="text" id="Nome" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="DescServ" class="control-label">Descrição: </label>
                                <input type="text" id="DescServ" required class="form-control input-sm" runat="server" maxlength="100" placeholder="Máximo de 100 caracteres" />
                            </div>
                            <div class="form-group">
                                <label for="SLA" class="control-label">SLA em horas: </label>
                                <input type="number" id="SLA" required class="form-control input-sm" runat="server" max="100" placeholder="Máximo de 100 horas" />
                            </div>
                            <asp:Button ID="Cadastrar" runat="server" ClientIDMode="Static" Text="Cadastrar" class="btn btn-default submit" OnClick="CadastrarButton_Click" />
                            <a class="btn btn-default" onclick="location.href = document.referrer; return false;">Voltar</a>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Favor preencher os campos e clicar em cadastrar.<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DisableButton() {
            document.getElementById("<%=Cadastrar.ClientID %>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>
</asp:Content>

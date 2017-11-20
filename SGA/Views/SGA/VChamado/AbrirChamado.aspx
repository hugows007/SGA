<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="AbrirChamado.aspx.cs" Inherits="SGA.Views.SGA.VChamado.AbrirChamado" %>

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
                                Abrir chamado
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                        </b>
                            </div>
                            <script>
                                function Alerta(Texto) {
                                    alertify.log(Texto);
                                }
                            </script>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <%if (ObjChamado != null)
                                            { %>
                                        <div class="alert alert-success">
                                            <center>Chamado aberto com sucesso! Guarde o número de seu chamado: <a href="ConsultaChamado.aspx?IdChamado=<%=ObjChamado.Id%>"><%=ObjChamado.Id%></a></center>
                                        </div>
                                        <%}
                                            else
                                            { %>
                                        <div class="alert alert-info alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <center>Selecione as opções para abertura de seu chamado</center>
                                        </div>
                                        <%} %>
                                        <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                            <table class="table table-bordered table-condensed">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <label for="DropDownListTpServico" class="control-label">Tipo de serviço:</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListTpServico" AutoPostBack="True" runat="server" CssClass="dropdown-toggle" OnSelectedIndexChanged="DropDownListTpServico_SelectedIndexChanged"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <%if (DropDownListTpServico.SelectedIndex > 0)
                                                        { %>
                                                    <tr>
                                                        <td>
                                                            <label for="DropDownListServico" class="control-label">Descrição do serviço:</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListServico" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="DropDownListPrioridade" class="control-label">Prioridade do chamado:</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListPrioridade" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <%} %>
                                                    <%if (PerfilFunc && DropDownListServico.SelectedIndex > 0)
                                                        {%>
                                                    <tr>
                                                        <td>
                                                            <label for="DropDownListCliente" class="control-label">Cliente do chamado:</label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListCliente" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- Colocar seleção de categorias para abertura do chamado -->
                                    </div>

                                    <div class="form-group">
                                        <label for="Assunto" class="control-label">Assunto do chamado: </label>
                                        <input id="Assunto" type="text" class="form-control input-sm" maxlength="50" required runat="server" placeholder="Digite o assunto (máximo de 50 caracteres)" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Descricao" class="control-label">Breve descrição do seu problema: </label>
                                        <textarea rows="5" cols="50" id="Descricao" maxlength="500" class="form-control input-sm" required placeholder="Descrição do chamado (máximo de 500 caracteres)" runat="server"></textarea>
                                    </div>
                                    <asp:Button ID="Abrir" runat="server" Text="Abrir Chamado" class="btn btn-default" OnClick="AbrirButton_Click" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

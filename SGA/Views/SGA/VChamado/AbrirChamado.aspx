<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="AbrirChamado.aspx.cs" Inherits="SGA.Views.SGA.VChamado.AbrirChamado" %>

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
                        Abrir chamado
                        <b>
                            <br>
                            <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                            <%if (!0.Equals(ObjChamado.Id))
                                {
                            %>
                            <a href="ConsultaChamado.aspx?IdChamado=<%=ObjChamado.Id%>"><%=ObjChamado.Id%></a>
                            <%} %>
                        </b>
                    </div>
                    <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                        <div class="panel-body">
                            <div class="form-group">
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
                                            <tr>
                                                <td>
                                                    <label for="DropDownListServico" class="control-label">Descrição do serviço:</label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListServico" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <%if (PerfilUsr)
                                                {%>
                                            <tr>
                                                <td>
                                                    <label for="DropDownListAreaAtendimento" class="control-label">Área de atendimento:</label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListAreaAtendimento" AutoPostBack="True" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Colocar seleção de categorias para abertura do chamado -->
                            </div>

                            <div class="form-group">
                                <label for="CargoDescTextBox" class="control-label">Assunto do chamado: </label>
                                <asp:TextBox ID="AssuntoTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="DescricaoTextBox" class="control-label">Breve descrição do seu problema: </label>
                                <asp:TextBox ID="DescricaoTextBox" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <asp:Button ID="Abrir" runat="server" Text="Abrir Chamado" class="btn btn-default" OnClick="AbrirButton_Click" />
                            <a class="btn btn-default" href="/Views/SGA//">Voltar</a>
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

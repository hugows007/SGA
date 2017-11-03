<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CadastroUsuario.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.Cadastro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
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
                                Usuários do sistema
                                <b>
                                    <br>
                                    <asp:Label ID="MsgLabel" ForeColor="maroon" runat="server" /></b>
                            </div>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <table class="table table-bordered table-condensed">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label for="DropDownListTipo" class="control-label">Tipo de usuário:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListTipo" AutoPostBack="True" runat="server" CssClass="dropdown-toggle" OnSelectedIndexChanged="DropDownListTipo_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <%
                                            if (IdEmpresa.Equals(0) || IdEmpresa.Equals(null))
                                            {%>

                                        <tr>
                                            <td>
                                                <label for="DropDownListEmpresa" class="control-label">Selecione a empresa:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListEmpresa" AutoPostBack="True" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>

                                        <%}
                                            if (DropDownListTipo.Text.Equals("Técnico"))
                                            {%>
                                        <tr>
                                            <td>
                                                <label for="DropDownListEspec" class="control-label">Selecione a especialidade:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListEspec" AutoPostBack="True" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <% }
                                            if (DropDownListTipo.Text.Equals("Técnico") || DropDownListTipo.Text.Equals("Cliente Físico") || DropDownListTipo.Text.Equals("Cliente Jurídico"))
                                            {%>
                                        <tr>
                                            <td>
                                                <label for="DropDownListArea" class="control-label">Selecione a área de atendimento:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListArea" AutoPostBack="True" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="UserNameTextbox" class="control-label">Usuário: </label>
                        <asp:TextBox ID="UserNameTextbox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="PasswordTextbox" class="control-label">Senha: </label>
                        <asp:TextBox ID="PasswordTextbox" runat="server" TextMode="Password" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="PasswordConfirmTextbox" class="control-label">Confirmar senha: </label>
                        <asp:TextBox ID="PasswordConfirmTextbox" runat="server" TextMode="Password" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="EmailTextbox" class="control-label">E-mail:</label>
                        <asp:TextBox ID="EmailTextbox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="NomeTextBox" class="control-label">Nome:</label>
                        <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="EnderecoTextBox" class="control-label">Endereço:</label>
                        <asp:TextBox ID="EnderecoTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="NumeroTextBox" class="control-label">Número:</label>
                        <asp:TextBox ID="NumeroTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="CEPTextBox" class="control-label">CEP:</label>
                        <asp:TextBox ID="CEPTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="TelefoneTextBox" class="control-label">Telefone:</label>
                        <asp:TextBox ID="TelefoneTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <%  if (DropDownListTipo.Text.Equals("Cliente Físico"))
                        { %>
                    <div class="form-group">
                        <label for="DocTextbox" class="control-label">Documento Identificador:</label>
                        <asp:TextBox ID="DocTextbox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="EmissDocTextBox" class="control-label">Emissor:</label>
                        <asp:TextBox ID="EmissDocTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="CPFTextbox" class="control-label">CPF:</label>
                        <asp:TextBox ID="CPFTextbox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <% }
                        else if (DropDownListTipo.Text.Equals("Cliente Jurídico"))
                        {%>
                    <div class="form-group">
                        <label for="CNPJTextBox" class="control-label">CNPJ:</label>
                        <asp:TextBox ID="CNPJTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                    <% } %>
                    <div class="form-group">
                        <asp:Button ID="BotaoCriarUsuario" Text="Criar Usuário" class="btn btn-default" OnClick="BotaoCriarUsuario_OnClick" runat="server" />
                        <a class="btn btn-default" href="/Views/SGA/VUsuario/ConsultaUsuarios.aspx">Voltar</a>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                Clique em criar usuário para salvar.
            </div>
            </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

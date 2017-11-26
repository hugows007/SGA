<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CadastroUsuario.aspx.cs" Inherits="SGA.Views.SGA.VUsuario.Cadastro" %>

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
                                Usuários do sistema
                                <b>
                                    <br>
                                    <asp:Label ID="MsgLabel" ForeColor="maroon" runat="server" /></b>
                                <script>
                                    function Alerta(Texto) {
                                        alertify.log(Texto);
                                    }
                                </script>
                            </div>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <table class="table table-bordered table-condensed">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label for="DropDownListTipo" class="control-label">Tipo de usuário:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListTipo" AppendDataBoundItems="true" AutoPostBack="True" runat="server" CssClass="dropdown-toggle" OnSelectedIndexChanged="DropDownListTipo_SelectedIndexChanged"></asp:DropDownList>
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
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="UserName" class="control-label">Usuário: </label>
                                        <input type="text" id="UserName" required class="form-control input-sm" runat="server" maxlength="30" placeholder="Máximo de 30 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Password" class="control-label">Senha: </label>
                                        <input type="password" id="Password" required class="form-control input-sm" runat="server" maxlength="15" minlength="8" placeholder="Mínimo de 8 e máximo de 15 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="PasswordConfirm" class="control-label">Confirmar senha: </label>
                                        <input type="password" id="PasswordConfirm" required class="form-control input-sm" runat="server" maxlength="15" minlength="8" placeholder="Mínimo de 8 e máximo de 15 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Email" class="control-label">E-mail:</label>
                                        <input type="email" id="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="E-mail inválido" required class="form-control input-sm" runat="server" maxlength="30" placeholder="Máximo de 30 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Nome" class="control-label">Nome:</label>
                                        <input type="text" id="Nome" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="CEP" class="control-label">CEP:</label>
                                        <input type="text" id="CEP" pattern="[0-9]+$" title="Somente números" required class="form-control input-sm" runat="server" minlength="8" maxlength="8" placeholder="Máximo de 8 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Endereco" class="control-label">Endereço:</label>
                                        <input type="text" id="Endereco" class="form-control input-sm" runat="server" maxlength="50" placeholder="Será preenchido automaticamente com base no CEP informado" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Complemento" class="control-label">Complemento:</label>
                                        <input type="text" id="Complemento" required class="form-control input-sm" runat="server" maxlength="50" placeholder="Máximo de 50 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Telefone" class="control-label">Telefone:</label>
                                        <input type="tel" id="Telefone" required class="form-control input-sm" runat="server" maxlength="10" placeholder="Máximo de 10 caracteres" />
                                    </div>
                                    <%  if (DropDownListTipo.Text.Equals("Cliente Físico"))
                                        { %>
                                    <div class="form-group">
                                        <label for="Doc" class="control-label">Documento Identificador:</label>
                                        <input type="text" id="Doc" required class="form-control input-sm" runat="server" maxlength="15" placeholder="Máximo de 15 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="EmissDoc" class="control-label">Emissor:</label>
                                        <input type="text" id="EmissDoc" required class="form-control input-sm" runat="server" maxlength="15" placeholder="Máximo de 15 caracteres" />
                                    </div>
                                    <div class="form-group">
                                        <label for="CPF" class="control-label">CPF:</label>
                                        <input type="text" id="CPF" required class="form-control input-sm" runat="server" maxlength="11" placeholder="Máximo de 11 caracteres" />
                                    </div>
                                    <% }
                                        else if (DropDownListTipo.Text.Equals("Cliente Jurídico"))
                                        {%>
                                    <div class="form-group">
                                        <label for="CNPJ" class="control-label">CNPJ:</label>
                                        <input type="text" id="CNPJ" required class="form-control input-sm" runat="server" maxlength="14" placeholder="Máximo de 14 caracteres" />
                                    </div>
                                    <% } %>
                                    <div class="form-group">
                                        <asp:Button ID="BotaoCriarUsuario" Text="Criar Usuário" CssClass="btn btn-default" OnClick="BotaoCriarUsuario_OnClick" runat="server" />
                                        <a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
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

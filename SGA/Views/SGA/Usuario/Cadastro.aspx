<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="SGA.Views.SGA.Usuario.Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <h3>Create New User</h3>

    <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
    <br />
    <table cellpadding="3" border="0">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <tr>
                    <td>Tipo de usuário:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListTipo" AutoPostBack="True" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="TipoUsuarioValidator" runat="server"
                            ControlToValidate="DropDownListTipo" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                 <% if (DropDownListTipo.Text.Equals("Gestor") || DropDownListTipo.Text.Equals("Técnico"))
                    {%>
                <tr>
                    <td>Setor:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListSetor" AutoPostBack="True" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSetor" runat="server"
                            ControlToValidate="DropDownListSetor" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>
                <tr>
                    <td>Cargo:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListCargo" AutoPostBack="True" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCargo" runat="server"
                            ControlToValidate="DropDownListCargo" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <% }
                    if (DropDownListTipo.Text.Equals("Técnico"))
                    {%>
                <tr>
                    <td>Especialidade:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListEspec" AutoPostBack="True" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEspec" runat="server"
                            ControlToValidate="DropDownListEspec" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <% } %>

                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:TextBox ID="UsernameTextbox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server"
                            ControlToValidate="UserNameTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="PasswordTextbox" runat="server" TextMode="Password" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server"
                            ControlToValidate="PasswordTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td>
                        <asp:TextBox ID="PasswordConfirmTextbox" runat="server" TextMode="Password" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="PasswordConfirmRequiredValidator" runat="server"
                            ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                        <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server"
                            ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                            Display="Static" ControlToCompare="PasswordTextBox"
                            ErrorMessage="Confirm password must match password." />
                    </td>
                </tr>
                <tr>
                    <td>Email Address:</td>
                    <td>
                        <asp:TextBox ID="EmailTextbox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server"
                            ControlToValidate="EmailTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>Nome:</td>
                    <td>
                        <asp:TextBox ID="NomeTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="NomeTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>Endereço:</td>
                    <td>
                        <asp:TextBox ID="EnderecoTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="EnderecoTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>Número:</td>
                    <td>
                        <asp:TextBox ID="NumeroTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="NumeroTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>CEP:</td>
                    <td>
                        <asp:TextBox ID="CEPTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="CEPTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>Telefone:</td>
                    <td>
                        <asp:TextBox ID="TelefoneTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="TelefoneTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <%  if (DropDownListTipo.Text.Equals("Cliente Físico"))
                    { %>

                <tr>
                    <td>Documento identificador:</td>
                    <td>
                        <asp:TextBox ID="DocTextbox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredfieldvalidatorDoc" runat="server"
                            ControlToValidate="DocTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>
                <tr>
                    <td>Emissor:</td>
                    <td>
                        <asp:TextBox ID="EmissDocTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredfieldvalidatorEmissDoc" runat="server"
                            ControlToValidate="EmissDocTextBox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <tr>
                    <td>CPF:</td>
                    <td>
                        <asp:TextBox ID="CPFTextbox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server"
                            ControlToValidate="CPFTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <% }
                    else if (DropDownListTipo.Text.Equals("Cliente Jurídico"))
                    {%>

                <tr>
                    <td>CNPJ:</td>
                    <td>
                        <asp:TextBox ID="CNPJTextBox" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredfieldvalidatorCNPJ" runat="server"
                            ControlToValidate="CNPJTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                    </td>
                </tr>

                <% } %>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="BotaoCriarUsuario" Text="Criar Usuário" OnClick="BotaoCriarUsuario_OnClick" runat="server" />
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
    </table>
</asp:Content>

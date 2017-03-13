<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuarios.aspx.cs" Inherits="SGA.Views.SGA.Usuario.ConsultaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Usuários cadastrados:
                            </h3>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Endereço</th>
                                        <th>Número</th>
                                        <th>Cep</th>
                                        <th>Telefone</th>
                                        <th>Perfil</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Literal ID="LitUsrList" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            Clique no número do usuário para edita-lo.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

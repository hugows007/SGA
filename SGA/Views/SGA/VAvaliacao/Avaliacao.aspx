<%@ Page Title="" Language="C#" MasterPageFile="~/Views/SGA/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Avaliacao.aspx.cs" Inherits="SGA.Views.SGA.VAvaliacao.Avaliacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headInicio" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

    <style>
        .starRating {
            width: 50px;
            height: 50px;
            cursor: pointer;
            background-repeat: no-repeat;
            display: block;
        }

        .FilledStars {
            background-image: url("/Image/star/cheia.png");
        }

        .EmptyStars {
            background-image: url("/Image/star/vazia.png");
        }

        .WaitingStars {
            background-image: url("/Image/star/vazia.png");
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderInicio" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                                Avaliação de atendimento e chamado: <%=ObjAtend.IdChamado %>
                                <asp:Label ID="MsgLabel" runat="server" ForeColor="maroon" Text=""></asp:Label>
                            </div>
                            <div class="panel-body table table-striped table-bordered table-hover" style="overflow-x: auto;">
                                <div class="panel-body">

                                    <script>
                                        function Alerta(Texto) {
                                            alertify.log(Texto);
                                        }
                                    </script>
                                    <label for="RatingAtendimento" class="control-label">Avaliação do atendimento do técnico:</label>
                                    <ajaxToolkit:Rating ID="RatingAtendimento" runat="server" StarCssClass="starRating" FilledStarCssClass="FilledStars" EmptyStarCssClass="EmptyStars" WaitingStarCssClass="WaitingStars" CurrentRating="2" MaxRating="5">
                                    </ajaxToolkit:Rating>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <label for="RatingChamado" class="control-label">Avaliação do chamado:</label>
                                    <ajaxToolkit:Rating ID="RatingChamado" runat="server" StarCssClass="starRating" FilledStarCssClass="FilledStars" EmptyStarCssClass="EmptyStars" WaitingStarCssClass="WaitingStars" CurrentRating="2" MaxRating="5">
                                    </ajaxToolkit:Rating>

                                </div>
                                <label for="ComentarioTextBox" class="control-label">Se quiser, também pode comentar: </label>
                                <textarea rows="5" cols="50" id="Comentario" name="Comentario" maxlength="100" class="form-control input-sm" placeholder="Digite seu comentário (máximo de 100 caracteres)" runat="server"></textarea>
                                <br />
                                <asp:Button ID="AvaliarButton" runat="server" Text="Avaliar!" CssClass="btn btn-success" OnClick="AvaliarButton_Click" />
                            </div>
                            <div class="panel-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

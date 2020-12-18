<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Gui.web.index" %>

<%@ Register Src="~/controles/ImagenProducto.ascx" TagPrefix="uc1" TagName="ImagenProducto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-lg-3">

                <h1 class="my-4">
                    <asp:Label ID="LblShop" runat="server"></asp:Label></h1>
                <div class="list-group">
                    <asp:LinkButton ID="LinkAnteojosReceta" runat="server" CssClass="list-group-item" OnClick="LinkReceta_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkAnteojosSol" runat="server" CssClass="list-group-item" OnClick="LinkSol_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkAnteojosDeportivos" runat="server" CssClass="list-group-item" OnClick="LinkDeportivo_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkAnteojosRetro" runat="server" CssClass="list-group-item" OnClick="LinkRetro_Click"></asp:LinkButton>
                </div>

            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9">

                <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="/img/cabecera1.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="/img/cabecera2.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="/img/cabecera3.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="row"> <!-- Lista de Productos -->

                    <asp:PlaceHolder ID="ListaProductos" runat="server"></asp:PlaceHolder>

                </div>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</asp:Content>

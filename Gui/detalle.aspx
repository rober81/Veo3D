﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="detalle.aspx.cs" Inherits="Gui.web.detalle" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../bootstrap/css/shop-item.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="card shadow card-outline-secondary my-4">
                    <div class="card-header">
                        <asp:Label ID="LblPersonalizacion" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="card-body">
                                                <div class="row">
                            <div class="col">
                                <asp:Image ID="IPImagenProd" runat="server" CssClass="card-img-top img-fluid mx-auto" />
                            </div>
                            <div class="col">
                                <h3 class="card-title">
                                    <asp:Label ID="IPLblTitulo" runat="server" Text="Label"></asp:Label>
                                </h3>
                                <h4>
                                    <asp:Label ID="IPLblPrecio" runat="server" Text="Label"></asp:Label>
                                </h4>
                                <p class="card-text">
                                    <asp:Label ID="IPLblTexto" runat="server" Text="Label"></asp:Label>
                                </p>
                                <span class="text-warning">
                                    <asp:Label ID="IPLblEstrellas" runat="server" Text="Label"></asp:Label>
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <img src="img/medidas.png" height="505" width="311" />
                            </div>
                            <div class="col w-25">
                                <uc1:LabelTexto runat="server" ID="LblAnchoMontura" EsNumero="true" />
                                <uc1:LabelTexto runat="server" ID="LblPuente" EsNumero="true" />
                                <uc1:LabelTexto runat="server" ID="LblAnchoCristales" EsNumero="true" />
                                <uc1:LabelTexto runat="server" ID="LblAlturaCristales" EsNumero="true" />
                                <uc1:LabelTexto runat="server" ID="LblLongitudPatillas" EsNumero="true" />
                                <asp:Button ID="BtnSiguiente" runat="server" OnClick="Siguiente_Click" CssClass="btn btn-success fa-align-right" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

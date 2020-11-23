<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="ProductoAbm.aspx.cs" Inherits="Gui.produccion.ProductoAbm" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminProducto" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="table-responsive-md w-75 mx-auto">
        <uc1:LabelTexto runat="server" ID="PID" EsValidado="false" />
        <uc1:LabelTexto runat="server" ID="PNombre" />
        <uc1:LabelTexto runat="server" ID="PArchivo" />
        <uc1:LabelTexto runat="server" ID="PPrecio" EsDecimal="true" />
        <uc1:LabelTexto runat="server" ID="PCantidadMaterial" EsNumero="true" />
        <uc1:LabelTexto runat="server" ID="PTiempoImpresion" EsNumero="true" />
        <uc1:LabelTexto runat="server" ID="PImagen" />
        <uc1:LabelTexto runat="server" ID="PDescripcion" />
        <uc1:LabelTexto runat="server" ID="PTipo" />
        <uc1:LabelTexto runat="server" ID="PCalificacion" EsNumero="true" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnBaja" runat="server" Text="Cancelar" OnClick="Baja_Click" CssClass="btn btn-danger" />
    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn-warning" />
    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success" />
    <asp:Label ID="toast" runat="server" Text=""></asp:Label>
</asp:Content>

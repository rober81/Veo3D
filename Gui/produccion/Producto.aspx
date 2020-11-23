<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Gui.produccion.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminProducto" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">

    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
        AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnModificar" runat="server" CssClass="btn btn-secondary" OnClick="Modificar_Click" />
    <asp:Button ID="BtnNuevo" runat="server" CssClass="btn btn-primary" OnClick="Nuevo_Click" />
</asp:Content>

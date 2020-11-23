<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" Inherits="Gui.produccion.Bitacora" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblListarBitacora" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="form-group w-75 mx-auto">
        <uc1:LabelTexto runat="server" ID="LblUsuario" />
        <uc1:LabelTexto runat="server" ID="LtFechaDesde" />
        <uc1:LabelTexto runat="server" ID="LtFechaHasta" />
        <asp:Button ID="BtnBuscar" runat="server" CssClass="btn btn-primary" OnClick="Btn_Click" />
    </div>
    <div class="table-responsive w-75 mx-auto scrolling-table-container">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true">
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
</asp:Content>

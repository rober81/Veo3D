<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="MaterialAbm.aspx.cs" Inherits="Gui.produccion.MaterialAbm" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<%@ Register Src="~/controles/Mensaje.ascx" TagPrefix="uc1" TagName="Mensaje" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminMaterial" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="table-responsive-md w-75 mx-auto">
        <uc1:LabelTexto runat="server" ID="MID" EsValidado="false" Visible =" false" />
        <uc1:LabelTexto runat="server" ID="MMarca" />
        <uc1:LabelTexto runat="server" ID="MColor" />
        <uc1:LabelTexto runat="server" ID="MTipo" />
        <uc1:LabelTexto runat="server" ID="MPeso" EsNumero="true" />
        <uc1:LabelTexto runat="server" ID="MMetros" EsNumero="true" />
        <uc1:LabelTexto runat="server" ID="MStock" EsNumero="true" />
        <uc1:LabelTexto runat="server" ID="MCostoMetros" EsDecimal="true" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnBaja" runat="server" Text="Cancelar" OnClick="Baja_Click" CssClass="btn btn-danger" />
    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn-secondary" />
    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success" />
    <uc1:Mensaje runat="server" ID="Mensaje" />
</asp:Content>

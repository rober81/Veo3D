<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Gui.produccion.Usuario" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<%@ Register Src="~/controles/Mensaje.ascx" TagPrefix="uc1" TagName="Mensaje" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblRegistroUsuario" runat="server" visible="false"></asp:Label>
    <asp:Label ID="LblModificarUsuario" runat="server" visible="false"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="table-responsive-md w-75 mx-auto">
        <uc1:LabelTexto runat="server" ID="LblUsuario" />
        <uc1:LabelTexto runat="server" ID="LblContrasenia" />
        <uc1:LabelTexto runat="server" ID="LblContraseniaRepetir" />
        <uc1:LabelTexto runat="server" ID="LblCorreo" />
        <uc1:LabelTexto runat="server" ID="INombre" />
        <uc1:LabelTexto runat="server" ID="LblApellido" />
        <uc1:LabelTexto runat="server" ID="LblDni" EsNumero="true" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn btn-secondary m-1" />
    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success m-1" />
    <uc1:Mensaje runat="server" ID="Mensaje" />
</asp:Content>

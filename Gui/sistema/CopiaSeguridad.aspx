<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="CopiaSeguridad.aspx.cs" Inherits="Gui.produccion.CopiaSeguridad" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<%@ Register Src="~/controles/Mensaje.ascx" TagPrefix="uc1" TagName="Mensaje" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LinkRealizar" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="true"
        AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
    </asp:GridView>
    <div class="form-group w-75 mx-auto">
        <uc1:LabelTexto runat="server" ID="LtNombreArchivo" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnRestaurar" runat="server" CssClass="btn btn-danger m-1" OnClick="BtnRestaurar_Click" />
    <asp:Button ID="BtnCrearCopia" runat="server" CssClass="btn btn-success m-1" OnClick="BtnCrear_Click" />
    <uc1:Mensaje runat="server" ID="Mensaje" />
</asp:Content>

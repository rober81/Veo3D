<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="ProductoAbm.aspx.cs" Inherits="Gui.produccion.ProductoAbm" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow w-50 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblAdminProducto" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive-md w-75 mx-auto">
                <uc1:LabelTexto runat="server" ID="PID" EsValidado="false" />
                <uc1:LabelTexto runat="server" ID="PNombre" />
                <uc1:LabelTexto runat="server" ID="PArchivo" />
                <uc1:LabelTexto runat="server" ID="PCantidadMaterial" EsNumero="true" />
                <uc1:LabelTexto runat="server" ID="PTiempoImpresion" EsNumero="true" />
                <uc1:LabelTexto runat="server" ID="PImagen" />
                <uc1:LabelTexto runat="server" ID="PDescripcion" />
                <uc1:LabelTexto runat="server" ID="PTipo" />
                <uc1:LabelTexto runat="server" ID="PCalificacion" EsNumero="true" />
                <asp:Button ID="BtnBaja" runat="server" Text="Cancelar" OnClick="Baja_Click" CssClass="btn btn-danger" />
                <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn-warning" />
                <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success" />
                <asp:Label ID="toast" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

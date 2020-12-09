<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Gui.produccion.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminProducto" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="d-flex justify-content-end">
        <asp:Button ID="BtnXLS" runat="server" CssClass="btn btn-info btn-sm m-1" OnClick="XLS_Click" />
        <asp:Button ID="BtnPDF" runat="server" CssClass="btn btn-info btn-sm m-1" OnClick="PDF_Click" />
    </div>
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridView_RowDataBound"
        AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id"/>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Archivo" DataField="Archivo" />
            <asp:BoundField HeaderText="Imagen" DataField="Imagen" />
            <asp:BoundField HeaderText="Tiempo Impresión" DataField="TiempoImpresion" DataFormatString="{0} h" />
            <asp:BoundField HeaderText="Cantidad Material" DataField="CantidadMaterial" DataFormatString="{0} m" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
            <asp:BoundField HeaderText="Calificación" DataField="Calificacion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="$ {0}" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnModificar" runat="server" CssClass="btn btn-warning m-1" OnClick="Modificar_Click" />
    <asp:Button ID="BtnNuevo" runat="server" CssClass="btn btn-primary m-1" OnClick="Nuevo_Click" />
</asp:Content>

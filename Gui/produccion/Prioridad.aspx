<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Prioridad.aspx.cs" Inherits="Gui.produccion.Prioridad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblListadoPrioridades" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="d-flex justify-content-end">
        <asp:Button ID="BtnXLS" runat="server" CssClass="btn btn-info btn-sm m-1" OnClick="XLS_Click" />
        <asp:Button ID="BtnPDF" runat="server" CssClass="btn btn-info btn-sm m-1" OnClick="PDF_Click" />
    </div>
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true"
        OnRowDataBound="GridView_RowDataBound">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
            <asp:BoundField HeaderText="Orden" DataField="Prioridad" />
            <asp:BoundField HeaderText="Impresora" DataField="Impresora.Nombre" />
            <asp:BoundField HeaderText="Cliente" DataField="Venta.Usuario.NombreCompleto" />
            <asp:BoundField HeaderText="Nombre" DataField="Venta.Personalizado.Producto.Nombre" />
            <asp:BoundField HeaderText="Archivo" DataField="Venta.Personalizado.Archivo" />
            <asp:BoundField HeaderText="Material" DataField="Material.MaterialDato" />
            <asp:BoundField HeaderText="Tiempo de Impresión" DataField="Venta.Personalizado.Producto.TiempoImpresion" DataFormatString="{0} h" />
            <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Estado" DataField="Estado" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnBajarPrioridad" runat="server" CssClass="btn btn btn-info" OnClick="Bajar_Click" />
    <asp:Button ID="BtnSubirPrioridad" runat="server" CssClass="btn btn-primary" OnClick="Subir_Click" />
</asp:Content>

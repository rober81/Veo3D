<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="PanelPedidos.aspx.cs" Inherits="Gui.produccion.PanelPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblHistorialPedidos" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
<asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true"
        OnRowDataBound="GridView_RowDataBound">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
            <asp:BoundField HeaderText="Cliente" DataField="Venta.Usuario.NombreCompleto" />
            <asp:BoundField HeaderText="Nombre" DataField="Venta.Personalizado.Producto.Nombre" />
            <asp:BoundField HeaderText="Archivo" DataField="Venta.Personalizado.Archivo" />
            <asp:BoundField HeaderText="Material" DataField="Material.MaterialDato" />
            <asp:BoundField HeaderText="Color" DataField="Material.Color" />
            <asp:BoundField HeaderText="Tipo" DataField="Material.Tipo" />
            <asp:BoundField HeaderText="Cant de Material" DataField="Venta.Personalizado.Producto.CantidadMaterial" DataFormatString="{0} m" />
            <asp:BoundField HeaderText="Tiempo de Impresión" DataField="Venta.Personalizado.Producto.TiempoImpresion" DataFormatString="{0} h" />
            <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Provincia" DataField="Venta.Provincia" />
            <asp:BoundField HeaderText="Localidad" DataField="Venta.Localidad" />
            <asp:BoundField HeaderText="Calle" DataField="Venta.Calle" />
            <asp:BoundField HeaderText="Puerta" DataField="Venta.Puerta" />
            <asp:BoundField HeaderText="Depto" DataField="Venta.Depto" />
            <asp:BoundField HeaderText="Estado" DataField="Estado" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
</asp:Content>

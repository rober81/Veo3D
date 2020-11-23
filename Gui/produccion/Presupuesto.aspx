﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="Gui.produccion.Presupuesto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblPresupuesto" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
            <asp:BoundField HeaderText="Nombre" DataField="Venta.Personalizado.Producto.Nombre" />
            <asp:BoundField HeaderText="Archivo" DataField="Venta.Personalizado.Archivo" />
            <asp:BoundField HeaderText="Material" DataField="Material.Marca" />
            <asp:BoundField HeaderText="Color" DataField="Material.Color" />
            <asp:BoundField HeaderText="Tipo" DataField="Material.Tipo" />
            <asp:BoundField HeaderText="Cant de Material" DataField="Venta.Personalizado.Producto.CantidadMaterial" />
            <asp:BoundField HeaderText="Tiempo de Impresión" DataField="Venta.Personalizado.Producto.TiempoImpresion" DataFormatString="{0} h" />
            <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Estado" DataField="Estado" />
        </Columns>
    </asp:GridView>
    <div class="form-group">
        <asp:Label ID="LblMaterial" runat="server" Text="Permisos" AssociatedControlID="ComboMaterial"></asp:Label>
        <asp:DropDownList ID="ComboMaterial" runat="server" CssClass="form-control" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnCambiarMaterial" runat="server" CssClass="btn btn btn-secondary" OnClick="Cambiar_Click" />
    <asp:Button ID="BtnCalcular" runat="server" CssClass="btn btn btn-primary" OnClick="Calcular_Click" />
    <asp:Button ID="BtnImprimir" runat="server" CssClass="btn btn-success" OnClick="Primario_Click" />
</asp:Content>

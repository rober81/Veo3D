<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Prioridad.aspx.cs" Inherits="Gui.produccion.Prioridad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblListadoPrioridades" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Impresora" DataField="Impresora.Nombre" />
            <asp:BoundField HeaderText="Prioridad" DataField="Prioridad" />
            <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
            <asp:BoundField HeaderText="Cliente" DataField="Venta.Usuario" />
            <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }" />
            <asp:BoundField HeaderText="Estado" DataField="Estado" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnBajarPrioridad" runat="server" CssClass="btn btn btn-secondary" OnClick="Bajar_Click" />
    <asp:Button ID="BtnSubirPrioridad" runat="server" CssClass="btn btn-primary" OnClick="Subir_Click" />
</asp:Content>

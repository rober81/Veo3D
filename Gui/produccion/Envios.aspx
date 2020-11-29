<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Gui.produccion.Envios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblListadoEnvios" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true"
        OnRowDataBound="GridView_RowDataBound">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Cliente" DataField="Usuario.NombreCompleto" />
            <asp:BoundField HeaderText="Producto" DataField="Personalizado.Producto.Nombre" />
            <asp:BoundField HeaderText="Provincia" DataField="Provincia" />
            <asp:BoundField HeaderText="Localidad" DataField="Localidad" />
            <asp:BoundField HeaderText="Calle" DataField="Calle" />
            <asp:BoundField HeaderText="Puerta" DataField="Puerta" />
            <asp:BoundField HeaderText="Depto" DataField="Depto" />
            <asp:BoundField HeaderText="Estado" DataField="Estado" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnEnviarDomicilio" runat="server" CssClass="btn btn-primary" OnClick="Aceptar_Click" />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="Gui.sistema.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblUsuariosAdmin" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false"
        AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Usuario" DataField="Login" />
            <asp:BoundField HeaderText="Correo" DataField="Correo" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Dni" DataField="Dni" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnModificar" runat="server" CssClass="btn btn-warning" OnClick="Modificar_Click" />
    <asp:Button ID="BtnNuevo" runat="server" CssClass="btn btn-primary" OnClick="Nuevo_Click" />
</asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="Gui.produccion.Permisos" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminPermisos" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false"
        AutoGenerateSelectButton="true">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
        </Columns>
    </asp:GridView>
    <div class="form-group">
        <asp:Label ID="LblPadre" runat="server" Text="Permisos" AssociatedControlID="ComboPermisos"></asp:Label>
        <asp:DropDownList ID="ComboPermisos" runat="server" CssClass="form-control" />
    </div>
    <uc1:LabelTexto runat="server" ID="TxtPermiso" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnBaja" runat="server" CssClass="btn btn-secondary" OnClick="Baja_Click" />
    <asp:Button ID="BtnAgregar" runat="server" CssClass="btn btn-primary" OnClick="Agregar_Click" />
</asp:Content>

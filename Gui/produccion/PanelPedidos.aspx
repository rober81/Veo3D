<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="PanelPedidos.aspx.cs" Inherits="Gui.produccion.PanelPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblPanelPedidos" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="table-responsive mx-auto">
        <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
            AutoGenerateSelectButton="true">
            <SelectedRowStyle CssClass="table-success" />
        </asp:GridView>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
</asp:Content>

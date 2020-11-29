<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="Gui.produccion.Presupuesto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdmImpresion" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true"
        OnRowDataBound="GridView_RowDataBound">
        <SelectedRowStyle CssClass="table-success" />
        <Columns>
            <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
            <asp:BoundField HeaderText="Orden" DataField="Prioridad" />
            <asp:BoundField HeaderText="Nombre" DataField="Venta.Personalizado.Producto.Nombre" />
            <asp:BoundField HeaderText="Archivo" DataField="Venta.Personalizado.Archivo" />
            <asp:BoundField HeaderText="Material" DataField="Material.MaterialDato" />
            <asp:BoundField HeaderText="Color" DataField="Material.Color" />
            <asp:BoundField HeaderText="Tipo" DataField="Material.Tipo" />
            <asp:BoundField HeaderText="Cant de Material" DataField="Venta.Personalizado.Producto.CantidadMaterial" DataFormatString="{0} m" />
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
    <div class="alert alert-success" role="alert" runat="server" id="ResultadoDiv">
        <h4 class="alert-heading">Presupuesto</h4>
        <p><asp:Label ID="LblCalculo" runat="server" Text=""></asp:Label></p>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnCambiarMaterial" runat="server" CssClass="btn btn btn-warning" OnClick="Cambiar_Click" />
    <asp:Button ID="BtnCalcular" runat="server" CssClass="btn btn btn-info" OnClick="Calcular_Click" />
    <asp:Button ID="BtnImprimir" runat="server" CssClass="btn btn-success" OnClick="Primario_Click" />
    <asp:Button ID="BtnTerminado" runat="server" CssClass="btn btn-primary" OnClick="Terminado_Click" />
</asp:Content>

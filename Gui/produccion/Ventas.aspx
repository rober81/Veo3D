<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Gui.produccion.Ventas" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblListadoVentas" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <div class="table-responsive mx-auto">
        <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true"
            OnRowDataBound="GridView_RowDataBound">
            <SelectedRowStyle CssClass="table-success" />
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Id" />
                <asp:BoundField HeaderText="Cliente" DataField="Usuario.NombreCompleto" />
                <asp:BoundField HeaderText="Producto" DataField="Personalizado.Producto.Nombre" />
                <asp:BoundField HeaderText="Archivo" DataField="Personalizado.Archivo" />
                <asp:BoundField HeaderText="Tiempo Impresión" DataField="Personalizado.Producto.TiempoImpresion" DataFormatString="{0} h" />
                <asp:BoundField HeaderText="Cantidad Material" DataField="Personalizado.Producto.CantidadMaterial" DataFormatString="{0} m" />
                <asp:BoundField HeaderText="Color" DataField="Personalizado.Color" />
                <asp:BoundField HeaderText="Ancho Montura" DataField="Personalizado.AnchoMontura" DataFormatString="{0} mm" />
                <asp:BoundField HeaderText="Puente" DataField="Personalizado.Puente" DataFormatString="{0} mm" />
                <asp:BoundField HeaderText="Ancho Cristales" DataField="Personalizado.AnchoCristales" DataFormatString="{0} mm" />
                <asp:BoundField HeaderText="Altura Cristales" DataField="Personalizado.AlturaCristales" DataFormatString="{0} mm" />
                <asp:BoundField HeaderText="Longitud Patillas" DataField="Personalizado.LongitudPatillas" DataFormatString="{0} mm" />
                <asp:BoundField HeaderText="Estado" DataField="Estado" />
            </Columns>
        </asp:GridView>    
        <div class="form-group">
            <asp:Label ID="LblMaterial" runat="server" Text="Permisos" AssociatedControlID="ComboMaterial"></asp:Label>
            <asp:DropDownList ID="ComboMaterial" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="BtnEnviarImprimir" runat="server" CssClass="btn btn-primary m-1" OnClick="Imprimir_Click" />
        <uc1:LabelTexto runat="server" ID="LblArchivo" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
    <asp:Button ID="BtnActualizarArchivo" runat="server" CssClass="btn btn-warning m-1" OnClick="Archivo_Click" />
</asp:Content>

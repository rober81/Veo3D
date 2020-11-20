<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Gui.produccion.Ventas" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblListadoVentas" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive mx-auto">
                <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true">
                    <SelectedRowStyle CssClass="table-success" />
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Producto" DataField="Personalizado.Producto.Nombre" />
                        <asp:BoundField HeaderText="Archivo" DataField="Personalizado.Archivo" />
                        <asp:BoundField HeaderText="Tiempo Impresion" DataField="Personalizado.Producto.TiempoImpresion"  DataFormatString="{0} h"/>
                        <asp:BoundField HeaderText="Cantidad Material" DataField="Personalizado.Producto.CantidadMaterial" DataFormatString="{0} m" />
                        <asp:BoundField HeaderText="Ancho Montura" DataField="Personalizado.AnchoMontura" DataFormatString="{0} mm"/>
                        <asp:BoundField HeaderText="Puente" DataField="Personalizado.Puente" DataFormatString="{0} mm"/>
                        <asp:BoundField HeaderText="Ancho Cristales" DataField="Personalizado.AnchoCristales" DataFormatString="{0} mm"/>
                        <asp:BoundField HeaderText="Altura Cristales" DataField="Personalizado.AlturaCristales" DataFormatString="{0} mm"/>
                        <asp:BoundField HeaderText="Longitud Patillas" DataField="Personalizado.LongitudPatillas" DataFormatString="{0} mm"/>
                        <asp:BoundField HeaderText="Estado" DataField="Estado"/>
                    </Columns>
                </asp:GridView>
                <div class="form-group">
                    <asp:Label ID="LblMaterial" runat="server" Text="Permisos" AssociatedControlID="ComboMaterial"></asp:Label>
                    <asp:DropDownList ID="ComboMaterial" runat="server" CssClass="form-control" />
                </div>
                <uc1:LabelTexto runat="server" ID="LblArchivo" />
                <asp:Button ID="BtnActualizarArchivo" runat="server" CssClass="btn btn-secondary" OnClick="Archivo_Click" />
                <asp:Button ID="BtnEnviarImprimir" runat="server" CssClass="btn btn-primary" OnClick="Imprimir_Click" />
            </div>
        </div>
    </div>
</asp:Content>

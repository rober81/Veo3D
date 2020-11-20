<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="Gui.produccion.Presupuesto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblPresupuesto" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive mx-auto">
                <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true">
                    <SelectedRowStyle CssClass="table-success" />
                    <Columns>
                        <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
                        <asp:BoundField HeaderText="Nombre" DataField="Venta.Personalizado.Producto.Nombre" />
                        <asp:BoundField HeaderText="Archivo" DataField="Venta.Personalizado.Archivo" />
                        <asp:BoundField HeaderText="Material" DataField="Material.Marca"/>
                        <asp:BoundField HeaderText="Color" DataField="Material.Color"/>
                        <asp:BoundField HeaderText="Tipo" DataField="Material.Tipo"/>
                        <asp:BoundField HeaderText="Cant de Material" DataField="Venta.Personalizado.Producto.CantidadMaterial" />
                        <asp:BoundField HeaderText="Tiempo de Impresión" DataField="Venta.Personalizado.Producto.TiempoImpresion" DataFormatString="{0} h" />
                        <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
                        <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }"/>
                        <asp:BoundField HeaderText="Estado" DataField="Estado"/>
                    </Columns>
                </asp:GridView>
                <div class="form-group">
                    <asp:Label ID="LblMaterial" runat="server" Text="Permisos" AssociatedControlID="ComboMaterial"></asp:Label>
                    <asp:DropDownList ID="ComboMaterial" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="BtnCambiarMaterial" runat="server" CssClass="btn btn btn-secondary" OnClick="Cambiar_Click" />
                <asp:Button ID="BtnCalcular" runat="server" CssClass="btn btn btn-primary" OnClick="Calcular_Click" />
                <asp:Button ID="BtnImprimir" runat="server" CssClass="btn btn-success" OnClick="Primario_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Gui.produccion.Envios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblListadoEnvios" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive mx-auto">
                <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AutoGenerateSelectButton="true">
                    <SelectedRowStyle CssClass="table-success" />
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Producto" DataField="Personalizado.Producto.Nombre" />
                        <asp:BoundField HeaderText="Provincia" DataField="Provincia"/>
                        <asp:BoundField HeaderText="Localidad" DataField="Localidad"/>
                        <asp:BoundField HeaderText="Calle" DataField="Calle"/>
                        <asp:BoundField HeaderText="Puerta" DataField="Puerta"/>
                        <asp:BoundField HeaderText="Depto" DataField="Depto"/>
                        <asp:BoundField HeaderText="Estado" DataField="Estado"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

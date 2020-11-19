<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Prioridad.aspx.cs" Inherits="Gui.produccion.Prioridad" %>
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
                        <asp:BoundField HeaderText="Impresora" DataField="Impresora.Nombre" />
                        <asp:BoundField HeaderText="Prioridad" DataField="Prioridad" />
                        <asp:BoundField HeaderText="Id Impresión" DataField="Id" />
                        <asp:BoundField HeaderText="Cliente" DataField="Venta.Usuario" />
                        <asp:BoundField HeaderText="Fecha de Inicio" DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy }" />
                        <asp:BoundField HeaderText="Fecha de Finalización" DataField="FechaFin" DataFormatString="{0:dd/MM/yyyy }"/>
                        <asp:BoundField HeaderText="Estado" DataField="Estado"/>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="BtnBajarPrioridad" runat="server" CssClass="btn btn btn-secondary" OnClick="Bajar_Click" />
                <asp:Button ID="BtnSubirPrioridad" runat="server" CssClass="btn btn-primary" OnClick="Subir_Click" />
            </div>
        </div>
    </div>
</asp:Content>

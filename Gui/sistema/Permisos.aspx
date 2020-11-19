<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="Gui.produccion.Permisos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblAdminPermisos" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive mx-auto">
                <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
                    AutoGenerateSelectButton="false">
                    <SelectedRowStyle CssClass="table-success" />
                </asp:GridView>
                <div class="form-group">
                    <asp:Label ID="LblPermisos" runat="server" Text="Permisos" AssociatedControlID="ComboPermisos"></asp:Label>
                    <asp:DropDownList ID="ComboPermisos" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="BtnBaja" runat="server" CssClass="btn btn-secondary" OnClick="Baja_Click" />
                <asp:Button ID="BtnAgregar" runat="server" CssClass="btn btn-primary" OnClick="Agregar_Click" />
            </div>
        </div>
    </div>
</asp:Content>

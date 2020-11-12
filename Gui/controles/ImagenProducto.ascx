<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImagenProducto.ascx.cs" Inherits="Gui.controles.ImagenProducto" %>
<div class="col-lg-4 col-md-6 mb-4">
    <div class="card shadow h-100">
        <asp:HyperLink ID="IPLinkDetalle" runat="server">
            <asp:Image ID="IPImagenProd" runat="server" CssClass="card-img-top" />
        </asp:HyperLink>
        <div class="card-body">
            <h4 class="card-title">
                <asp:HyperLink ID="IPLinkDetalle2" runat="server">
                    <asp:Label ID="IPLblTitulo" runat="server" Text="Label"></asp:Label>
                </asp:HyperLink>
            </h4>
            <h5>
                <asp:Label ID="IPLblPrecio" runat="server" Text="Label"></asp:Label>
            </h5>
            <p class="card-text">
                <asp:Label ID="IPLblTexto" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div class="card-footer">
            <small class="text-muted">
                <asp:Label ID="IPLblEstrellas" runat="server" Text="Label"></asp:Label>
            </small>
        </div>
    </div>
</div>

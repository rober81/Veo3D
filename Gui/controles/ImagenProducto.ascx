<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImagenProducto.ascx.cs" Inherits="Gui.controles.ImagenProducto" %>
<div class="col-lg-4 col-md-6 mb-4">
    <div class="card h-100">
        <asp:HyperLink ID="HyperLink2" runat="server">
            <asp:Image ID="Image1" runat="server" CssClass="card-img-top" />
        </asp:HyperLink>
        <div class="card-body">
            <h4 class="card-title">
                <asp:HyperLink ID="HyperLink1" runat="server">
                    <asp:Label ID="lblTitulo" runat="server" Text="Label"></asp:Label>
                </asp:HyperLink>
            </h4>
            <h5>
                <asp:Label ID="lblPrecio" runat="server" Text="Label"></asp:Label>
            </h5>
            <p class="card-text">
                <asp:Label ID="lblTexto" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div class="card-footer">
            <small class="text-muted">
                <asp:Label ID="lblEstrellas" runat="server" Text="Label"></asp:Label>
            </small>
        </div>
    </div>
</div>

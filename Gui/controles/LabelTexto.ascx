<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabelTexto.ascx.cs" Inherits="Gui.controles.LabelTexto" %>
<div class="form-group">
    <asp:Label ID="lbl" runat="server" Text="Etiqueta" AssociatedControlID="txt"></asp:Label>
    <asp:TextBox ID="txt" runat="server" CssClass="form-control"></asp:TextBox>
</div>

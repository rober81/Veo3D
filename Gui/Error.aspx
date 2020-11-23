<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Gui.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="404">404</div>
            <p class="lead text-gray-800 mb-5">Page Not Found</p>
            <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
            <a href="index.aspx">&larr; Back to Index</a>
          </div>

        </div>
</asp:Content>

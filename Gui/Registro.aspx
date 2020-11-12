<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Gui.Registro" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="card shadow w-50 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblRegistroUsuario" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive-md w-75 mx-auto">
                <uc1:labeltexto runat="server" id="LblUsuario" />
                <uc1:labeltexto runat="server" id="LblContrasenia" />
                <uc1:labeltexto runat="server" id="LblContraseniaRepetir" />
                <uc1:labeltexto runat="server" id="LblCorreo" />
                <uc1:labeltexto runat="server" id="INombre" />
                <uc1:labeltexto runat="server" id="LblApellido" />
                <uc1:labeltexto runat="server" id="LblDni" Esnumero ="true"/>
                <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn-danger" />
                <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success" />
                <asp:Label ID="toast" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

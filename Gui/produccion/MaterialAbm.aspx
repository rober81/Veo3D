<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="MaterialAbm.aspx.cs" Inherits="Gui.produccion.MaterialAbm" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow w-50 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblAdminMaterial" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive-md w-75 mx-auto">
                <uc1:labeltexto runat="server" id="MID" esvalidado="false" />
                <uc1:labeltexto runat="server" id="MMarca" />
                <uc1:labeltexto runat="server" id="MColor" />
                <uc1:labeltexto runat="server" id="MTipo" />
                <uc1:labeltexto runat="server" id="MPeso" esnumero="true" />
                <uc1:labeltexto runat="server" id="MMetros" esnumero="true" />
                <uc1:labeltexto runat="server" id="MStock" esnumero="true" />
                <uc1:labeltexto runat="server" id="MCostoMetros" esdecimal="true" />
                <asp:Button ID="BtnBaja" runat="server" Text="Cancelar" OnClick="Baja_Click" CssClass="btn btn-danger" />
                <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" CssClass="btn btn-warning" />
                <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="Aceptar_Click" CssClass="btn btn-success" />
                <asp:Label ID="toast" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

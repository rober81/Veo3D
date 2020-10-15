<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" Inherits="Gui.produccion.Bitacora" %>
<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblListarBitacora" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="form-group w-75 mx-auto">
                <uc1:labeltexto runat="server" id="LblUsuario" />
                <uc1:labeltexto runat="server" id="LtFechaDesde" />
                <uc1:labeltexto runat="server" id="LtFechaHasta" />
                <asp:Button ID="BtnBuscar" runat="server" CssClass="btn btn-primary align-middle" OnClick="Btn_Click" />
            </div>
            <div class="table-responsive-md w-75 mx-auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true">
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

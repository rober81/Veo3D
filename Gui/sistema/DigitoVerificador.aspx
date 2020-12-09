<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="DigitoVerificador.aspx.cs" Inherits="Gui.produccion.DigitoVerificador" %>

<%@ Register Src="~/controles/Mensaje.ascx" TagPrefix="uc1" TagName="Mensaje" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardTitulo" runat="server">
    <asp:Label ID="LblAdminDigitoVerificador" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CardBody" runat="server">
    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true" OnRowDataBound="Grilla_OnRowDataBound"
        AutoGenerateSelectButton="false">
        <SelectedRowStyle CssClass="table-success" />
    </asp:GridView>
    <div class="form-group">
        <asp:Label ID="LblTabla" runat="server" Text="Tabla" AssociatedControlID="ComboTabla"></asp:Label>
        <asp:DropDownList ID="ComboTabla" runat="server" CssClass="form-control" />
        <br />
        <div class="">
            <asp:Button ID="BtnGenerarDigito" runat="server" CssClass="btn btn-danger m-1" OnClick="Generar_Click" />
            <asp:Button ID="BtnVerificarDigito" runat="server" CssClass="btn btn-success m-1" OnClick="Verificar_Click" />
            <uc1:Mensaje runat="server" ID="Mensaje" />
        </div>
    </div>
    <asp:TextBox ID="textboxlog" runat="server" TextMode="MultiLine" ReadOnly="true" Height="220" Width="800"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
</asp:Content>

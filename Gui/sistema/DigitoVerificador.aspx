<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="DigitoVerificador.aspx.cs" Inherits="Gui.produccion.DigitoVerificador" %>

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
            <asp:Button ID="BtnGenerarDigito" runat="server" CssClass="btn btn-danger" OnClick="Generar_Click" />
            <asp:Button ID="BtnVerificarDigito" runat="server" CssClass="btn btn-success" OnClick="Verificar_Click" />
        </div>
    </div>
    <asp:TextBox ID="textboxlog" runat="server" TextMode="MultiLine" ReadOnly="true" Height="220" Width="800"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CardBotones" runat="server">
</asp:Content>

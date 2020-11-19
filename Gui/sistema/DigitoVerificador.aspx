<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="DigitoVerificador.aspx.cs" Inherits="Gui.produccion.DigitoVerificador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow w-75 mx-auto my-auto">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                <asp:Label ID="LblAdminDigitoVerificador" runat="server"></asp:Label>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive mx-auto">
                <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
                    AutoGenerateSelectButton="false">
                    <SelectedRowStyle CssClass="table-success" />
                </asp:GridView>
                <div class="form-group">
                    <asp:Label ID="LblTabla" runat="server" Text="Tabla" AssociatedControlID="ComboTabla"></asp:Label>
                    <asp:DropDownList ID="ComboTabla" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="BtnGenerarDigito" runat="server" CssClass="btn btn-secondary" OnClick="Generar_Click" />
                <asp:Button ID="BtnVerificarDigito" runat="server" CssClass="btn btn-primary" OnClick="Verificar_Click" />
                <br />
                <br />
                <asp:TextBox ID="textboxlog" runat="server" TextMode="MultiLine" ReadOnly="true" Height="220" Width="800"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>

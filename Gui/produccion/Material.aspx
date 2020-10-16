<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Material.aspx.cs" Inherits="Gui.produccion.Material" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TituloPagina2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="card shadow w-75 mx-auto my-auto">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">
                  <asp:Label ID="LblAdminMaterial" runat="server"></asp:Label>
              </h6>
            </div>
            <div class="card-body">       
                <div class="table-responsive mx-auto">
                    <asp:GridView ID="Grilla" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"
                        AutoGenerateSelectButton="true">
                        <SelectedRowStyle CssClass="table-success"/>
                    </asp:GridView>
                    <asp:Button ID="BtnModificar" runat="server" CssClass="btn btn-secondary" OnClick="Modificar_Click"/>
                    <asp:Button ID="BtnNuevo" runat="server" CssClass="btn btn-primary" OnClick="Nuevo_Click"/>
                </div>
            </div> 
        </div>
</asp:Content>

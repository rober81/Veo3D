<%@ Page Title="" Language="C#" MasterPageFile="~/masters/produccion.Master" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" Inherits="Gui.produccion.Bitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TituloPagina2" runat="server">
    <h1 class="h3 mb-4 text-gray-800">Listar Bitácora</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example2</h6>
            </div>
            <div class="card-body">
                <div class='col-sm-6'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' class="form-control" />
                            <asp:TextBox ID="TxtFechaDesde" runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-addon">
                                <i class="far fa-calendar-alt"></i>
                            </span>
                        </div>
                    </div>
                </div>
                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                <asp:Label ID="Label2" runat="server" Text="Fecha Desde"></asp:Label>
       
                <asp:Label ID="Label3" runat="server" Text="Fecha Hasta"></asp:Label>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="2" CssClass="table table-bordered" AutoGenerateColumns="true">
                    </asp:GridView>
                </div>
            </div> 
        </div>

</asp:Content>

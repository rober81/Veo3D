<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="Resumen.aspx.cs" Inherits="Gui.Resumen" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="card shadow mt-4">
                    <div class="card-body">
                        <h2 class="card-title">
                            <asp:Label ID="LblFinalizadoExitosamente" runat="server" Text="Label"></asp:Label>
                        </h2>
                        <h4>
                            <asp:Label ID="LblTitulo" runat="server"></asp:Label>
                            -
                            <asp:Label ID="LblTexto" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LblPrecio" runat="server"></asp:Label>
                        </h4>
                        <div class="card-text">
                            <div class="row">
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblAnchoMontura" DesHabilitado="true" />
                                </div>
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblPuente" DesHabilitado="true" />
                                </div>
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblLongitudPatillas" DesHabilitado="true" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblAnchoCristales" DesHabilitado="true" />
                                </div>
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblAlturaCristales" DesHabilitado="true" />
                                </div>
                                <div class="col">
                                    <uc1:LabelTexto runat="server" ID="LblColor" DesHabilitado="true" />
                                </div>
                            </div>
                        </div>
                    
                    <div class="row">
                        <div class="col-sm-8">
                            <uc1:LabelTexto runat="server" ID="LblCalle" DesHabilitado="true" />
                        </div>
                        <div class="col">
                            <uc1:LabelTexto runat="server" ID="LblPuerta" DesHabilitado="true" />
                        </div>
                        <div class="col">
                            <uc1:LabelTexto runat="server" ID="LblDepto" DesHabilitado="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <uc1:LabelTexto runat="server" ID="LblProvincia" DesHabilitado="true" />
                        </div>
                        <div class="col">
                            <uc1:LabelTexto runat="server" ID="LblLocalidad" DesHabilitado="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <asp:Button ID="BtnFactura" runat="server" CssClass="btn btn-success m-1" OnClick="PDF_Click" />
                            <asp:Button ID="BtnVolver" runat="server" OnClick="Volver_Click" CssClass="btn btn-primary m-1" />
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>

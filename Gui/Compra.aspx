<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Gui.Compra" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="card shadow mt-4">
                    <div class="card-body">
                        <h3 class="card-title">
                            <asp:Label ID="LblResumen" runat="server" Text="Label"></asp:Label>
                        </h3>
                        <h4 class="card-text">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card shadow card-outline-secondary my-4">
                    <div class="card-header">
                        <asp:Label ID="LblDireccion" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <uc1:LabelTexto runat="server" ID="LblCalle" EsValidado="true"/>
                            </div>
                            <div class="col">
                                <uc1:LabelTexto runat="server" ID="LblPuerta" />
                            </div>
                            <div class="col">
                                <uc1:LabelTexto runat="server" ID="LblDepto" EsValidado="false"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <uc1:LabelTexto runat="server" ID="LblProvincia" />
                            </div>
                            <div class="col">
                                <uc1:LabelTexto runat="server" ID="LblLocalidad" />
                            </div>
                             <div class="col">
                                <uc1:LabelTexto runat="server" ID="LblCodigoPostal" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <img src="img/mercadopago.png" height="91" width="228" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col text-center">
                                <asp:Button ID="BtnMercadopago" runat="server" OnClick="Comprar_Click" CssClass="btn btn-primary fa-align-right" />
                                <asp:Label ID="LblNoLogueado" text="Debe Loguearse para Continuar" runat="server"></asp:Label>
                                <asp:Label ID="LblNoLogueadoCliente" text="Debe Loguearse para Continuar" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

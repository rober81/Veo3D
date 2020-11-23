<%@ Page Title="" Language="C#" MasterPageFile="~/masters/ventas.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gui.web.Login" %>

<%@ Register Src="~/controles/LabelTexto.ascx" TagPrefix="uc1" TagName="LabelTexto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CardBody" runat="server">
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Login</h5>
                        
                                <div class="form-label-group">
                                    <asp:Label ID="LblUsuario" runat="server" Text="Correo Electronico" AssociatedControlID="txtUsuario"></asp:Label>
                                    <asp:TextBox ID="TxtUsuario" runat="server" CssClass="form-control" placeholder="Usuario" required="true" autofocus="true"></asp:TextBox>
                                </div>

                                <div class="form-label-group">
                                    <asp:Label ID="LblContrasenia" runat="server" Text="Contraseña" AssociatedControlID="txtContrasenia"></asp:Label>
                                     <asp:TextBox ID="TxtContrasenia" TextMode="Password" runat="server" CssClass="form-control" placeholder="Contraseña" required="true"></asp:TextBox>
                                </div>

                                <div class="custom-control custom-checkbox mb-3">
                                    <asp:CheckBox ID="ChkPass" runat="server" CssClass="form-check-input" autoPostBack="false"/>
                                    <asp:Label ID="LblRecordarPass" runat="server" Text="Label" AssociatedControlID="chkPAss" CssClass="form-check-label"></asp:Label>
                                </div>
                                <asp:Button ID="BtnAceptar" runat="server" OnClick="Button1_Click" CssClass="btn btn-lg btn-primary btn-block text-uppercase"/>
                                <hr class="my-4">                    
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

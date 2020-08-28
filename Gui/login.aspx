<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Gui.web.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Veo3D</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.bundle.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class=".container">
    <form id="form1" runat="server" class="form-signin">
        <div class=".container">
            <asp:Label id="login1" runat="server" Text="Por favor realizar el Login" CssClass="h3 mb-3 font-weight-normal"></asp:Label>
            <div class="form-group .col-4">
                <asp:Label AssociatedControlID="usuario" runat="server" Text="Usuario"></asp:Label>
                <asp:TextBox ID="usuario" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group .col-4">
                <asp:Label AssociatedControlID="contrasenia" runat="server" Text="Contraseña" CssClass="sr-only"></asp:Label>
                <asp:TextBox ID="contrasenia" runat="server"  CssClass="form-control" ></asp:TextBox>
             </div>
             <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="btn btn-success" OnClick="loginbtn_Click" />
             <asp:Button ID="cancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger"/>
        </div>
    </form>
</body>
</html>

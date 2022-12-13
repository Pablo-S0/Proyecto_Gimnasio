<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loggin.aspx.cs" Inherits="Proyecto_Gimnasio.Loggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/boton.css" rel="stylesheet" />
    <link href="CSS/Loggin.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Email:<br />
            <asp:TextBox ID="TEmail" runat="server"></asp:TextBox>
&nbsp;<br />
            <br />
            Clave:<br />
            <asp:TextBox ID="TClave" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" style="color: #CC0000"></asp:Label>
            <br />
            <br />
            <asp:Button ID="BIngresar" Class="button button1" runat="server" OnClick="BIngresar_Click" Text="Ingresar" />
        </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Regular.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_Gimnasio.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            color: #006600;
            font-size: xx-large;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        <br />
        <asp:Image ID="Image1" runat="server" Height="375px" ImageUrl="~/Imagenes/images.jpg" Width="637px" />
    </p>
    <p class="auto-style1">
        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Label"></asp:Label>
    </p>
</asp:Content>

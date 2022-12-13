<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Proyecto_Gimnasio.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            text-align: center;
            font-size: xx-small;
        }
        .auto-style4 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        <span class="auto-style2">Bienvenido Gimnasio Power</span><br />
    <asp:Image ID="Image1" runat="server" Height="342px" ImageUrl="~/Imagenes/images.jpg" Width="725px" />
</p>
<p class="auto-style1">
    <asp:Label ID="Label1" runat="server" style="color: #990099" CssClass="auto-style4"></asp:Label>
</p>
</asp:Content>

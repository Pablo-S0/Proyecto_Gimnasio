<%@ Page Title="" Language="C#" MasterPageFile="~/Regular.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="Proyecto_Gimnasio.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 412px;
            height: 83px;
        }
        .auto-style4 {
            height: 83px;
        }
        .auto-style5 {
            width: 313px;
            height: 83px;
        }
        .auto-style6 {
            width: 315px;
            height: 83px;
        }
        .auto-style7 {
            width: 408px;
        }
        .auto-style8 {
            width: 320px;
        }
        .auto-style9 {
            width: 314px;
        }
        .auto-style10 {
            border: solid 2px black;
            min-width: 80%;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style13 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        <asp:Label ID="LFacturacion" runat="server" Text="Facturacion"></asp:Label>
    </p>
    <p>
        <asp:Image ID="Image1" runat="server" Height="301px" ImageUrl="~/Imagenes/Facturar.png" Width="568px" />
    </p>
    <table class="auto-style2">
        <tr>

            <td class="auto-style3">Codigo Producto:<br />
&nbsp;<asp:TextBox ID="txtCodigo" runat="server" OnTextChanged="txtCodigo_TextChanged" TextMode="Number"></asp:TextBox>
                <asp:Button ID="BBuscar" runat="server" OnClick="Button1_Click" Text="Buscar" />
                <br />
            </td>
            <td class="auto-style6">Producto<br />
                <asp:Label ID="producto" runat="server" OnDataBinding="Page_Load"></asp:Label>
                <br />
            </td>
            <td class="auto-style5"><br />
                Precio:<br />
                <asp:TextBox ID="TPrecio" runat="server" OnTextChanged="TPrecio_TextChanged" Width="128px"></asp:TextBox>
                
            </td>
            <td class="auto-style4">Cantidad:<br />
                <asp:TextBox ID="TCantidad" runat="server" TextMode="Number"></asp:TextBox>
                 <br />
            </td>
        </tr>

    </table>
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style7">Cliente:<br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Clientes]"></asp:SqlDataSource>
            </td>
            <td class="auto-style8">
                <asp:Button ID="BIngresar" runat="server" OnClick="BIngresar_Click" Text="Ingreasr" />
            </td>
            <td class="auto-style9">
                <asp:Button ID="BFacturar" runat="server" OnClick="BFacturar_Click" Text="Facturar" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
   <asp:GridView ID="GridView1" runat="server" CssClass="auto-style10" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" Width="1335px">
            </asp:GridView>
    <table class="auto-style2">
        <tr>
            <td class="auto-style11">Sub Total<br />
                <asp:Label ID="LSubtotal" runat="server" CssClass="auto-style13"></asp:Label>
            </td>
            <td class="auto-style11">IVA<br />
                <asp:Label ID="LIva" runat="server" CssClass="auto-style13"></asp:Label>
            </td>
            <td class="auto-style11">Total<br />
                <asp:Label ID="LTotalFinal" runat="server" CssClass="auto-style13"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

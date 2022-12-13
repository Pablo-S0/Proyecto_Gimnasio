<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Provincia.aspx.cs" Inherits="Proyecto_Gimnasio.Provincia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 733px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            margin-left: 191px;
        }
        .auto-style5 {
            width: 733px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Provincias<br />
        <asp:Image ID="Image1" runat="server" Height="336px" ImageUrl="~/Imagenes/Cantones y distritos.png" Width="450px" />
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">
                <div class="auto-style3">
                <br />
                Nombre:&nbsp; <asp:TextBox ID="TNombre" runat="server"></asp:TextBox>
                    &nbsp;
                <asp:Button ID="BAgregar" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                    <br />
&nbsp;<asp:DropDownList ID="DDLProvincias" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
                    </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT [Codigo], [Nombre] FROM [Provincia]"></asp:SqlDataSource>
                <div class="auto-style3">
&nbsp;<asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" />
&nbsp;
                <asp:Button ID="BBorrar"  runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                <br />
                </div>
            </td>
            <td class="auto-style3">
                <div class="auto-style3">
                    <br />
                    Buscar provincias<br />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Todos</asp:ListItem>
                        <asp:ListItem>Buscar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TBuscar" runat="server" Width="191px"></asp:TextBox>
                    <asp:Button ID="BBuscar" runat="server" Text="Buscar" OnClick="BBuscar_Click" />
                    <br />
                </div>
                <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Proyecto_Gimnasio.Articulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <link href="CSS/boton.css" rel="stylesheet" />
    <style type="text/css">
        
        .auto-style1 {
            width: 100%;
            background-color:gray;
        }
        .auto-style2 {
            width: 682px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            margin-left: 209px;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <p>
    Articulos<br />
    <asp:Image ID="Image1" runat="server" Height="444px" Width="660px" ImageUrl="~/Imagenes/Suplementos.jpg" />
</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Nombre:
                <asp:TextBox ID="TNombre" runat="server"></asp:TextBox>
                <br />
                <br />
                Precio:&nbsp;&nbsp;
                <asp:TextBox ID="TPrecio" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
&nbsp;&nbsp;
                <asp:Button ID="BModificar" CssClass="button button2" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="BEliminar" CssClass="button button3"  runat="server" Text="Eliminar" OnClick="BEliminar_Click" />
            </td>
            <td class="auto-style3">
                <div class="auto-style3">
                    Buscar producto:<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" class="dropdown">
                        <asp:ListItem>Todos</asp:ListItem>
                        <asp:ListItem>Buscar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TBuscar" runat="server" Width="208px"></asp:TextBox>
                    <asp:Button ID="BBuscar" CssClass="button button4"  runat="server" Text="Buscar" OnClick="BBuscar_Click" />
                <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

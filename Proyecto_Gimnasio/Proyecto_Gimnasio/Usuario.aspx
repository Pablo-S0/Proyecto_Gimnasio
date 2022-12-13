<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Proyecto_Gimnasio.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            color: #0066CC;
        }
        .auto-style2 {
            width: 100%;
            height: 179px;
        }
        .auto-style3 {
            width: 766px;
            text-align: left;
        height: 112px;
    }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 766px;
            height: 17px;
            text-align: center;
        }
        .auto-style6 {
            height: 17px;
        }
        .auto-style7 {
            text-align: center;
        height: 112px;
    }
        .auto-style8 {
            margin-left: 167px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
        <div class="auto-style4">
            <span class="auto-style1">Usuarios</span><br />
    <asp:Image ID="Image1" runat="server" Height="326px" ImageUrl="~/Imagenes/download.png" Width="474px" />
            <br />
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">Email:&nbsp;
                    <asp:TextBox ID="TEmail" runat="server"></asp:TextBox>
                    <br />
                    Clave:&nbsp;
                    <asp:TextBox ID="TClave" runat="server"></asp:TextBox>
                    <br />
                    Nombre:&nbsp;
                    <asp:TextBox ID="TNombre" runat="server"></asp:TextBox>
                    <br />
                    Apellido:&nbsp;
                    <asp:TextBox ID="TApellido" runat="server"></asp:TextBox>
                    <br />
                    Telefono:&nbsp;
                    <asp:TextBox ID="TTelefono" runat="server"></asp:TextBox>
                    <br />
                    Tipo de Usuario:&nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Regular</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BAgregar" runat="server" Text="Agregar" Width="67px" OnClick="BAgregar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BEliminar" runat="server" Text="Eliminar" OnClick="BEliminar_Click" />
                </td>
                <td class="auto-style7">Buscar por email del usuario:<br />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Buscar</asp:ListItem>
                        <asp:ListItem>Todos</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TBuscar" runat="server" Width="240px"></asp:TextBox>
                    <asp:Button ID="BBuscar" runat="server" OnClick="BBuscar_Click" Text="Buscar" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    </td>
            </tr>
        </table>
<br />

</asp:Content>

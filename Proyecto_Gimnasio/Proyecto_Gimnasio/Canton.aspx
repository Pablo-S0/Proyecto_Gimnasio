<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Canton.aspx.cs" Inherits="Proyecto_Gimnasio.Canton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <link href="CSS/boton.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: gray;
        }
        .auto-style2 {
            width: 768px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 768px;
            text-align: left;
        }
        .auto-style6 {
            margin-left: 157px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Cantones<br />
        <asp:Image ID="Image1" runat="server" Height="366px" ImageUrl="~/Imagenes/Cantones y distritos.png" Width="563px" />
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">
                <div class="auto-style3">
                <br />
                Provincia:&nbsp;&nbsp; <asp:DropDownList ID="DDLProvincia" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo" AutoPostBack="True">
                </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT [Nombre], [Codigo] FROM [Provincia]"></asp:SqlDataSource>
                <div class="auto-style3">
                    <div class="auto-style3">
                Nombre Canton:
                <asp:TextBox ID="TCanton" runat="server"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                        <br />
                        Modificar o Eliminar Canton Existente:
                        <asp:DropDownList ID="DDLCantones" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="Codigo">
                        </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecanton" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLProvincia" Name="codigoProvincia" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                <asp:Button ID="BModificar" CssClass="button button2" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                <asp:Button ID="BBorrar" CssClass="button button3" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                </div>
            </td>
            <td class="auto-style3">
                <br />
                Buscar canton<br />
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>Todos</asp:ListItem>
                    <asp:ListItem>Buscar</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TBuscar" runat="server"></asp:TextBox>
                <asp:Button ID="BBuscar" CssClass="button button4" runat="server" Text="Buscar" OnClick="BBuscar_Click" />
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

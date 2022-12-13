<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Distrito.aspx.cs" Inherits="Proyecto_Gimnasio.Distrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 737px;
        }
        .auto-style3 {
            width: 737px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Distritos<br />
        <asp:Image ID="Image1" runat="server" Height="382px" ImageUrl="~/Imagenes/Cantones y distritos.png" Width="534px" />
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">
                <div class="auto-style4">
                <br />
                Provincia:&nbsp;
                <asp:DropDownList ID="DDLProvincia" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
                </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
                <div class="auto-style4">
                <br />
                Canton:
                <asp:DropDownList ID="DDLCanton" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre1" DataValueField="Codigo">
                </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecanton" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLProvincia" Name="codigoProvincia" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style4">
                <br />
                Nombre Distrito:
                <asp:TextBox ID="TNombre" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="BAgregar" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                    <br />
                    <br />
                    Modificar o Eliminar Distrito Existente:&nbsp;
                    <asp:DropDownList ID="DDLDistrito" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="Codigo">
                    </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecDistrito" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLCanton" Name="codigoCanton" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" Width="78px" />
                <asp:Button ID="BBorrar" runat="server" Text="Eliminar" OnClick="BBorrar_Click" />
            </td>
            <td>Buscar Distrito<br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Todos</asp:ListItem>
                    <asp:ListItem>Buscar</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TBuscar" runat="server"></asp:TextBox>
                <asp:Button ID="BBuscar" runat="server" Text="Buscar" OnClick="BBuscar_Click" />
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

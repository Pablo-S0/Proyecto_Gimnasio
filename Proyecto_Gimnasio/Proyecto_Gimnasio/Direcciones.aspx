<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Direcciones.aspx.cs" Inherits="Proyecto_Gimnasio.Direcciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 689px;
        height: 23px;
    }
    .auto-style3 {
        text-align: center;
    }
    .auto-style4 {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Direcciones de Usuario:</p>
<p>
    <asp:Image ID="Image1" runat="server" Height="403px" ImageUrl="~/Imagenes/Cantones y distritos.png" Width="716px" />
</p>
<table class="auto-style1">
    <tr>
        <td class="auto-style3" colspan="2">
            <br />
            Provincia:&nbsp;&nbsp; <asp:DropDownList ID="DProvincia" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
            <br />
            Canton:&nbsp;&nbsp;
            <asp:DropDownList ID="DCanton" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecanton" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DProvincia" Name="codigoProvincia" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Distrito:&nbsp;&nbsp;
            <asp:DropDownList ID="DDistrito" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecDistrito" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DCanton" Name="codigoCanton" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Usuario:&nbsp;
            <asp:DropDownList ID="DUsuario" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Clientes]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="BAgregar" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
&nbsp;
            <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" />
&nbsp;
            <asp:Button ID="BEliminar" runat="server" Text="Eliminar" OnClick="BEliminar_Click" />
            <br />
&nbsp;<br />
            Metodo Busqueda: <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Todos</asp:ListItem>
                <asp:ListItem>Buscar</asp:ListItem>
            </asp:DropDownList>
&nbsp;
            <asp:Button ID="BBuscar" runat="server" OnClick="BBuscar_Click" Text="Buscar" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td class="auto-style2"></td>
        <td class="auto-style4"></td>
    </tr>
</table>
</asp:Content>

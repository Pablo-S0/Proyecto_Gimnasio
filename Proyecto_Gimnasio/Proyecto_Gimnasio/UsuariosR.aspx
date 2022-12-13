<%@ Page Title="" Language="C#" MasterPageFile="~/Regular.Master" AutoEventWireup="true" CodeBehind="UsuariosR.aspx.cs" Inherits="Proyecto_Gimnasio.UsuariosR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Gridview.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 768px;
    }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 768px;
            text-align: center;
        }
        .auto-style5 {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
            margin-left: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Perfil</p>
<p>
    <asp:Image ID="Image1" runat="server" Height="346px" ImageUrl="~/Imagenes/CBUM.jpg" Width="326px" />
</p>
<table class="auto-style1">
    <tr>
        <td class="auto-style4">
            <div class="auto-style3">
                Nombre:&nbsp;&nbsp;
            <asp:TextBox ID="TNombre" runat="server"></asp:TextBox>
            <br />
            Apellido:&nbsp;
            <asp:TextBox ID="TApellido" runat="server"></asp:TextBox>
            <br />
            Telefono:&nbsp;
            <asp:TextBox ID="TTelefono" runat="server"></asp:TextBox>
            <br />
            Clave:&nbsp;
            <asp:TextBox ID="TClave" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="BModificar" runat="server" OnClick="BModificar_Click" Text="Modificar" />
                <br />
                <br />
                Provincia:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
            <div class="auto-style3">
                <br />
                Canton:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Codigo">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecanton" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="codigoProvincia" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="auto-style3">
                <br />
                Distrito:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="Codigo">
                </asp:DropDownList>
                <br />
                <br />
            </div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="selecDistrito" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="codigoCanton" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="BMDireccion" runat="server" OnClick="BMDireccion_Click" Text="Modificar Direccion" />
            <div class="auto-style3">
            <br />
            </div>
        </td>
        <td>
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style5" PagerStyle-CssClass="pager"
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

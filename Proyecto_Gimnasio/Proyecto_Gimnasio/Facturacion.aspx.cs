using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Gimnasio
{
    public partial class Facturacion : System.Web.UI.Page
    {

        float Iva;
        float subtotal;
        float total;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        protected void txtCodigo_TextChanged(object sender, EventArgs e)
        {
            ClsProducto.BuscarProducto(Int32.Parse(txtCodigo.Text));
            TPrecio.Text = ClsProducto.precio.ToString();
        }

        protected void TPrecio_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClsProducto.BuscarProducto(Int32.Parse(txtCodigo.Text));
            producto.Text = ClsProducto.nombre;
            TPrecio.Text = ClsProducto.precio.ToString();
            LlenarGrid();
        }

        protected void BIngresar_Click(object sender, EventArgs e)
        {
            ClsProducto.Cantidad = Int32.Parse(TCantidad.Text);

            string constr = ConfigurationManager.ConnectionStrings["GimnasioConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("exec Maefactura "+DropDownList1.SelectedValue+","+ClsProducto.precio))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            LlenarGrid();
        }

        protected void BFacturar_Click(object sender, EventArgs e)
        {
            subtotal= ClsProducto.precio * ClsProducto.Cantidad;
            Iva = subtotal * 0.13f;
            total = subtotal + Iva;
            LSubtotal.Text = subtotal.ToString();
            LIva.Text = Iva.ToString();
            LTotalFinal.Text = total.ToString();

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GimnasioConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Mae_Factura"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }

        }
    }
}
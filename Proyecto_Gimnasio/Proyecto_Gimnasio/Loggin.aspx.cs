using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Gimnasio
{
    public partial class Loggin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BIngresar_Click(object sender, EventArgs e)
        {
            ClsUsuario.Email = TEmail.Text;
            ClsUsuario.clave = TClave.Text;

            if (ClsUsuario.ValidarLogin(ClsUsuario.Email,ClsUsuario.clave) > 0)
            {
                if (ClsUsuario.Tipo.Equals("Admin"))
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
                }
               
            }
            else
            {
                Label1.Text = "Email o Clave incorrectos";

            }
        }
    }
}
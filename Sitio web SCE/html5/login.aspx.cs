using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sitio_web_SCE.html5
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            //llenar objeto usuario
            CADUsuario us = new CADUsuario();
            DTOUsuario dtus = new DTOUsuario();
            dtus.Usuario = txtUsuario.Text;
            dtus.Contraseña = txtContraseña.Text;
            int resul = us.AutenticarUsuario(dtus);
            if (resul == 1)
            {
                Response.Redirect("inicio.aspx");
            }else{
                //Response.Write("<script> alert('Su nombre de usuario o contraseña son incorrectos'); </script>");
                Response.Redirect("login.aspx");
            }
            
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../index.aspx");
        }
    }
}
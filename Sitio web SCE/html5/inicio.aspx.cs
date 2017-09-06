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
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnVolverSi.Visible = false;
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            DTOUsuario Usu = new DTOUsuario();
            Usu.Codigo = int.Parse(txtCodigoC.Text);
            Usu.Nombre = txtNombreC.Text;
            Usu.Apellido = txtApellidoC.Text;
            Usu.Tipo_doc = ddlTipo_documento.Text;
            Usu.Numero_doc = int.Parse(txtNumero_documentoC.Text);
            Usu.Edad = int.Parse(txtEdadC.Text);
            Usu.Sexo = ddlSexoC.Text;
            Usu.Telefono = int.Parse(txtTelefonoC.Text);
            Usu.Correo = txtCorreoC.Text;
            Usu.Usuario = txtUsuarioC.Text;
            Usu.Contraseña = txtContraseñaC.Text;
            Usu.Codigo_rol = int.Parse(ddlRol.Text);
            CADUsuario datos = new CADUsuario();
            bool existe = datos.insertarUsuario(Usu);
            Response.Redirect("inicio.aspx");
        }

        protected void btnModificarC_Click(object sender, EventArgs e)
        {
            DTOUsuario Usu = new DTOUsuario();
            Usu.Codigo = int.Parse(txtCodigoC.Text);
            Usu.Nombre = txtNombreC.Text;
            Usu.Apellido = txtApellidoC.Text;
            Usu.Tipo_doc = ddlTipo_documento.Text;
            Usu.Numero_doc = int.Parse(txtNumero_documentoC.Text);
            Usu.Edad = int.Parse(txtEdadC.Text);
            Usu.Sexo = ddlSexoC.Text;
            Usu.Telefono = int.Parse(txtTelefonoC.Text);
            Usu.Correo = txtCorreoC.Text;
            Usu.Usuario = txtUsuarioC.Text;
            Usu.Contraseña = txtContraseñaC.Text;
            Usu.Codigo_rol = int.Parse(ddlRol.Text);
            CADUsuario datos = new CADUsuario();
            bool existe = datos.modificarUsuario(Usu);
            Response.Redirect("inicio.aspx");
        }

        protected void btnListarC_Click(object sender, EventArgs e)
        {
            DTOUsuario dts = new DTOUsuario();
            CADUsuario datos = new CADUsuario();
            gvUsuario.DataSource = datos.ConsultarUsuario(dts);
            gvUsuario.DataBind();
            Response.Redirect("inicio.aspx");
        }

        protected void btnGuardarSi_Click(object sender, EventArgs e)
        {
            DTOSilla Si = new DTOSilla();
            Si.Codigo = int.Parse(txtCodigoSi.Text);
            Si.Codigo_tipo = int.Parse(ddltipo_s.Text);
            Si.Material = txtMaterialSi.Text;
            Si.Tamaño = txtTamañoSi.Text;
            Si.Codigo_sensor = int.Parse(ddlTipo_sen.Text);
            Si.Codigo_arduino = int.Parse(ddlTipo_ard.Text);
            CADSilla datos = new CADSilla();
            bool existe = datos.Insertar_silla(Si);
            Response.Redirect("inicio.aspx#work");

        }

        protected void btnModificarSi_Click(object sender, EventArgs e)
        {
            DTOSilla Si = new DTOSilla();
            Si.Codigo = int.Parse(txtCodigoSi.Text);
            Si.Codigo_tipo = int.Parse(ddltipo_s.Text);
            Si.Material = txtMaterialSi.Text;
            Si.Tamaño = txtTamañoSi.Text;
            Si.Codigo_sensor = int.Parse(ddlTipo_sen.Text);
            Si.Codigo_arduino = int.Parse(ddlTipo_ard.Text);
            CADSilla datos = new CADSilla();
            bool existe = datos.Modificar_Silla(Si);
            Response.Redirect("inicio.aspx#work");
            
        }
        
        protected void btnEliminarSi_Click(object sender, EventArgs e)
        {
            DTOSilla Si = new DTOSilla();
            Si.Codigo = int.Parse(txtCodigoSi.Text);
            CADSilla datos = new CADSilla();
            bool existe = datos.Eliminar_Silla(Si);
            Response.Redirect("inicio.aspx#work");
        }

        protected void btnListarSi_Click(object sender, EventArgs e)
        {
            btnVolverSi.Visible = true;
            oculto.Visible = false;

            DTOSilla dts = new DTOSilla();
            CADSilla datos = new CADSilla();
            gvSillas.DataSource = datos.Consultar_silla(dts);
            gvSillas.DataBind();
        }

        protected void btnVolverSi_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx#work");
        }
    }
}
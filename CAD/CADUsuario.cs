using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace CAD
{
    public class CADUsuario
    {
        string cadena = ConfigurationManager.ConnectionStrings["miConexion"].ConnectionString;

        public bool insertarUsuario(DTOUsuario Codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Insertar_Usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_us", Codigo.Codigo);
            cmd.Parameters.AddWithValue("@Nombre_us", Codigo.Nombre);
            cmd.Parameters.AddWithValue("@Apellido_us", Codigo.Apellido);
            cmd.Parameters.AddWithValue("@Tipo_Documento_us", Codigo.Tipo_doc);
            cmd.Parameters.AddWithValue("@Numero_Documento_us", Codigo.Numero_doc);
            cmd.Parameters.AddWithValue("@Edad_us", Codigo.Edad);
            cmd.Parameters.AddWithValue("@Sexo_us", Codigo.Sexo);
            cmd.Parameters.AddWithValue("@Telefono_us", Codigo.Telefono);
            cmd.Parameters.AddWithValue("@Correo_us", Codigo.Correo);
            cmd.Parameters.AddWithValue("@Usuario_us", Codigo.Usuario);
            cmd.Parameters.AddWithValue("@Contraseña_us", Codigo.Contraseña);
            cmd.Parameters.AddWithValue("@Id_R", Codigo.Codigo_rol);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return true;
        }

        public bool modificarUsuario(DTOUsuario Codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Modificar_Usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_us", Codigo.Codigo);
            cmd.Parameters.AddWithValue("@Nombre_us", Codigo.Nombre);
            cmd.Parameters.AddWithValue("@Apellido_us", Codigo.Apellido);
            cmd.Parameters.AddWithValue("@Tipo_Documento_us", Codigo.Tipo_doc);
            cmd.Parameters.AddWithValue("@Numero_Documento_us", Codigo.Numero_doc);
            cmd.Parameters.AddWithValue("@Edad_us", Codigo.Edad);
            cmd.Parameters.AddWithValue("@Sexo_us", Codigo.Sexo);
            cmd.Parameters.AddWithValue("@Telefono_us", Codigo.Telefono);
            cmd.Parameters.AddWithValue("@Correo_us", Codigo.Correo);
            cmd.Parameters.AddWithValue("@Usuario_us", Codigo.Usuario);
            cmd.Parameters.AddWithValue("@Contraseña_us", Codigo.Contraseña);
            cmd.Parameters.AddWithValue("@Id_R", Codigo.Codigo_rol);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return true;
        }

        public DataTable ConsultarUsuario(DTOUsuario Codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Consultar_Usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return dt;
        }

        public bool ELiminarUsuario(DTOUsuario Codigo)
        {

            return true;
        }

        public int AutenticarUsuario(DTOUsuario us)
        {
            int id = 0;
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Value_Usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Usuario_us", us.Usuario);
            cmd.Parameters.AddWithValue("@Contraseña_us", us.Contraseña);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            foreach (var item in dr)
            {
               id = int.Parse(dr["Id_us"].ToString());
            }
            return id;
        }
    }
}

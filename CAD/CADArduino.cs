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
    public class CADArduino
    {
        string cad = ConfigurationManager.ConnectionStrings["miConexion"].ConnectionString;

        public string insertar_Arduino(DTOArduino codigo)
        {
            string mensaje = "Error al ingresar";
            SqlConnection con = new SqlConnection(cad);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Insertar_Arduino";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_ard", codigo.Codigo);
            cmd.Parameters.AddWithValue("@Nombre_ard", codigo.Nombre);
            cmd.Parameters.AddWithValue("@Descripcion_ard", codigo.Decripcion);
            con.Open();
            int men = cmd.ExecuteNonQuery();
            con.Close();
            if (men != 0) mensaje = "Guardado correctamente";
            return mensaje;
        }

        public string modificar_Arduino(DTOArduino codigo)
        {
            string mensaje = "Error al ingresar";
            SqlConnection con = new SqlConnection(cad);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Modificar_Arduino";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_ard", codigo.Codigo);
            cmd.Parameters.AddWithValue("@Nombre_ard", codigo.Nombre);
            cmd.Parameters.AddWithValue("@Descripcion_ard", codigo.Decripcion);
            con.Open();
            int men = cmd.ExecuteNonQuery();
            con.Close();
            if (men != 0) mensaje = "Modifico correctamente";
            return mensaje;
        }

        public string eliminar_Arduino(DTOArduino codigo)
        {
            string mensaje = "Error al ingresar";
            SqlConnection con = new SqlConnection(cad);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Eliminar_Arduino";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_ard", codigo.Codigo);
            con.Open();
            int men = cmd.ExecuteNonQuery();
            con.Close();
            if (men != 0) mensaje = "Elimino correctamente";
            return mensaje;
        }

        public List<DTOArduino> ConsultarU_Arduino()
        {
            List<DTOArduino> list = new List<DTOArduino>();
            SqlConnection con = new SqlConnection(cad);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Consultar_Arduino";
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            foreach (var item in dr)
            {
                DTOArduino ard = new DTOArduino();
                ard.Codigo = int.Parse(dr["Id_ard"].ToString());
                ard.Nombre = dr["Nombre_ard"].ToString();
                ard.Decripcion = dr["Descripcion_ard"].ToString();
                list.Add(ard);
            }
            return list;
        }
    }
}

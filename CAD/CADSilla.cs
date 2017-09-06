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
    public class CADSilla
    {
        string cadena = ConfigurationManager.ConnectionStrings["miConexion"].ConnectionString;

        public bool Insertar_silla(DTOSilla codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Insertar_Silla";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_Si",codigo.Codigo);
            cmd.Parameters.AddWithValue("@Id_tipo_s", codigo.Codigo_tipo);
            cmd.Parameters.AddWithValue("@Tamaño_Si", codigo.Tamaño);
            cmd.Parameters.AddWithValue("@Matertial_Si", codigo.Material);
            cmd.Parameters.AddWithValue("@Id_sen", codigo.Codigo_sensor);
            cmd.Parameters.AddWithValue("@Id_ard", codigo.Codigo_arduino);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return true;
            
        }

        public bool Modificar_Silla(DTOSilla codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Modificar_Silla";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_Si", codigo.Codigo);
            cmd.Parameters.AddWithValue("@Id_tipo_s", codigo.Codigo_tipo);
            cmd.Parameters.AddWithValue("@Tamaño_Si", codigo.Tamaño);
            cmd.Parameters.AddWithValue("@Matertial_Si", codigo.Material);
            cmd.Parameters.AddWithValue("@Id_sen", codigo.Codigo_sensor);
            cmd.Parameters.AddWithValue("@Id_ard", codigo.Codigo_arduino);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return true;
        }

        public DataTable Consultar_silla(DTOSilla Codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Consultar_Silla";
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return dt;
        }

        public bool Eliminar_Silla(DTOSilla codigo)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Eliminar_Silla";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_Si", codigo.Codigo);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            con.Close();
            return true;
        }
    }
}

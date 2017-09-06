using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Sitio_web_SCE
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Servicios" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Servicios.svc o Servicios.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Servicios : IServicios
    {
        public string Insertar_ard(int codigo, string nombre, string descripcion)
        {
            DTOArduino arduino = new DTOArduino();
            arduino.Codigo = codigo;
            arduino.Nombre = nombre;
            arduino.Decripcion = descripcion;
            return new CADArduino().insertar_Arduino(arduino);
        }
        
        public string Modificar_ard(int codigo, string nombre, string descripcion)
        {
            DTOArduino arduino = new DTOArduino();
            arduino.Codigo = codigo;
            arduino.Nombre = nombre;
            arduino.Decripcion = descripcion;
            return new CADArduino().modificar_Arduino(arduino);
        }

        public string Eliminar_ard(int codigo)
        {
            DTOArduino arduino = new DTOArduino();
            arduino.Codigo = codigo;
            return new CADArduino().eliminar_Arduino(arduino);
        }

        public List<DTOArduino> Listar_ard()
        {
            return new CADArduino().ConsultarU_Arduino();
        }
    }
}

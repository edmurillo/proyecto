using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DTOSilla
    {
        private int codigo;

        public int Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }

        private int codigo_tipo;

        public int Codigo_tipo
        {
            get { return codigo_tipo; }
            set { codigo_tipo = value; }
        }

        private string tamaño;

        public string Tamaño
        {
            get { return tamaño; }
            set { tamaño = value; }
        }

        private string material;

        public string Material
        {
            get { return material; }
            set { material = value; }
        }

        private int codigo_sensor;

        public int Codigo_sensor
        {
            get { return codigo_sensor; }
            set { codigo_sensor = value; }
        }

        private int codigo_arduino;

        public int Codigo_arduino
        {
            get { return codigo_arduino; }
            set { codigo_arduino = value; }
        }

    }
}

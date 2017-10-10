using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Geos
{
    public class Geo
    {
        public int Id { get; set; }
        public int IdUsr { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public DateTime Data { get; set; }
        public string NomeUsuario { get; set; }
    }
}
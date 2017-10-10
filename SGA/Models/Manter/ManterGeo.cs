using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Geos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterGeo
    {
        Geo ObjGeo;
        public ManterGeo()
        {

        }
        public ManterGeo(Geo ObjGeo)
        {
            this.ObjGeo = ObjGeo;
        }
        public List<Geo> InformaGeo()
        {
            return new ManterGeoDAO(ObjGeo).InformaGeoDAO();
        }
        public bool GravaGeo()
        {
            try
            {
                if (new ManterGeoDAO(ObjGeo).GravaGeoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                throw;
            }
        }
    }
}
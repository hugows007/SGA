using SGA.Models.Geos;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SGARest.Controllers
{
    public class GeoController : ApiController
    {
        Geo ObjGeo;

        public GeoController()
        {
            ObjGeo = FactoryGeo.GetNew();
        }

        public object Post(Geo geo)
        {
            ObjGeo = geo;

            try
            {
                if(ObjGeo.Latitude != null || ObjGeo.Longitude != null)
                {
                    if (new ManterGeo(ObjGeo).GravaGeo())
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, "ok");
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, "errogravacao");
                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "dadosinvalidos");
                }
                
                
            }
            catch (Exception Ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, Ex);
            }
        }
    }
}

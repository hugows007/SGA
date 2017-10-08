using SGA.Models.Geo;
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
                return Request.CreateResponse(HttpStatusCode.OK, "ok");
            }
            catch (Exception Ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, Ex);
            }
        }
    }
}

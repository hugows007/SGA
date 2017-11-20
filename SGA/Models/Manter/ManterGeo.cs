using SGA.Models.DAO.Log;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Geos;
using SGA.Models.Notificacoes;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SGA.Models.Usuarios;
using GoogleMapsGeocoding;
using GoogleMapsGeocoding.Common;

namespace SGA.Models.Manter
{
    public class ManterGeo : Geo
    {
        Geo ObjGeo;
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
        string ChaveGoogle = "AIzaSyA4ztJWBltNf2pvqnGTDs43xqANBP13MeY";
        public ManterGeo()
        {

        }
        public ManterGeo(Geo ObjGeo)
        {
            this.ObjGeo = ObjGeo;
        }
        public List<Geo> InformaGeo()
        {
            try
            {
                foreach (var Lista in new ManterGeoDAO(ObjGeo).InformaGeoDAO())
                {
                    if (Lista.Data < DateTime.Now || Lista.Data == DateTime.Now && Lista.Data.Hour < (DateTime.Now.Hour - 1))
                    {
                        foreach (var Gestores in new ManterUsuario(ObjUsuario).ConsultaUsuariosGestores())
                        {
                            Usuario Usr = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
                            Usr.Id = Lista.IdUsr;
                            Usr = new ManterUsuario(Usr).ConsultaUsuarioById();

                            ObjNotificacao.IdOrigem = Lista.IdUsr;
                            ObjNotificacao.IdDest = Gestores.Id;
                            ObjNotificacao.IdMensagem = 10;
                            ObjNotificacao.IdTipo = 4;
                            new ManterNotificacao(ObjNotificacao).NotificaUsuariosSistem();
                        }
                    }
                }

                return new ManterGeoDAO(ObjGeo).InformaGeoDAO();
            }
            catch (Exception)
            {
                throw;
            }

        }
        public bool GravaGeo()
        {
            try
            {
                return new ManterGeoDAO(ObjGeo).GravaGeoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Geo GetClienteLocalizacao()
        {
            try
            {
                IGeocoder geocoder = new Geocoder(ChaveGoogle);

                ObjUsuario.Id = ObjGeo.IdUsr;
                ObjUsuario = new ManterUsuarioDAO(ObjUsuario).ConsultaUsuarioByIdDAO();
                
                GeocodeResponse response = geocoder.Geocode(ObjUsuario.Endereco);
                ObjGeo.NomeUsuario = ObjUsuario.Nome;
                ObjGeo.Endereco = ObjUsuario.Endereco;
                ObjGeo.Latitude = response.Results[0].Geometry.Location.Lat.ToString().Replace(",",".");
                ObjGeo.Longitude = response.Results[0].Geometry.Location.Lng.ToString().Replace(",", ".");

                return ObjGeo;
                
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Geo GetTecnicoLocalizacao()
        {
            try
            {
                return new ManterGeoDAO(ObjGeo).GetTecnicoLocalizacaoDAO();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
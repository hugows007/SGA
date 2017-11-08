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

namespace SGA.Models.Manter
{
    public class ManterGeo
    {
        Geo ObjGeo;
        Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.UsuarioFuncionario);
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
                            ObjNotificacao.Mensagem = InfoGlobal.MensagemGeo + Usr.Nome;
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
                if (new ManterGeoDAO(ObjGeo).GravaGeoDAO())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
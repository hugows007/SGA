using SGA.Models.Especialidades;
using SGA.Models.RegiaoAtendimentos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuarios
{
    public abstract class FactoryUsuario
    {
        public static Usuario GetNew(TipoUsuario TpUsr)
        {
            Usuario ObjUsr = null;

            switch (TpUsr)
            {
                case TipoUsuario.Usuario:
                    ObjUsr = new Usuario();
                    ObjUsr.ObjEspec = FactoryEspecialidade.GetNew();
                    ObjUsr.ObjRegiao = FactoryRegiao.GetNew();
                    return ObjUsr;

                case TipoUsuario.UsuarioClienteFisico:
                    ObjUsr = new Usuario();
                    ObjUsr.ObjCF = new UsuarioClienteFisico();
                    ObjUsr.ObjEspec = FactoryEspecialidade.GetNew();
                    ObjUsr.ObjRegiao = FactoryRegiao.GetNew();
                    return ObjUsr;

                case TipoUsuario.UsuarioClienteJuridico:
                    ObjUsr = new Usuario();
                    ObjUsr.ObjCJ = new UsuarioClienteJuridico();
                    ObjUsr.ObjEspec = FactoryEspecialidade.GetNew();
                    ObjUsr.ObjRegiao = FactoryRegiao.GetNew();
                    return ObjUsr;

                case TipoUsuario.UsuarioFuncionario:
                    ObjUsr = new Usuario();
                    ObjUsr.ObjFunc = new UsuarioFuncionario();
                    ObjUsr.ObjEspec = FactoryEspecialidade.GetNew();
                    ObjUsr.ObjRegiao = FactoryRegiao.GetNew();
                    return ObjUsr;

                default:
                    return new Usuario();
            }
            
        }
    }
}
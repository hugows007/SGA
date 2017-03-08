using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Usuario
{
    public abstract class FactoryUsuario
    {
        internal static IUsuario GetNew(TipoUsuario TUsuario)
        {
            switch (TUsuario)
            {
                case TipoUsuario.UsuarioAdministrador:
                    return new UsuarioAdministrador();
                case TipoUsuario.UsuarioClienteFisico:
                    return new UsuarioClienteFisico();
                case TipoUsuario.UsuarioClienteJuridico:
                    return new UsuarioClienteJuridico();
                case TipoUsuario.UsuarioGestor:
                    return new UsuarioGestor();
                case TipoUsuario.UsuarioTecnico:
                    return new UsuarioTecnico();
                default:
                    return new UsuarioAdministrador();
            }
        }
    }
}
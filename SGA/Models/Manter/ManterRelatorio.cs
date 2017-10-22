using SGA.Models.DAO.ManterDAO;
using SGA.Models.Relatorios;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterRelatorio
    {
        Relatorio ObjRelatorio;
        Usuario ObjUsuario;

        public ManterRelatorio()
        {

        }
        public ManterRelatorio(Relatorio ObjRelatorio)
        {
            this.ObjRelatorio = ObjRelatorio;
        }

        public List<Relatorio> GetQtdChamados()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetQtdChamadosDAO();
        }

        public List<Relatorio> GetTopTecnicos()
        {
            return new ManterRelatorioDAO(ObjRelatorio).GetTopTecnicosDAO();
        }
    }
}
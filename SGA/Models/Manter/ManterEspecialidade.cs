﻿using SGA.Models.DAO.ManterDAO;
using SGA.Models.Especialidades;
using SGA.Models.Servicos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterEspecialidade
    {
        Especialidade ObjEspec;
        Servico ObjServ;
        private string Msg;

        public ManterEspecialidade()
        {

        }
        public ManterEspecialidade(Especialidade ObjEspec)
        {
            this.ObjEspec = ObjEspec;
        }
        public ManterEspecialidade(Especialidade ObjEspec, Servico ObjServ)
        {
            this.ObjEspec = ObjEspec;
            this.ObjServ = ObjServ;
        }
        public List<Especialidade> ConsultaEspecialidades()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadesDAO();
        }
        public Especialidade ConsultaEspecialidadeById()
        {
            return new ManterEspecialidadeDAO(ObjEspec).ConsultaEspecialidadeByIdDAO();
        }
        public string CadastraEspecialidade()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec).CadastraEspecialidadeDAO())
                {
                    Msg = "Especialidade cadastrada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao cadastrar a especialidade.";
            }

            return Msg;
        }
        public string AlteraEspecialidade()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec).AlteraEspecialidadeDAO())
                {
                    Msg = "Especialidade atualizada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar a especialidade.";
            }

            return Msg;
        }
        public bool InativaEspecialidade()
        {
            try
            {
                return new ManterEspecialidadeDAO(ObjEspec).InativaEspecialidadeDAO();
            }
            catch (Exception)
            {
                return false;
            }
        }
        public string RelacionaEspecServ()
        {
            try
            {
                if (new ManterEspecialidadeDAO(ObjEspec, ObjServ).RelacionaEspecServDAO())
                {
                    Msg = "Serviço e especialidade relacionados com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao relacionar os itens selecionados.";
            }

            return Msg;
        }
    }
}
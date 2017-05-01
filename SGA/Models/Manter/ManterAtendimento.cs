using SGA.Models.Atendimentos;
using SGA.Models.Chamados;
using SGA.Models.DAO.ManterDAO;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Manter
{
    public class ManterAtendimento
    {
        Atendimento ObjAtend;
        Usuario ObjUsuario;
        Chamado ObjChamado;
        public string Msg;
        public ManterAtendimento()
        {

        }
        public ManterAtendimento(Atendimento ObjAtend)
        {
            this.ObjAtend = ObjAtend;
        }
        public ManterAtendimento(Atendimento ObjAtend, Usuario ObjUsuario, Chamado ObjChamado)
        {
            this.ObjChamado = ObjChamado;
            this.ObjUsuario = ObjUsuario;
            this.ObjAtend = ObjAtend;
        }
        public List<Atendimento> ConsultaAtendimentos()
        {
            return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentosDAO();
        }
        public Atendimento ConsultaAtendimentoById()
        {
            return new ManterAtendimentoDAO(ObjAtend).ConsultaAtendimentoByIdDAO();
        }
        public string CadastraAtendimento()
        {
            try
            {
                foreach (var Tecnico in new ManterUsuario(ObjUsuario, ObjChamado).GetTecnicoByRegiaoEspec())
                {
                    ObjAtend.IdTecnico = Tecnico.Id;
                }

                ObjAtend.IdChamado = ObjChamado.Id;
                ObjAtend.IdCliente = ObjChamado.IdCliente;
                ObjAtend.IdRegiaoAtendimento = ObjUsuario.ObjRegiao.Id;

                if (new ManterAtendimentoDAO(ObjAtend).CadastraAtendimentoDAO())
                {
                    Msg = "Área de atendimento cadastrada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Houve um problema ao efetuar o cadastro da área de atendimento.";
            }

            return Msg;
        }
        public string AlteraAtendimento()
        {
            try
            {
                if (new ManterAtendimentoDAO(ObjAtend).AlteraAtendimentoDAO())
                {
                    Msg = "Área atualizada com sucesso!";
                }
            }
            catch (Exception)
            {
                Msg = "Ocorreu um erro ao atualizar a área!";
            }

            return Msg;
        }
        public bool CancelaAtendimento()
        {
            try
            {
                return new ManterAtendimentoDAO(ObjAtend).CancelaAtendimentoDAO();
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
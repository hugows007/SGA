﻿using SGA.Models.RegiaoAtendimentos;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VRegiaoAtendimento
{
    public partial class CadastroRegiaoAtendimento : System.Web.UI.Page
    {
        public string Mensagem;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                Mensagem = "Cadastro de região de atendimento.";

                RegiaoAtendimento ObjRegiao = FactoryRegiao.GetNew();
                ObjRegiao.Regiao = Regiao.Value;
                ObjRegiao.Cidade = Cidade.Value;
                ObjRegiao.Estado = Estado.Value;

                if(new ManterRegiaoAtendimento(ObjRegiao).CadastraRegiaoAtendimento())
                {
                    Mensagem = "Região de atendimento cadastrada com sucesso.";
                }
                else
                {
                    Mensagem = "Não foi possível cadastrar a região de atendimento.";
                }
                
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }
    }
}
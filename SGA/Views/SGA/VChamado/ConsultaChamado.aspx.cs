﻿using SGA.Models.AreaAtendimentos;
using SGA.Models.Chamados;
using SGA.Models.Manter;
using SGA.Models.Servicos;
using SGA.Models.StatusChamados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA.VChamado
{
    public partial class ConsultaChamado : System.Web.UI.Page
    {
        public Chamado ObjChamado = null;
        public AreaAtendimento ObjArea = FactoryArea.GetNew();
        public Servico ObjServico = FactoryServico.GetNew();
        public StatusChamado ObjStatusChm = FactoryStatusChamado.GetNew();

        ManterChamado MChamado;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Request.Form["Master$IdChamado"] != null -- Capturar post da página master para a página atual
            try
            {
                if (!"".Equals(Request.QueryString["IdChamado"]))
                {
                    ObjChamado = FactoryChamado.GetNew();

                    ObjChamado.Id = Convert.ToInt32(Request.QueryString["IdChamado"]);
                    MChamado = new ManterChamado(ObjChamado);
                    ObjChamado = MChamado.ConsultaChamadoById();

                    if (ObjChamado != null)
                    {
                        ObjArea.Id = ObjChamado.AreaAtendimento;
                        ObjServico.Id = ObjChamado.Servico;
                        ObjStatusChm.Id = ObjChamado.Status;

                        ObjArea = new ManterAreaAtendimento(ObjArea).ConsultaAreaAtendimentoById();
                        ObjServico = new ManterServico(ObjServico).ConsultaServicoById();
                        ObjStatusChm = new ManterStatusChamado(ObjStatusChm).ConsultaStatusChamadoById();


                    }
                    MsgLabel.Text = MChamado.Msg;
                }
                else
                {
                    MsgLabel.Text = "Nenhum número de chamado foi informado.";
                }
            }
            catch (Exception)
            {
                ObjChamado = null;
                MsgLabel.Text = "Número do chamado é inválido.";
            }
        }
    }
}
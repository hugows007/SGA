﻿using SGA.Models;
using SGA.Models.DAO.Log;
using SGA.Models.Manter;
using SGA.Models.Notificacoes;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGA.Views.SGA
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public string NomeUsuario;
        public int ContaListaNotificacao;
        public bool TemNotificacao;
        public bool TemNotificacaoChat;
        public Usuario ObjUsuario = FactoryUsuario.GetNew(TipoUsuario.Usuario);
        public Notificacao ObjNotificacao = FactoryNotificacao.GetNew();
        public List<Notificacao> ListaNotificacao = new List<Notificacao>();

        protected void Page_Init(object sender, EventArgs e)
        {
            this.ID = "Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.DataBind();
                ListaNotificacao.Clear();

                if (Session["usuario"] == null)
                {
                    Response.Redirect("\\Views\\Login\\Login.aspx");
                }
                else
                {
                    ObjUsuario.Login = Membership.GetUser().ToString();
                    ObjUsuario = new ManterUsuario(ObjUsuario).GetUsuarioEmpresa();

                    Session["id"] = ObjUsuario.Id;
                    Session["idms"] = ObjUsuario.IdMS;
                    Session["usuario"] = ObjUsuario.Login;
                    Session["nome"] = ObjUsuario.Nome;
                    Session["empresa"] = ObjUsuario.NomeEmpresa;
                    Session["idEmpresa"] = ObjUsuario.IdEmpresa;
                    Session["perfil"] = Roles.GetRolesForUser(ObjUsuario.Login)[0];

                    InfoGlobal.GlobalIdEmpresa = ObjUsuario.IdEmpresa;

                    Page.Header.DataBind();
                    NomeUsuario = (string)(Session["nome"]);


                    ObjNotificacao.IdDest = ObjUsuario.Id;

                    foreach (var Notifica in new ManterNotificacao(ObjNotificacao).InformaNotificacao())
                    {
                        if (Notifica.IdTipo.Equals(4))
                        {
                            TemNotificacao = true;
                        }
                        if (Notifica.IdTipo.Equals(1) || Notifica.IdTipo.Equals(2))
                        {
                            TemNotificacaoChat = true;
                        }

                        ListaNotificacao.Add(Notifica);
                    }
                }
            }
            catch (Exception Ex)
            {
                LogException.InsereLogBd(Ex);
                MsgLabel.Text = LogException.CodigoErroBd();
            }
        }

        protected void PesqButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Views\\SGA\\VChamado\\ConsultaChamado.aspx?IdChamado=" + IdChamado.Text);
        }
    }
}
delete UsuarioXEspecialidade;
delete UsuarioXMemberShipUser;
delete UsuarioXRegiaoAtendimento;
delete Funcionario;
delete ClienteFisico;
delete ClienteJuridico;
delete Atendimento;
delete Chamado;
delete ServicoXEspecialidade;
delete Servico;
delete Especialidade;
delete RegiaoDeAtendimento;
delete Avaliacao;
delete LogExcecoesTratadas;
delete TipoServico;
delete Usuario;
delete aspnet_Membership;
delete aspnet_UsersInRoles;
delete aspnet_Users;
delete aspnet_WebEvent_Events;

INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'0f3a0157-7f4b-4df1-b0ee-9110be7fa54e', N'hOHUy9ZKz2Ixt9t3FDcQuI2aFCg=', 1, N'c0BWVX8ltTsuCUnqyiJVMA==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2017-05-01 16:06:46.000' AS DateTime), CAST(N'2017-05-01 16:09:13.617' AS DateTime), CAST(N'2017-05-01 16:06:46.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'6829b283-ec4d-4acb-ac7c-b1fa61c71f58', N'Administrador', N'administrador', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'4355c114-eaf9-4b05-b6d2-3cb47ffae948', N'Atendente', N'atendente', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e', N'Cliente Físico', N'cliente físico', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'7edc0acd-f32c-4946-9bd0-889742053030', N'Cliente Jurídico', N'cliente jurídico', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'6a0bd300-3942-49e5-8307-f0dbc1591186', N'Gestor', N'gestor', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'5e106c37-3e4d-4b41-9eee-f190ea99e534', N'Técnico', N'técnico', NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'0f3a0157-7f4b-4df1-b0ee-9110be7fa54e', N'Admin', N'admin', NULL, 0, CAST(N'2017-05-01 16:27:21.360' AS DateTime))

SET IDENTITY_INSERT [dbo].[Atendimento] ON 
SET IDENTITY_INSERT [dbo].[Atendimento] OFF
SET IDENTITY_INSERT [dbo].[Chamado] ON 

INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Suporte técnico de computadores', N'Especialidade em manutenção de computadores', 1, NULL, CAST(N'2017-05-01 11:34:00.000' AS DateTime), N'Admin')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Suporte técnico rede', N'Suporte especialidade em manuteção de rede', 1, NULL, CAST(N'2017-05-01 11:34:00.000' AS DateTime), N'Admin')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Suporte técnico de softwares', N'Suporte especialidade em softwares', 1, NULL, CAST(N'2017-05-01 11:34:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Especialidade] OFF

INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Baixa', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Média', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Alta', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Urgente', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] ON 

INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Ipanema', N'Rio de Janeiro', N'RJ', 1, NULL, CAST(N'2017-04-15 14:59:25.967' AS DateTime), N'Admin')
INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Copacabana', N'Rio de Janeiro', N'RJ', 1, NULL, CAST(N'2017-04-15 14:59:25.967' AS DateTime), N'Admin')
INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Barra da Tijuca', N'Rio de Janeiro', N'RJ', 1, NULL, CAST(N'2017-04-15 14:59:19.607' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] OFF
SET IDENTITY_INSERT [dbo].[Servico] ON 

INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (2, 1, N'Instalação de Windows', N'Instalação de qualquer versão de sistemas operacionais Windows', 2, 1, NULL, CAST(N'2017-05-01 09:47:03.257' AS DateTime), N'Admin')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, 6, N'Formatação com Windows 7', N'Formatação de computadores com sistemas operacionais Windows 7', 2, 1, NULL, CAST(N'2017-05-01 09:47:03.257' AS DateTime), N'Admin')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (4, 1, N'Instalação de rede WiFi', N'Instalação de rede de computadores', 2, 1, NULL, CAST(N'2017-05-01 09:47:03.257' AS DateTime), N'Admin')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 7, N'Problema de acesso a rede', N'Todos os problemas referentes ao acesso a rede através do computador', 5, 1, NULL, CAST(N'2017-05-01 09:47:03.257' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Servico] OFF

INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, 3, 1, CAST(N'2017-05-01 17:07:30.767' AS DateTime), N'HugoGestor')

INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Aberto', N'Chamado em estado de aberto e não atendido', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Em andamento', N'Chamado em estado de andamento', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Concluído', N'Chamado concluído com sucesso', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Retrabalho', N'Chamado que foi concluído o atendimento porém com pendência', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Cancelado', N'Chamado que foi cancelado por motivos diversos', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Ativo', N'Usuario ativo', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Bloqueado', N'Usuario bloqueado', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Inativo', N'Usuario inativo', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[TipoServico] ON 

INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Instalação', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Manutenção', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Exclusão', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Backup', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (6, N'Formatação', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (7, N'Problema', 1, CAST(N'2017-05-01 11:32:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[TipoServico] OFF

SET IDENTITY_INSERT [dbo].[Usuario] ON 
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Aberto', N'Chamado em estado de aberto e não atendido', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Em andamento', N'Chamado em estado de andamento', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Concluído', N'Chamado concluído com sucesso', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Retrabalho', N'Chamado que foi concluído o atendimento porém com pendência', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Cancelado', N'Chamado que foi cancelado por motivos diversos', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
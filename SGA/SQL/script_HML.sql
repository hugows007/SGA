USE [master]
GO
/****** Object:  Database [SGAHML]    Script Date: 26/11/2017 09:31:17 ******/
CREATE DATABASE [SGAHML]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGAHML', FILENAME = N'E:\Projetos\Bancos\SGAHML.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SGAHML_log', FILENAME = N'E:\Projetos\Bancos\SGAHML_log.ldf' , SIZE = 181184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SGAHML] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGAHML].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGAHML] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SGAHML] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SGAHML] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SGAHML] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SGAHML] SET ARITHABORT OFF 
GO
ALTER DATABASE [SGAHML] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SGAHML] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGAHML] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGAHML] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGAHML] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SGAHML] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SGAHML] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGAHML] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SGAHML] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGAHML] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SGAHML] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGAHML] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGAHML] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGAHML] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGAHML] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGAHML] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGAHML] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGAHML] SET RECOVERY FULL 
GO
ALTER DATABASE [SGAHML] SET  MULTI_USER 
GO
ALTER DATABASE [SGAHML] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGAHML] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGAHML] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGAHML] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SGAHML] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SGAHML]
GO
/****** Object:  User [SGA]    Script Date: 26/11/2017 09:31:17 ******/
CREATE USER [SGA] FOR LOGIN [SGA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [SGA]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 26/11/2017 09:31:17 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 26/11/2017 09:31:17 ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 26/11/2017 09:31:17 ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 26/11/2017 09:31:17 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 26/11/2017 09:31:17 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 26/11/2017 09:31:17 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 26/11/2017 09:31:17 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atendimento]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atendimento](
	[idAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[dataInicioAtendimento] [datetime] NULL,
	[dataFimAtendimento] [datetime] NULL,
	[relatorioAtendimento] [varchar](1000) NULL,
	[idChamado] [int] NOT NULL,
	[idTecnico] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idRegiaoAtendimento] [int] NOT NULL,
	[tempoAtendimento] [varchar](50) NULL,
	[idEmpresa] [int] NULL,
	[dataRegistro] [datetime] NULL,
	[usuarioRegistro] [varchar](50) NULL,
 CONSTRAINT [PK_Atendimento] PRIMARY KEY CLUSTERED 
(
	[idAtendimento] ASC,
	[idChamado] ASC,
	[idTecnico] ASC,
	[idCliente] ASC,
	[idRegiaoAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avaliacao](
	[avaliacaoTecnico] [int] NULL,
	[avaliacaoAtendimento] [int] NULL,
	[comentario] [varchar](100) NULL,
	[idAtendimento] [int] NOT NULL,
	[idChamado] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Avaliacao] PRIMARY KEY CLUSTERED 
(
	[idAtendimento] ASC,
	[idChamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvaliacaoSolucao]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvaliacaoSolucao](
	[likeSolucao] [int] NOT NULL,
	[idAtendimento] [int] NOT NULL,
	[idChamado] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AvaliacaoSolucao] PRIMARY KEY CLUSTERED 
(
	[idAtendimento] ASC,
	[idChamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chamado]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chamado](
	[idChamado] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[assunto] [varchar](50) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
	[idStatusChamado] [int] NOT NULL,
	[dataAbertura] [datetime] NOT NULL,
	[dataFechamento] [datetime] NULL,
	[idServico] [int] NOT NULL,
	[idPrioridade] [int] NOT NULL,
	[infoCancelamento] [varchar](1000) NULL,
	[infoTramite] [varchar](1000) NULL,
	[infoPendencias] [varchar](1000) NULL,
	[idEmpresa] [int] NULL,
	[ContReabertura] [int] NULL,
	[ContPendencia] [int] NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Chamado] PRIMARY KEY CLUSTERED 
(
	[idChamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChatPrivado]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatPrivado](
	[idChatPrivado] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioOrig] [uniqueidentifier] NOT NULL,
	[idUsuarioDest] [uniqueidentifier] NOT NULL,
	[dataSala] [datetime] NOT NULL,
 CONSTRAINT [PK_ChatPrivado] PRIMARY KEY CLUSTERED 
(
	[idChatPrivado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClienteFisico]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClienteFisico](
	[idUsuario] [int] NOT NULL,
	[docIdentificador] [varchar](15) NOT NULL,
	[orgaoEmissor] [varchar](15) NOT NULL,
	[cpf] [varchar](11) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClienteJuridico]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClienteJuridico](
	[idUsuario] [int] NOT NULL,
	[cnpj] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[idEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
	[complemento] [varchar](50) NOT NULL,
	[cep] [varchar](11) NOT NULL,
	[telefone] [varchar](10) NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Especialidade]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidade](
	[idEspecialidade] [int] IDENTITY(1,1) NOT NULL,
	[especialidade] [varchar](50) NOT NULL,
	[descricao] [varchar](500) NOT NULL,
	[ativo] [int] NOT NULL,
	[idEmpresa] [int] NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Especialidade] PRIMARY KEY CLUSTERED 
(
	[idEspecialidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[idUsuario] [int] NOT NULL,
	[idDisponibilidade] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Geolocalizacao]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Geolocalizacao](
	[idGeo] [int] IDENTITY(1,1) NOT NULL,
	[latitude] [varchar](50) NOT NULL,
	[longitude] [varchar](50) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Geolocalizacao] PRIMARY KEY CLUSTERED 
(
	[idGeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogExcecoesTratadas]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogExcecoesTratadas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exMensagem] [nvarchar](4000) NULL,
	[exSource] [nvarchar](4000) NULL,
	[exStackTrace] [nvarchar](4000) NULL,
	[exTargetSite] [nvarchar](4000) NULL,
	[exDate] [datetime] NULL,
	[exUser] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensagem](
	[idChat] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[mensagem] [varchar](5000) NOT NULL,
	[dataMensagem] [datetime] NULL,
 CONSTRAINT [PK_Mensagem] PRIMARY KEY CLUSTERED 
(
	[idChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MensagemXChatPrivado]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MensagemXChatPrivado](
	[idChat] [int] NOT NULL,
	[idChatPrivado] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacao](
	[idNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioOrigem] [int] NULL,
	[idUsuarioDestino] [int] NULL,
	[idMsgNotificacao] [int] NOT NULL,
	[idTipo] [int] NOT NULL,
	[vista] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Notificacao] PRIMARY KEY CLUSTERED 
(
	[idNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificacaoMensagem]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificacaoMensagem](
	[idMsgNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[mensagem] [varchar](50) NULL,
 CONSTRAINT [PK_NotificacaoMensagem] PRIMARY KEY CLUSTERED 
(
	[idMsgNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PrioridadeChamado]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrioridadeChamado](
	[idPrioridade] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[dataRegistro] [datetime] NULL,
	[usuarioRegistro] [varchar](50) NULL,
 CONSTRAINT [PK_PrioridadeChamado] PRIMARY KEY CLUSTERED 
(
	[idPrioridade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecusaAtendimento]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecusaAtendimento](
	[idChamado] [int] NOT NULL,
	[idTecnico] [int] NOT NULL,
	[idEmpresa] [int] NULL,
	[motivo] [varchar](50) NULL,
	[dataRegistro] [datetime] NULL,
	[usuarioRegistro] [varchar](50) NULL,
 CONSTRAINT [PK_RecusaAtendimento] PRIMARY KEY CLUSTERED 
(
	[idChamado] ASC,
	[idTecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegiaoDeAtendimento]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegiaoDeAtendimento](
	[idRegiaoAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[regiao] [varchar](50) NOT NULL,
	[cidade] [varchar](20) NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[ativo] [int] NOT NULL,
	[idEmpresa] [int] NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AreaDeAtendimento] PRIMARY KEY CLUSTERED 
(
	[idRegiaoAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servico]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servico](
	[idServico] [int] IDENTITY(1,1) NOT NULL,
	[idTipo] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[descricao] [varchar](200) NOT NULL,
	[sla] [int] NOT NULL,
	[ativo] [int] NOT NULL,
	[idEmpresa] [int] NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Servico] PRIMARY KEY CLUSTERED 
(
	[idServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicoXEspecialidade]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicoXEspecialidade](
	[idEspecialidade] [int] NOT NULL,
	[idServico] [int] NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ServicoXEspecialidade] PRIMARY KEY CLUSTERED 
(
	[idEspecialidade] ASC,
	[idServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusChamado]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusChamado](
	[idStatusChamado] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
	[descStatus] [varchar](100) NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusChamado] PRIMARY KEY CLUSTERED 
(
	[idStatusChamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusDisponibilidade]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusDisponibilidade](
	[idDisponibilidade] [int] IDENTITY(1,1) NOT NULL,
	[descStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Disponibilidade] PRIMARY KEY CLUSTERED 
(
	[idDisponibilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusUsuario]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusUsuario](
	[idStatusUsuario] [int] NOT NULL,
	[status] [varchar](10) NOT NULL,
	[descStatus] [varchar](20) NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusUsuario] PRIMARY KEY CLUSTERED 
(
	[idStatusUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoNotificacao]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoNotificacao](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NULL,
 CONSTRAINT [PK_TipoNotificacao] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoServico]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoServico](
	[idTipoServ] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoServico] PRIMARY KEY CLUSTERED 
(
	[idTipoServ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[endereco] [varchar](300) NOT NULL,
	[numero] [varchar](100) NOT NULL,
	[cep] [varchar](10) NOT NULL,
	[telefone] [varchar](10) NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[idStatusUsuario] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioXEspecialidade]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioXEspecialidade](
	[idUsuario] [int] NOT NULL,
	[idEspecialidade] [int] NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UsuarioXEspecialidade] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idEspecialidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioXMemberShipUser]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXMemberShipUser](
	[idUsuario] [int] NOT NULL,
	[IdUsrMemberShip] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UsuarioXMemberShipUser] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[IdUsrMemberShip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioXRegiaoAtendimento]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioXRegiaoAtendimento](
	[idUsuario] [int] NOT NULL,
	[idRegiaoAtendimento] [int] NOT NULL,
	[ativo] [int] NOT NULL,
	[dataRegistro] [datetime] NOT NULL,
	[usuarioRegistro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UsuarioXRegiaoAtendimento] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idRegiaoAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  

GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  

GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 26/11/2017 09:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  

GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'SGA', N'sga', N'1c998a8a-f886-4b7c-a235-02e480e259b7', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'4736a218-cc7a-45db-b313-60cfa29199b2', N'RqJvnZuXUy1D+J1Db700ho0ZgzI=', 1, N'0m4cxK4ITfDm6bCu4XpUmQ==', NULL, N'admin@admin.com', N'admin@admin.com', NULL, NULL, 1, 0, CAST(N'2017-11-25 21:45:39.000' AS DateTime), CAST(N'2017-11-26 04:21:39.617' AS DateTime), CAST(N'2017-11-25 21:45:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'ab52a038-298c-4996-bc41-62e38650119b', N'NT//I5BZDcVKDtUHzLfN54rwQIk=', 1, N'uB4Qw/kFsqHyL0xSUZIN0w==', NULL, N'douglasacorrea88@gmail.com', N'douglasacorrea88@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-25 22:01:19.000' AS DateTime), CAST(N'2017-11-26 04:55:15.657' AS DateTime), CAST(N'2017-11-25 22:04:57.177' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'68a89407-1899-4571-99e5-a182e52d717e', N'/N1jcKcI7PSIjvyTbP6Ql9rcxCY=', 1, N'5IiHCTBomLpIIaT7bmrnPg==', NULL, N'douglasacorrea88@gmail.com', N'douglasacorrea88@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:28:56.000' AS DateTime), CAST(N'2017-11-26 04:41:46.263' AS DateTime), CAST(N'2017-11-26 00:28:56.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'655d4f8c-cce3-4456-b981-8912d5515770', N'xWFHYzCy1ZJapqgkH4dHLbD4gxo=', 1, N'iiUeyM6UwnSK8wVuLuL53A==', NULL, N'douglasacorrea88@gmail.com', N'douglasacorrea88@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:32:17.000' AS DateTime), CAST(N'2017-11-26 03:05:22.390' AS DateTime), CAST(N'2017-11-26 00:32:17.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'fe82ba09-204d-46ce-92a5-7fa7815f3b1f', N'w2JYVrP0eLqRvkJHQFuXyzbKWzU=', 1, N'MgZz99foUmuFrEM39kf8rQ==', NULL, N'fabianocosta.escm@gmail.com', N'fabianocosta.escm@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-25 21:55:27.000' AS DateTime), CAST(N'2017-11-25 23:48:21.110' AS DateTime), CAST(N'2017-11-25 21:55:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'7964d00d-2e58-4e0d-9c9c-cb6984ea1d7c', N'XAaDgeYy4J1bk/o19BpgqJjxNOA=', 1, N'GQ/0eBa0dPNEmFciD3Lg9A==', NULL, N'fabianocosta.escm@gmail.com', N'fabianocosta.escm@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:38:05.000' AS DateTime), CAST(N'2017-11-26 03:23:55.873' AS DateTime), CAST(N'2017-11-26 00:38:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'a83dd0ee-ee8b-4ce2-9449-21b3bb8ed70e', N'RrvhOOlCcIjvHPFnnLJ2owgDEZM=', 1, N'072a8OMN8xdvB4dwoQuv3w==', NULL, N'fabianocosta.escm@gmail.com', N'fabianocosta.escm@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:38:33.000' AS DateTime), CAST(N'2017-11-26 03:24:29.683' AS DateTime), CAST(N'2017-11-26 00:38:33.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'06f7bff6-a8b6-4475-a436-f73597017223', N'0x+smC7G9G3oUrxBOQEeYcPzw/w=', 1, N'kmvz25kh0P08N9y69HbY6g==', NULL, N'hugobezerrapimentel@gmail.com', N'hugobezerrapimentel@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-25 22:01:15.000' AS DateTime), CAST(N'2017-11-26 04:36:07.877' AS DateTime), CAST(N'2017-11-25 22:01:15.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'c9b9f38b-e433-4b76-a7d2-a8b0ca53630e', N'+O0dlUV+6EoAtzackr2lZ9w/JuA=', 1, N'xFQMq/yq1+/jwXpJ+HDJew==', NULL, N'hugobezerrapimentel@gmail.com', N'hugobezerrapimentel@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:35:05.000' AS DateTime), CAST(N'2017-11-26 04:46:40.960' AS DateTime), CAST(N'2017-11-26 00:35:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'a3dfbf77-9ee7-41e1-a7b7-9b0c9d5853af', N'u6m+QceFmegiZUkGCYJysMR5mhI=', 1, N'nCOymsS7XSvotxWxSxjgcA==', NULL, N'hugobezerrapimentel@gmail.com', N'hugobezerrapimentel@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:36:31.000' AS DateTime), CAST(N'2017-11-26 04:35:05.393' AS DateTime), CAST(N'2017-11-26 00:36:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'f7fa723a-17b0-4309-9229-d9b78702ecbe', N'4lL0QukwcvHAI8EXAqVoLx3k8iM=', 1, N'Png/WYXwuwkb0Q7cbyuT+A==', NULL, N'jgarcia.rosa@gmail.com', N'jgarcia.rosa@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-25 21:49:31.000' AS DateTime), CAST(N'2017-11-26 04:57:42.643' AS DateTime), CAST(N'2017-11-25 21:49:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'71f3757f-1cd6-45af-b805-6e6450e90e16', N'FLBJjgBPfKqWve2qyU+cpIpQ3zM=', 1, N'ibEEF8kcwoTo9hkc/jazmA==', NULL, N'jgarcia.rosa@gmail.com', N'jgarcia.rosa@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:23:39.000' AS DateTime), CAST(N'2017-11-26 04:47:47.550' AS DateTime), CAST(N'2017-11-26 00:23:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'26bc99ab-19d2-4d1f-bdf8-d364419c508e', N'Vpioao5rqvgM9IN+LEUCUYC7pn4=', 1, N'WfFO8D3gF1x10AmT/7QfIg==', NULL, N'jgarcia.rosa@gmail.com', N'jgarcia.rosa@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-26 00:24:23.000' AS DateTime), CAST(N'2017-11-26 04:48:35.617' AS DateTime), CAST(N'2017-11-26 00:24:23.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'6829b283-ec4d-4acb-ac7c-b1fa61c71f58', N'Administrador', N'administrador', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'4355c114-eaf9-4b05-b6d2-3cb47ffae948', N'Atendente', N'atendente', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e', N'Cliente Físico', N'cliente físico', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'7edc0acd-f32c-4946-9bd0-889742053030', N'Cliente Jurídico', N'cliente jurídico', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'6a0bd300-3942-49e5-8307-f0dbc1591186', N'Gestor', N'gestor', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'5e106c37-3e4d-4b41-9eee-f190ea99e534', N'Técnico', N'técnico', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'4736a218-cc7a-45db-b313-60cfa29199b2', N'Admin', N'admin', NULL, 0, CAST(N'2017-11-26 04:26:06.490' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'68a89407-1899-4571-99e5-a182e52d717e', N'douglascliente', N'douglascliente', NULL, 0, CAST(N'2017-11-26 04:43:34.727' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'ab52a038-298c-4996-bc41-62e38650119b', N'douglasgestor', N'douglasgestor', NULL, 0, CAST(N'2017-11-26 04:55:15.753' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'655d4f8c-cce3-4456-b981-8912d5515770', N'douglastecnico', N'douglastecnico', NULL, 0, CAST(N'2017-11-26 03:08:20.073' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'7964d00d-2e58-4e0d-9c9c-cb6984ea1d7c', N'fabianocliente', N'fabianocliente', NULL, 0, CAST(N'2017-11-26 03:24:12.540' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'fe82ba09-204d-46ce-92a5-7fa7815f3b1f', N'fabianogestor', N'fabianogestor', NULL, 0, CAST(N'2017-11-26 00:20:32.840' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'a83dd0ee-ee8b-4ce2-9449-21b3bb8ed70e', N'fabianotecnico', N'fabianotecnico', NULL, 0, CAST(N'2017-11-26 03:25:18.803' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'c9b9f38b-e433-4b76-a7d2-a8b0ca53630e', N'hugocliente', N'hugocliente', NULL, 0, CAST(N'2017-11-26 04:46:51.987' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'06f7bff6-a8b6-4475-a436-f73597017223', N'HugoGestor', N'hugogestor', NULL, 0, CAST(N'2017-11-26 04:36:07.933' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'a3dfbf77-9ee7-41e1-a7b7-9b0c9d5853af', N'hugotecnico', N'hugotecnico', NULL, 0, CAST(N'2017-11-26 04:35:07.900' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'71f3757f-1cd6-45af-b805-6e6450e90e16', N'jonascliente', N'jonascliente', NULL, 0, CAST(N'2017-11-26 04:48:26.193' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'f7fa723a-17b0-4309-9229-d9b78702ecbe', N'JonasGestor', N'jonasgestor', NULL, 0, CAST(N'2017-11-26 11:31:21.203' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'26bc99ab-19d2-4d1f-bdf8-d364419c508e', N'jonastecnico', N'jonastecnico', NULL, 0, CAST(N'2017-11-26 04:50:03.573' AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71f3757f-1cd6-45af-b805-6e6450e90e16', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'68a89407-1899-4571-99e5-a182e52d717e', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c9b9f38b-e433-4b76-a7d2-a8b0ca53630e', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7964d00d-2e58-4e0d-9c9c-cb6984ea1d7c', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4736a218-cc7a-45db-b313-60cfa29199b2', N'6829b283-ec4d-4acb-ac7c-b1fa61c71f58')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ab52a038-298c-4996-bc41-62e38650119b', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fe82ba09-204d-46ce-92a5-7fa7815f3b1f', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f7fa723a-17b0-4309-9229-d9b78702ecbe', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'06f7bff6-a8b6-4475-a436-f73597017223', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a83dd0ee-ee8b-4ce2-9449-21b3bb8ed70e', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'655d4f8c-cce3-4456-b981-8912d5515770', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a3dfbf77-9ee7-41e1-a7b7-9b0c9d5853af', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'26bc99ab-19d2-4d1f-bdf8-d364419c508e', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_WebEvent_Events] ([EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (N'5373c79d679d44be9b0e0b09ba8c5e84', CAST(N'2017-11-25 23:37:12.783' AS DateTime), CAST(N'2017-11-25 21:37:12.783' AS DateTime), N'System.Web.Management.WebErrorEvent', CAST(44 AS Decimal(19, 0)), CAST(2 AS Decimal(19, 0)), 3006, 0, N'Ocorreu um erro do analisador.', N'C:\Users\Hugo\Desktop\SGA\SGA\', N'/', N'HUGO-PC', N'http://192.168.43.150/Views/SGA/VUsuario/CadastroUsuario.aspx', N'System.Web.HttpParseException', N'Código do evento: 3006
Mensagem do evento: Ocorreu um erro do analisador.
Hora do evento: 25/11/2017 21:37:12
Hora do evento (UTC): 25/11/2017 23:37:12
Identificação do Evento: 5373c79d679d44be9b0e0b09ba8c5e84
Seqüência de eventos: 44
Ocorrência do evento: 2
Código de detalhe do evento: 0

Informações sobre o aplicativo:
    Domínio do aplicativo: /LM/W3SVC/1/ROOT-39-131561261617436745
    Nível de confiança: Full
    Caminho Virtual do Aplicativo: /
    Caminho do Aplicativo: C:\Users\Hugo\Desktop\SGA\SGA\
    Nome do computador: HUGO-PC

Informações sobre o processo:
    Identificação do processo: 8024
    Nome do processo: w3wp.exe
    Nome da conta: IIS APPPOOL\DefaultAppPool

Informações sobre a exceção:
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: Marca do servidor não está formada corretamente.

Informações sobre exceção interna (nível 1):
    Tipo da exceção: System.Web.HttpException
    Mensagem da exceção: Marca do servidor não está formada corretamente.

Informações sobre a solicitação:
    URL da solicitação: http://192.168.43.150/Views/SGA/VUsuario/CadastroUsuario.aspx
    Caminho da solicitação: /Views/SGA/VUsuario/CadastroUsuario.aspx
    Endereço do host do usuário: 192.168.43.150
    Usuário: HugoGestor
    Está autenticado: Verdadeiro
    Tipo de Autenticação: Forms
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool

Informações sobre o thread:
    Identificação de Thread: 14
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool
    Está representando: Falso
    Rastreamento de pilha:    em System.Web.UI.TemplateParser.ParseString(String text, VirtualPath virtualPath, Encoding fileEncoding)
   em System.Web.UI.TemplateParser.ParseFile(String physicalPath, VirtualPath virtualPath)
   em System.Web.UI.TemplateParser.ParseInternal()
   em System.Web.UI.TemplateParser.Parse()
   em System.Web.Compilation.BaseTemplateBuildProvider.get_CodeCompilerType()
   em System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   em System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   em System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   em System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   em System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   em System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   em System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

')
INSERT [dbo].[aspnet_WebEvent_Events] ([EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (N'793f40dee9904f30ac909cf7edf65c26', CAST(N'2017-11-25 23:36:48.067' AS DateTime), CAST(N'2017-11-25 21:36:48.067' AS DateTime), N'System.Web.Management.WebErrorEvent', CAST(35 AS Decimal(19, 0)), CAST(1 AS Decimal(19, 0)), 3006, 0, N'Ocorreu um erro do analisador.', N'C:\Users\Hugo\Desktop\SGA\SGA\', N'/', N'HUGO-PC', N'http://192.168.43.150/Views/SGA/VUsuario/CadastroUsuario.aspx', N'System.Web.HttpParseException', N'Código do evento: 3006
Mensagem do evento: Ocorreu um erro do analisador.
Hora do evento: 25/11/2017 21:36:48
Hora do evento (UTC): 25/11/2017 23:36:48
Identificação do Evento: 793f40dee9904f30ac909cf7edf65c26
Seqüência de eventos: 35
Ocorrência do evento: 1
Código de detalhe do evento: 0

Informações sobre o aplicativo:
    Domínio do aplicativo: /LM/W3SVC/1/ROOT-39-131561261617436745
    Nível de confiança: Full
    Caminho Virtual do Aplicativo: /
    Caminho do Aplicativo: C:\Users\Hugo\Desktop\SGA\SGA\
    Nome do computador: HUGO-PC

Informações sobre o processo:
    Identificação do processo: 8024
    Nome do processo: w3wp.exe
    Nome da conta: IIS APPPOOL\DefaultAppPool

Informações sobre a exceção:
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: Marca do servidor não está formada corretamente.

Informações sobre exceção interna (nível 1):
    Tipo da exceção: System.Web.HttpException
    Mensagem da exceção: Marca do servidor não está formada corretamente.

Informações sobre a solicitação:
    URL da solicitação: http://192.168.43.150/Views/SGA/VUsuario/CadastroUsuario.aspx
    Caminho da solicitação: /Views/SGA/VUsuario/CadastroUsuario.aspx
    Endereço do host do usuário: 192.168.43.150
    Usuário: HugoGestor
    Está autenticado: Verdadeiro
    Tipo de Autenticação: Forms
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool

Informações sobre o thread:
    Identificação de Thread: 53
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool
    Está representando: Falso
    Rastreamento de pilha:    em System.Web.UI.TemplateParser.ParseString(String text, VirtualPath virtualPath, Encoding fileEncoding)
   em System.Web.UI.TemplateParser.ParseFile(String physicalPath, VirtualPath virtualPath)
   em System.Web.UI.TemplateParser.ParseInternal()
   em System.Web.UI.TemplateParser.Parse()
   em System.Web.Compilation.BaseTemplateBuildProvider.get_CodeCompilerType()
   em System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   em System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   em System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   em System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   em System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   em System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   em System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

')
INSERT [dbo].[aspnet_WebEvent_Events] ([EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (N'7dd0a47d31674120ae479391b6baaaf6', CAST(N'2017-11-26 01:32:30.707' AS DateTime), CAST(N'2017-11-25 23:32:30.707' AS DateTime), N'System.Web.Management.WebErrorEvent', CAST(30 AS Decimal(19, 0)), CAST(1 AS Decimal(19, 0)), 3006, 0, N'Ocorreu um erro do analisador.', N'C:\Users\Hugo\Desktop\SGA\SGA\', N'/', N'HUGO-PC', N'http://192.168.43.150/Views/SGA/VEspecialidade/ConsultaEspecServ.aspx', N'System.Web.HttpParseException', N'Código do evento: 3006
Mensagem do evento: Ocorreu um erro do analisador.
Hora do evento: 25/11/2017 23:32:30
Hora do evento (UTC): 26/11/2017 01:32:30
Identificação do Evento: 7dd0a47d31674120ae479391b6baaaf6
Seqüência de eventos: 30
Ocorrência do evento: 1
Código de detalhe do evento: 0

Informações sobre o aplicativo:
    Domínio do aplicativo: /LM/W3SVC/1/ROOT-45-131561331530035517
    Nível de confiança: Full
    Caminho Virtual do Aplicativo: /
    Caminho do Aplicativo: C:\Users\Hugo\Desktop\SGA\SGA\
    Nome do computador: HUGO-PC

Informações sobre o processo:
    Identificação do processo: 8024
    Nome do processo: w3wp.exe
    Nome da conta: IIS APPPOOL\DefaultAppPool

Informações sobre a exceção:
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: Não foi possível carregar o tipo ''SGA.Views.SGA.VEspecialidade.ConsultaEspecServ''.

Informações sobre exceção interna (nível 1):
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: Não foi possível carregar o tipo ''SGA.Views.SGA.VEspecialidade.ConsultaEspecServ''.

Informações sobre exceção interna (nível 2):
    Tipo da exceção: System.Web.HttpException
    Mensagem da exceção: Não foi possível carregar o tipo ''SGA.Views.SGA.VEspecialidade.ConsultaEspecServ''.

Informações sobre a solicitação:
    URL da solicitação: http://192.168.43.150/Views/SGA/VEspecialidade/ConsultaEspecServ.aspx
    Caminho da solicitação: /Views/SGA/VEspecialidade/ConsultaEspecServ.aspx
    Endereço do host do usuário: 192.168.43.6
    Usuário: jonasgestor
    Está autenticado: Verdadeiro
    Tipo de Autenticação: Forms
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool

Informações sobre o thread:
    Identificação de Thread: 26
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool
    Está representando: Falso
    Rastreamento de pilha:    em System.Web.UI.TemplateParser.ParseString(String text, VirtualPath virtualPath, Encoding fileEncoding)
   em System.Web.UI.TemplateParser.ParseFile(String physicalPath, VirtualPath virtualPath)
   em System.Web.UI.TemplateParser.ParseInternal()
   em System.Web.UI.TemplateParser.Parse()
   em System.Web.Compilation.BaseTemplateBuildProvider.get_CodeCompilerType()
   em System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   em System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   em System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   em System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   em System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   em System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   em System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

')
INSERT [dbo].[aspnet_WebEvent_Events] ([EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (N'95b4353a922b4282b9a914c7de5202fa', CAST(N'2017-11-26 00:25:41.410' AS DateTime), CAST(N'2017-11-25 22:25:41.410' AS DateTime), N'System.Web.Management.WebErrorEvent', CAST(94 AS Decimal(19, 0)), CAST(1 AS Decimal(19, 0)), 3006, 0, N'Ocorreu um erro do analisador.', N'C:\Users\Hugo\Desktop\SGA\SGA\', N'/', N'HUGO-PC', N'http://192.168.43.150/Views/SGA/VServico/CadastroServico.aspx', N'System.Web.HttpParseException', N'Código do evento: 3006
Mensagem do evento: Ocorreu um erro do analisador.
Hora do evento: 25/11/2017 22:25:41
Hora do evento (UTC): 26/11/2017 00:25:41
Identificação do Evento: 95b4353a922b4282b9a914c7de5202fa
Seqüência de eventos: 94
Ocorrência do evento: 1
Código de detalhe do evento: 0

Informações sobre o aplicativo:
    Domínio do aplicativo: /LM/W3SVC/1/ROOT-41-131561292249568803
    Nível de confiança: Full
    Caminho Virtual do Aplicativo: /
    Caminho do Aplicativo: C:\Users\Hugo\Desktop\SGA\SGA\
    Nome do computador: HUGO-PC

Informações sobre o processo:
    Identificação do processo: 8024
    Nome do processo: w3wp.exe
    Nome da conta: IIS APPPOOL\DefaultAppPool

Informações sobre a exceção:
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre exceção interna (nível 1):
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre exceção interna (nível 2):
    Tipo da exceção: System.Web.HttpException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre a solicitação:
    URL da solicitação: http://192.168.43.150/Views/SGA/VServico/CadastroServico.aspx
    Caminho da solicitação: /Views/SGA/VServico/CadastroServico.aspx
    Endereço do host do usuário: 192.168.43.150
    Usuário: HugoGestor
    Está autenticado: Verdadeiro
    Tipo de Autenticação: Forms
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool

Informações sobre o thread:
    Identificação de Thread: 32
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool
    Está representando: Falso
    Rastreamento de pilha:    em System.Web.UI.TemplateParser.ParseString(String text, VirtualPath virtualPath, Encoding fileEncoding)
   em System.Web.UI.TemplateParser.ParseFile(String physicalPath, VirtualPath virtualPath)
   em System.Web.UI.TemplateParser.ParseInternal()
   em System.Web.UI.TemplateParser.Parse()
   em System.Web.Compilation.BaseTemplateBuildProvider.get_CodeCompilerType()
   em System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   em System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   em System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   em System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   em System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   em System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   em System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

')
INSERT [dbo].[aspnet_WebEvent_Events] ([EventId], [EventTimeUtc], [EventTime], [EventType], [EventSequence], [EventOccurrence], [EventCode], [EventDetailCode], [Message], [ApplicationPath], [ApplicationVirtualPath], [MachineName], [RequestUrl], [ExceptionType], [Details]) VALUES (N'd714dc02ad6a4a6a8c314f88d14811f2', CAST(N'2017-11-26 00:25:41.417' AS DateTime), CAST(N'2017-11-25 22:25:41.417' AS DateTime), N'System.Web.Management.WebErrorEvent', CAST(95 AS Decimal(19, 0)), CAST(2 AS Decimal(19, 0)), 3006, 0, N'Ocorreu um erro do analisador.', N'C:\Users\Hugo\Desktop\SGA\SGA\', N'/', N'HUGO-PC', N'http://192.168.43.150/Views/SGA/VServico/CadastroServico.aspx', N'System.Web.HttpParseException', N'Código do evento: 3006
Mensagem do evento: Ocorreu um erro do analisador.
Hora do evento: 25/11/2017 22:25:41
Hora do evento (UTC): 26/11/2017 00:25:41
Identificação do Evento: d714dc02ad6a4a6a8c314f88d14811f2
Seqüência de eventos: 95
Ocorrência do evento: 2
Código de detalhe do evento: 0

Informações sobre o aplicativo:
    Domínio do aplicativo: /LM/W3SVC/1/ROOT-41-131561292249568803
    Nível de confiança: Full
    Caminho Virtual do Aplicativo: /
    Caminho do Aplicativo: C:\Users\Hugo\Desktop\SGA\SGA\
    Nome do computador: HUGO-PC

Informações sobre o processo:
    Identificação do processo: 8024
    Nome do processo: w3wp.exe
    Nome da conta: IIS APPPOOL\DefaultAppPool

Informações sobre a exceção:
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre exceção interna (nível 1):
    Tipo da exceção: System.Web.HttpParseException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre exceção interna (nível 2):
    Tipo da exceção: System.Web.HttpException
    Mensagem da exceção: A marca contém atributos ''onclick'' duplicados.

Informações sobre a solicitação:
    URL da solicitação: http://192.168.43.150/Views/SGA/VServico/CadastroServico.aspx
    Caminho da solicitação: /Views/SGA/VServico/CadastroServico.aspx
    Endereço do host do usuário: 192.168.43.150
    Usuário: HugoGestor
    Está autenticado: Verdadeiro
    Tipo de Autenticação: Forms
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool

Informações sobre o thread:
    Identificação de Thread: 18
    Nome da conta de thread: IIS APPPOOL\DefaultAppPool
    Está representando: Falso
    Rastreamento de pilha:    em System.Web.UI.TemplateParser.ParseString(String text, VirtualPath virtualPath, Encoding fileEncoding)
   em System.Web.UI.TemplateParser.ParseFile(String physicalPath, VirtualPath virtualPath)
   em System.Web.UI.TemplateParser.ParseInternal()
   em System.Web.UI.TemplateParser.Parse()
   em System.Web.Compilation.BaseTemplateBuildProvider.get_CodeCompilerType()
   em System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   em System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   em System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   em System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   em System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   em System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   em System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   em System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

')
SET IDENTITY_INSERT [dbo].[Atendimento] ON 

INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (136, CAST(N'2017-11-16 22:45:30.827' AS DateTime), CAST(N'2017-11-26 01:16:02.727' AS DateTime), N'Servidor de e-mails do cliente é Gmail, logo foi utilizado como ferramenta o ''gapps sync'' para criação de perfil, e configuração de conta no Outlook.', 97, 76, 75, 23, N'6.57', 13, CAST(N'2017-11-26 01:16:02.727' AS DateTime), N'jonastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (137, CAST(N'2017-11-17 22:54:27.390' AS DateTime), CAST(N'2017-11-26 01:14:26.433' AS DateTime), N'Foi realizado a montagem de 5 desktops.', 98, 80, 79, 26, N'2.30', 13, CAST(N'2017-11-26 01:14:26.433' AS DateTime), N'hugotecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (138, CAST(N'2017-11-18 22:54:32.140' AS DateTime), CAST(N'2017-11-26 01:06:42.667' AS DateTime), N'Foi instalado a nova memória solicitada pelo cliente.', 99, 78, 77, 24, N'2.02', 13, CAST(N'2017-11-26 01:06:42.667' AS DateTime), N'douglastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (139, CAST(N'2017-11-19 22:56:50.463' AS DateTime), CAST(N'2017-11-26 00:24:58.010' AS DateTime), NULL, 100, 78, 77, 24, N' 0.00', 13, CAST(N'2017-11-26 00:24:58.010' AS DateTime), N'jonasgestor')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (140, CAST(N'2017-11-20 23:03:46.513' AS DateTime), CAST(N'2017-11-26 01:15:20.540' AS DateTime), N'Foi realizado limpeza do computador e remoção de virus.', 101, 80, 79, 26, N' 5.70', 13, CAST(N'2017-11-26 01:15:20.540' AS DateTime), N'hugotecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (141, CAST(N'2017-11-21 00:29:30.287' AS DateTime), CAST(N'2017-11-26 00:42:51.833' AS DateTime), NULL, 102, 78, 77, 24, N' 0.00', 13, CAST(N'2017-11-26 00:42:51.833' AS DateTime), N'douglascliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (142, CAST(N'2017-11-22 00:43:23.050' AS DateTime), CAST(N'2017-11-26 01:07:24.497' AS DateTime), N'Realizamos a manutenção preventiva conforme solicitado.', 103, 78, 77, 24, N'43.25', 13, CAST(N'2017-11-26 01:07:24.497' AS DateTime), N'douglastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (143, NULL, NULL, NULL, 104, 82, 81, 25, N' 0.00', 13, CAST(N'2017-11-26 01:19:35.517' AS DateTime), N'fabianotecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (144, CAST(N'2017-11-24 01:00:10.493' AS DateTime), CAST(N'2017-11-26 01:20:36.267' AS DateTime), N'Normalizada a conexão com a internet após contato com o provedor de internet do cliente.', 105, 82, 81, 25, N'10.01', 13, CAST(N'2017-11-26 01:20:36.267' AS DateTime), N'fabianotecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (145, CAST(N'2017-11-25 01:05:02.973' AS DateTime), CAST(N'2017-11-26 01:17:53.007' AS DateTime), N'Foi dado início ao atendimento no cliente.', 106, 76, 75, 23, N'20.02', 13, CAST(N'2017-11-26 01:17:53.007' AS DateTime), N'jonastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (146, NULL, NULL, NULL, 106, 76, 75, 23, N' 0.00', 13, CAST(N'2017-11-26 01:17:53.023' AS DateTime), N'jonastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (148, CAST(N'2017-11-26 01:27:29.120' AS DateTime), NULL, NULL, 107, 76, 75, 23, NULL, 13, CAST(N'2017-11-26 01:28:13.437' AS DateTime), N'jonastecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (149, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 108, 76, 75, 23, N'0.00', 13, CAST(N'2017-11-26 02:48:17.087' AS DateTime), N'JonasCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (150, NULL, NULL, NULL, 108, 76, 75, 23, NULL, 13, CAST(N'2017-11-26 02:49:16.207' AS DateTime), N'JonasTecnico')
SET IDENTITY_INSERT [dbo].[Atendimento] OFF
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'', 136, 97, 13, CAST(N'2017-11-26 01:23:03.293' AS DateTime), N'jonascliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 3, N'', 137, 98, 13, CAST(N'2017-11-26 01:17:47.183' AS DateTime), N'hugocliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 4, N'Excelente técnico. ', 138, 99, 13, CAST(N'2017-11-26 01:16:12.127' AS DateTime), N'douglascliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, 4, N'', 140, 101, 13, CAST(N'2017-11-26 01:17:25.210' AS DateTime), N'hugocliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'', 142, 103, 13, CAST(N'2017-11-26 01:16:42.563' AS DateTime), N'douglascliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'', 144, 105, 13, CAST(N'2017-11-26 01:24:12.540' AS DateTime), N'fabianocliente')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, 136, 97, 13, CAST(N'2017-11-26 02:35:35.133' AS DateTime), N'JonasTecnico')
SET IDENTITY_INSERT [dbo].[Chamado] ON 

INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (97, 75, N'Configuração de contas de e-mail no Outlook', N'Configuração de novas contas de e-mail nas máquinas dos usuários.', 3, CAST(N'2017-11-16 22:45:30.827' AS DateTime), CAST(N'2017-11-26 01:16:02.733' AS DateTime), 36, 3, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:16:02.733' AS DateTime), N'jonastecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (98, 79, N'Montar PC', N'Realizar a montagem de 5 desktops.', 3, CAST(N'2017-11-17 22:54:27.390' AS DateTime), CAST(N'2017-11-26 01:14:26.440' AS DateTime), 33, 2, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:14:26.440' AS DateTime), N'hugotecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (99, 77, N'Instalação de Memória', N'Preciso instalar nova memória no computador.', 3, CAST(N'2017-11-18 22:54:32.140' AS DateTime), CAST(N'2017-11-26 01:06:42.673' AS DateTime), 41, 3, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:06:42.673' AS DateTime), N'douglastecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (100, 77, N'Computador lento', N'O computador apresenta lentidão durante o uso.', 5, CAST(N'2017-11-19 22:56:50.463' AS DateTime), CAST(N'2017-11-26 00:24:58.000' AS DateTime), 32, 4, N'Chamado Errado!', NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 00:24:58.000' AS DateTime), N'jonasgestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (101, 79, N'Computador Travando', N'Computador trava e só volta reiniciando!', 3, CAST(N'2017-11-20 23:03:46.513' AS DateTime), CAST(N'2017-11-26 01:15:20.547' AS DateTime), 33, 4, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:15:20.547' AS DateTime), N'hugotecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (102, 77, N'Computador lento', N'O computador apresenta lentidão durante o uso.', 5, CAST(N'2017-11-21 00:29:30.287' AS DateTime), CAST(N'2017-11-26 00:42:51.827' AS DateTime), 32, 4, N'Chamado Errado!', NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 00:42:51.827' AS DateTime), N'douglascliente')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (103, 77, N'Computador lento', N'Computador apresentando lentidão!', 3, CAST(N'2017-11-22 00:43:23.050' AS DateTime), CAST(N'2017-11-26 01:07:24.507' AS DateTime), 32, 4, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:07:24.507' AS DateTime), N'douglastecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (104, 81, N'Computadores sem acesso a rede', N'Perdemos acesso a rede!', 2, CAST(N'2017-11-23 00:54:06.217' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 37, 4, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:19:35.517' AS DateTime), N'fabianotecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (105, 81, N'Sem conexão com a internet', N'Caiu a internet do nosso escritório!', 3, CAST(N'2017-11-24 01:00:10.493' AS DateTime), CAST(N'2017-11-26 01:20:36.277' AS DateTime), 38, 4, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:20:36.277' AS DateTime), N'fabianotecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (106, 75, N'Ajuda com PROCV', N'Precisamos com ajuda em relação a criação de PROC-V', 4, CAST(N'2017-11-25 01:05:02.973' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 34, 3, NULL, NULL, NULL, 13, 0, 1, CAST(N'2017-11-26 01:17:53.017' AS DateTime), N'jonastecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (107, 75, N'Criar PST para usuários', N'Criar arquivos PST para usuários que estão ficando sem espaço no servidor de e-mail.', 2, CAST(N'2017-11-26 01:27:29.120' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 36, 2, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 01:28:13.437' AS DateTime), N'jonastecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (108, 75, N'Meu Word não está abrindo', N'O Word parou de abrir e não consigo mais utiliza-lo.', 1, CAST(N'2017-11-26 02:48:17.070' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 35, 3, NULL, NULL, NULL, 13, 0, 0, CAST(N'2017-11-26 02:48:17.070' AS DateTime), N'JonasCliente')
SET IDENTITY_INSERT [dbo].[Chamado] OFF
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (79, N'12345678', N'Detran', N'13453222750')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (77, N'118438092', N'Detran', N'12556634723')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (75, N'231016858', N'Detran', N'12990483748')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (81, N'123456789', N'Detran', N'09372433705')
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([idEmpresa], [nome], [endereco], [complemento], [cep], [telefone], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (13, N'InfoTI', N'Av. Rio Branco', N'156', N'20011901', N'2127778988', 1, CAST(N'2017-11-26 02:24:18.643' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Especialidade] ON 

INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (20, N'Office', N'Office', 1, 13, CAST(N'2017-11-25 20:26:14.590' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (21, N'Montagem e Manutenção de PC', N'Montagem e Manutenção de PC', 1, 13, CAST(N'2017-11-25 20:28:37.390' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (22, N'Instalação', N'Instalação', 0, 13, CAST(N'2017-11-25 20:28:46.567' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (23, N'Rede', N'Rede', 1, 13, CAST(N'2017-11-25 20:27:09.330' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (24, N'Hardware', N'Hardware', 1, 13, CAST(N'2017-11-25 20:27:17.647' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (25, N'IOS', N'IOS', 1, 13, CAST(N'2017-11-25 20:27:38.247' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (26, N'Linux', N'Linux', 1, 13, CAST(N'2017-11-25 20:27:48.020' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (27, N'Windows', N'Windows', 1, 13, CAST(N'2017-11-25 20:27:54.023' AS DateTime), N'jonasgestor')
INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (28, N'Software', N'Software', 1, 13, CAST(N'2017-11-25 20:29:02.190' AS DateTime), N'jonasgestor')
SET IDENTITY_INSERT [dbo].[Especialidade] OFF
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (72, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (71, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (73, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (74, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (76, 2)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (78, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (80, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (82, 1)
SET IDENTITY_INSERT [dbo].[Geolocalizacao] ON 

INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (944, N'-22.9248572', N'-43.2311402', 76, 13, CAST(N'2017-11-26 01:10:32.797' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (945, N'-22.9248572', N'-43.2311402', 76, 13, CAST(N'2017-11-26 01:10:42.893' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (946, N'-22.9248572', N'-43.2311402', 76, 13, CAST(N'2017-11-26 01:10:52.950' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (947, N'-22.9263426', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:11:03.033' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (948, N'-22.9263426', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:11:13.127' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (949, N'-22.9263426', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:11:23.183' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (950, N'-22.9263432', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:11:33.310' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (951, N'-22.9263432', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:11:43.327' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (952, N'-22.9263432', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:11:53.397' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (953, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:03.473' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (954, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:13.557' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (955, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:23.657' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (956, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:33.733' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (957, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:43.767' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (958, N'-22.9263435', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:12:53.840' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (959, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:04.393' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (960, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:14.007' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (961, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:24.117' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (962, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:34.137' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (963, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:44.233' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (964, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:13:54.297' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (965, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:04.383' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (966, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:14.450' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (967, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:24.533' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (968, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:34.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (969, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:44.683' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (970, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:14:54.713' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (971, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:04.760' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (972, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:14.827' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (973, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:24.903' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (974, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:34.973' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (975, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:45.050' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (976, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:15:55.120' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (977, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:16:05.177' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (978, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:16:15.267' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (979, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:16:25.323' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (980, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:16:35.410' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (981, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:16:45.483' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (982, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:16:55.567' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (983, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:05.663' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (984, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:15.703' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (985, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:25.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (986, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:35.843' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (987, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:45.903' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (988, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:17:55.980' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (989, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:06.070' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (990, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:16.137' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (991, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:26.237' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (992, N'-22.9263435', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:36.290' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (993, N'-22.9263435', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:46.363' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (994, N'-22.9263435', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:18:56.430' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (995, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:19:06.533' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (996, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:19:16.583' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (997, N'-22.9263432', N'-43.231046', 76, 13, CAST(N'2017-11-26 01:19:26.687' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (998, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:19:36.710' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (999, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:19:46.777' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1000, N'-22.926343', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:19:56.853' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1001, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:06.920' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1002, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:17.003' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1003, N'-22.9263433', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:27.063' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1004, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:37.140' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1005, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:47.220' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1006, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:20:57.280' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1007, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:21:07.357' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1008, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:21:17.430' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1009, N'-22.9263431', N'-43.2310461', 76, 13, CAST(N'2017-11-26 01:21:27.513' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1010, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:21:37.623' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1011, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:21:47.690' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1012, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:21:57.733' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1013, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:22:07.820' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1014, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:22:17.893' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1015, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:22:27.953' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1016, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:22:38.027' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1017, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:22:48.113' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1018, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:22:58.180' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1019, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:23:08.280' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1020, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:23:18.360' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1021, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:23:28.433' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1022, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:23:38.513' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1023, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:23:48.587' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1024, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:23:58.650' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1025, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:08.723' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1026, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:18.757' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1027, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:28.837' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1028, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:38.907' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1029, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:48.997' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1030, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:24:59.077' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1031, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:25:09.170' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1032, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:25:19.247' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1033, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:25:29.310' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1034, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:25:39.400' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1035, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:25:49.463' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1036, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:25:59.550' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1037, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:09.623' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1038, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:19.690' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1039, N'-22.926343', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:29.777' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1040, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:39.833' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1041, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:49.913' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1042, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:26:59.977' AS DateTime))
GO
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1043, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:27:10.080' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1044, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:27:20.120' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1045, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:27:30.180' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1046, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:27:40.253' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1047, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:27:50.330' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1048, N'-22.9263432', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:00.397' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1049, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:10.483' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1050, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:20.547' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1051, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:30.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1052, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:40.713' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1053, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:28:50.740' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1054, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:29:00.830' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1055, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:29:10.913' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1056, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:29:20.977' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1057, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:29:31.033' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1058, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:29:41.103' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1059, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:29:51.183' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1060, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:30:01.303' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1061, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:30:11.367' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1062, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:30:21.480' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1063, N'-22.9263431', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:30:31.553' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1064, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:30:41.630' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1065, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:30:51.670' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1066, N'-22.9263431', N'-43.2310456', 76, 13, CAST(N'2017-11-26 01:31:01.713' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1067, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:31:11.780' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1068, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:31:21.847' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1069, N'-22.9263433', N'-43.2310457', 76, 13, CAST(N'2017-11-26 01:31:31.920' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1070, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:31:41.993' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1071, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:31:52.063' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1072, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:32:02.170' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1073, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:32:12.210' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1074, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:32:22.280' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1075, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:32:32.347' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1076, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:32:42.417' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1077, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:32:52.483' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1078, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:33:02.550' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1079, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:33:12.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1080, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:33:22.717' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1081, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:33:32.737' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1082, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:33:42.807' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1083, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:33:52.873' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1084, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:34:02.947' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1085, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:34:13.033' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1086, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:34:23.097' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1087, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:34:33.160' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1088, N'-22.9263423', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:34:43.270' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1089, N'-22.9263423', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:34:53.337' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1090, N'-22.9263423', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:35:03.403' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1091, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:35:13.453' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1092, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:35:23.517' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1093, N'-22.9263422', N'-43.2310452', 76, 13, CAST(N'2017-11-26 01:35:33.583' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1094, N'-22.9263423', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:35:43.660' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1095, N'-22.9263423', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:35:53.727' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1096, N'-22.9263423', N'-43.231045', 76, 13, CAST(N'2017-11-26 01:36:03.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1097, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:36:13.857' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1098, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:36:23.937' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1099, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:36:34.023' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1100, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:36:44.077' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1101, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:36:54.377' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1102, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:37:04.197' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1103, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:37:14.277' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1104, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:37:24.347' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1105, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:37:34.417' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1106, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:37:44.500' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1107, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:37:54.547' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1108, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:38:04.633' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1109, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:38:14.700' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1110, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:38:24.740' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1111, N'-22.9263422', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:38:34.813' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1112, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:38:44.893' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1113, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:38:54.980' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1114, N'-22.9263423', N'-43.2310453', 76, 13, CAST(N'2017-11-26 01:39:05.083' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1115, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:39:15.137' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1116, N'-22.9263423', N'-43.2310451', 76, 13, CAST(N'2017-11-26 01:39:25.260' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1117, N'-22.9099504', N'-43.1795779', 78, 13, CAST(N'2017-11-26 01:30:00.000' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1119, N'-22.7869847', N'-43.3167504', 80, 13, CAST(N'2017-11-26 01:30:00.000' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [idEmpresa], [dataRegistro]) VALUES (1120, N'-22.9447787', N'-43.5158834', 82, 13, CAST(N'2017-11-26 01:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Geolocalizacao] OFF
SET IDENTITY_INSERT [dbo].[LogExcecoesTratadas] ON 

INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (143, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:59:29.630' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (173, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:16:59.873' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (199, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VEspecialidade.InativarEspecialidade.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\InativarEspecialidade.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 20:28:46.573' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (200, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:29:09.477' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (201, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:29:40.330' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (209, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:33:19.393' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (210, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:33:52.660' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (202, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:30:11.220' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (203, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:30:30.093' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (204, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:30:42.097' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (205, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:31:13.310' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (206, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:31:44.173' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (207, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:32:15.497' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (208, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:32:46.307' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (180, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:20:41.153' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (181, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:21:12.323' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (182, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:21:45.557' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (183, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:22:18.783' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (184, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:22:49.703' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (185, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:23:23.000' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (211, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:34:25.867' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (243, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:42:36.297' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (244, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:43:27.190' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (245, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:43:55.523' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (246, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:44:05.270' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (247, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:45:27.927' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (248, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:45:35.987' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (249, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:45:38.183' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (263, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:54:32.877' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (212, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:34:57.553' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (225, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:36:54.663' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (250, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:49:19.113' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (251, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:49:19.137' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (252, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:49:19.633' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (253, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:49:22.017' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (254, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:49:22.043' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (259, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VServico.CadastroServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\CadastroServico.aspx.cs:linha 23', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 20:54:27.573' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (255, N'DataBinding: ''SGA.Models.Servicos.TipoServico'' não contém uma propriedade com o nome ''FirstName''.', N'System.Web', N'   em System.Web.UI.DataBinder.GetPropertyValue(Object container, String propName)
   em System.Web.UI.DataBinder.GetPropertyValue(Object container, String propName, String format)
   em System.Web.UI.WebControls.ListControl.PerformDataBinding(IEnumerable dataSource)
   em System.Web.UI.WebControls.ListControl.OnDataBinding(EventArgs e)
   em System.Web.UI.WebControls.ListControl.PerformSelect()
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em System.Web.UI.Control.DataBindChildren()
   em System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 32', N'System.Object GetPropertyValue(System.Object, System.String)', CAST(N'2017-11-25 20:49:24.190' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (267, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:58:38.887' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (328, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:25:15.037' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (365, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:41:55.297' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (443, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:12:19.057' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (268, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:58:38.930' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (277, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:00:23.927' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (280, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:00:27.830' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (281, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:00:30.330' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (282, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:00:30.353' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (283, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 21:02:13.050' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (285, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:08:58.913' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (174, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:17:30.977' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (175, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:18:06.177' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (176, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:18:37.053' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (177, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:19:08.093' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (178, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:19:39.233' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (179, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:20:10.140' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (186, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:23:53.880' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (377, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:47:55.813' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (378, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:48:21.110' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (379, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:48:21.333' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (380, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:48:26.643' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (408, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:57:59.853' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (409, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:58:33.257' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (410, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:59:05.293' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (286, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:08:58.937' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (287, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:08:59.503' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (288, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:09:57.670' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (289, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:10:00.020' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (290, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:13:33.850' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (291, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:13:42.063' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (292, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:13:44.153' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (293, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:16:05.317' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (213, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:35:37.183' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (215, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:35:37.207' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (218, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:35:37.737' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (219, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:35:40.710' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (220, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:35:40.740' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (260, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:54:29.923' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (261, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:54:30.447' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (262, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:54:32.807' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (149, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:05:00.623' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (150, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:05:31.390' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (151, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:06:02.147' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (152, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:06:34.150' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (153, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:07:04.917' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (154, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:07:18.817' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (155, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:07:25.803' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (371, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:44:40.287' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (372, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:45:13.343' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (381, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:48:52.240' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (382, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:48:57.593' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (383, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:49:25.510' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (384, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:49:28.737' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (385, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:49:56.457' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (305, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:21:03.963' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (306, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:21:03.987' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (307, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:21:34.003' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (308, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:21:49.063' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (309, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:22:04.763' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (311, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:24:02.690' AS DateTime), N'HugoGestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (319, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.Cadastro.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\CadastroUsuario.aspx.cs:linha 30', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 21:25:09.447' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (320, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:25:11.790' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (278, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:00:27.830' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (337, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:29:18.463' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (366, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:42:14.677' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (367, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:42:28.590' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (368, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:42:59.520' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (369, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:43:33.020' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (370, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:44:09.047' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (321, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:11.913' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (322, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:14.203' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (323, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:25:14.287' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (324, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_inicio_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_qqfxrvva.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 21:25:14.583' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (325, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:14.587' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (326, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:14.597' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (327, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:15.017' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (144, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VTipoServico.InativarTipoServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VTipoServico\InativarTipoServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 20:00:24.300' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (145, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:01:25.337' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (146, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:04:06.887' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (147, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:04:37.990' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (148, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:04:38.397' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (156, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:07:58.730' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (157, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:08:29.783' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (162, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:11:11.423' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (163, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:11:44.263' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (168, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:14:24.450' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (169, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:14:55.350' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (170, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:15:26.697' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (171, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:15:57.607' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (172, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:16:29.123' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (214, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:35:37.183' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (216, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:35:37.207' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (217, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:35:37.737' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (222, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:36:54.127' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (229, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:38:24.930' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (230, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:38:24.980' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (231, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:38:42.057' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (232, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:38:45.017' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (135, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:55:53.177' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (136, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:56:26.997' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (137, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:56:58.423' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (138, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:57:32.710' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (139, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:58:06.307' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (158, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:09:01.043' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (187, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:24:27.183' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (131, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:49:39.900' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (132, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:50:13.557' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (133, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:50:33.717' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (134, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:51:07.553' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (140, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:58:46.953' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (141, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:58:58.277' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (142, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:59:18.240' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (130, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 19:46:16.403' AS DateTime), N'Admin')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (233, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:38:45.053' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (256, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:49:56.680' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (257, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:50:05.463' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (258, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:50:07.633' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (279, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:00:27.830' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (298, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:17:53.940' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (299, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:18:04.723' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (159, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:09:34.293' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (160, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:10:07.540' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (161, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:10:38.423' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (164, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:12:17.473' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (165, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:12:48.417' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (166, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:13:21.823' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (167, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:13:53.143' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (188, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:24:58.473' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (189, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:25:29.843' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (190, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:26:03.027' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (191, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:26:34.303' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (264, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:58:32.523' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (265, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:58:32.553' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (266, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:58:34.373' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (192, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:27:05.090' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (193, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:27:36.343' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (194, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:28:07.847' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (195, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:28:38.143' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (196, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:28:38.147' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (197, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:28:38.197' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (198, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:28:38.620' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (284, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:08:05.673' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (313, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vusuario_cadastrousuario_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_dpdgrj5p.0.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 21:24:18.357' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (314, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:24:18.360' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (315, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:24:18.367' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (317, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:24:22.000' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (318, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:24:22.003' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (343, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:36:16.070' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (294, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:16:05.347' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (295, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:16:05.850' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (296, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:16:08.237' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (297, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:16:08.263' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (301, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:21:00.053' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (302, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:21:00.080' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (303, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:21:00.657' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (304, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:21:01.873' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (269, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:58:58.403' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (270, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:59:03.280' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (271, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:59:05.603' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (272, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VServico.CadastroServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\CadastroServico.aspx.cs:linha 23', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 21:00:21.847' AS DateTime), N'HugoGestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (273, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:00:21.863' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (274, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:00:22.830' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (275, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:00:22.840' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (276, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:00:23.917' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (234, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:41:34.060' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (235, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:41:34.090' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (236, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:41:34.610' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (237, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:41:37.000' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (238, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:41:37.027' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (239, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:42:33.487' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (240, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:42:33.507' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (221, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VServico.ConsultaServicos.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\ConsultaServicos.aspx.cs:linha 27', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 20:36:53.810' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (223, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:36:54.133' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (224, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 20:36:54.137' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (226, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:36:54.663' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (227, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:36:57.787' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (228, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 20:36:57.820' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (241, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:42:34.030' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (242, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 20:42:36.273' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (316, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vusuario_cadastrousuario_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_dpdgrj5p.0.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 21:24:21.993' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (344, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:36:39.537' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (345, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:36:47.477' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (346, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:36:48.383' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (347, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:37:07.310' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (348, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:37:08.357' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (300, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:18:12.610' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (310, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:24:02.690' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (312, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:24:03.180' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (373, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:45:47.630' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (374, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:46:20.863' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (375, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:46:51.740' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (376, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:47:22.607' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (411, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:59:46.373' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (412, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:00:17.333' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (413, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:00:48.660' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (414, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:01:19.583' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (415, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:01:41.507' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (416, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:01:54.150' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (417, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:02:13.693' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (329, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_inicio_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_qqfxrvva.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 21:25:15.047' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (330, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:15.050' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (331, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:15.057' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (332, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:25:21.087' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (334, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:21.103' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (335, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:25:21.113' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (336, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:26:18.727' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (333, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_inicio_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_qqfxrvva.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 21:25:21.097' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (338, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.Cadastro.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\CadastroUsuario.aspx.cs:linha 30', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 21:29:34.847' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (339, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:29:35.227' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (340, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:29:35.797' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (341, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:29:40.587' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (342, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:29:40.703' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (349, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:37:09.390' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (350, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:37:12.797' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (351, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:37:18.383' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (352, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:37:49.120' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (353, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:38:22.247' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (355, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:38:58.757' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (354, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:38:58.757' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (356, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:38:58.800' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (357, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 21:38:58.800' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (358, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:38:59.417' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (359, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:38:59.417' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (360, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 21:39:01.840' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (361, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:39:01.867' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (362, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:40:25.670' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (363, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:40:56.850' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (364, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:41:30.007' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (386, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:49:59.663' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (391, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:51:34.303' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (403, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:55:19.840' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (404, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:55:51.037' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (405, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:56:24.147' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (406, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:56:55.163' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (407, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:57:26.967' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (387, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:50:29.490' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (392, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:51:34.303' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (399, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:53:09.757' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (400, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:53:42.713' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (401, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:54:15.857' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (402, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:54:46.780' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (421, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:04:21.533' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (388, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:50:30.407' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (422, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:04:23.060' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (423, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:04:53.517' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (424, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:05:24.573' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (425, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:05:46.027' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (426, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:06:17.040' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (427, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:06:47.860' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (389, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:51:00.637' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (428, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:07:01.580' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (429, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:07:23.193' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (439, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:10:43.337' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (440, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VTipoServico.InativarTipoServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VTipoServico\InativarTipoServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:10:50.017' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (441, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:11:14.453' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (442, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:11:45.813' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (390, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:51:01.230' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (393, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:52:07.243' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (394, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:52:07.243' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (395, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 21:52:38.373' AS DateTime), N'fabianogestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (396, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 21:52:38.570' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (397, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 21:52:41.263' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (398, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 21:52:43.573' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (418, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:02:44.717' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (419, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:03:17.800' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (420, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:03:50.790' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (430, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:07:32.833' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (431, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:07:55.043' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (432, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:08:04.143' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (433, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:08:29.043' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (434, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:08:34.703' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (435, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:09:02.490' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (436, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:09:05.683' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (437, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:09:38.710' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (438, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:10:11.727' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (448, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:13:58.623' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (449, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:14:29.477' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (444, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:12:48.023' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (445, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:12:54.470' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (446, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VTipoServico.InativarTipoServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VTipoServico\InativarTipoServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:13:00.113' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (447, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:13:27.560' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (450, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:15:00.443' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (452, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:15:31.320' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (454, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:16:02.273' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (451, N'Violação da restrição PRIMARY KEY ''PK_ServicoXEspecialidade''. Não é possível inserir a chave duplicada no objeto ''dbo.ServicoXEspecialidade''. O valor de chave duplicada é (28, 30).
A instrução foi finalizada.', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   em SGA.Models.DAO.ManterDAO.ManterEspecialidadeDAO.RelacionaEspecServDAO() na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterEspecialidadeDAO.cs:linha 242
   em SGA.Models.Manter.ManterEspecialidade.RelacionaEspecServ() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterEspecialidade.cs:linha 94
   em SGA.Views.SGA.VEspecialidade.RelacionaEspecServ.RelacionarButton_Click(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\RelacionaEspecServ.aspx.cs:linha 60', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-25 22:15:21.827' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (470, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:20:53.357' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (471, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:20:53.423' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (472, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:21:01.940' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (453, N'Violação da restrição PRIMARY KEY ''PK_ServicoXEspecialidade''. Não é possível inserir a chave duplicada no objeto ''dbo.ServicoXEspecialidade''. O valor de chave duplicada é (28, 31).
A instrução foi finalizada.', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   em SGA.Models.DAO.ManterDAO.ManterEspecialidadeDAO.RelacionaEspecServDAO() na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterEspecialidadeDAO.cs:linha 242
   em SGA.Models.Manter.ManterEspecialidade.RelacionaEspecServ() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterEspecialidade.cs:linha 94
   em SGA.Views.SGA.VEspecialidade.RelacionaEspecServ.RelacionarButton_Click(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\RelacionaEspecServ.aspx.cs:linha 60', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-25 22:15:33.890' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (473, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:21:02.470' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (474, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VServico.CadastroServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\CadastroServico.aspx.cs:linha 23', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 22:22:04.487' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (475, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:22:04.490' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (455, N'Violação da restrição PRIMARY KEY ''PK_ServicoXEspecialidade''. Não é possível inserir a chave duplicada no objeto ''dbo.ServicoXEspecialidade''. O valor de chave duplicada é (24, 33).
A instrução foi finalizada.', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   em SGA.Models.DAO.ManterDAO.ManterEspecialidadeDAO.RelacionaEspecServDAO() na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterEspecialidadeDAO.cs:linha 242
   em SGA.Models.Manter.ManterEspecialidade.RelacionaEspecServ() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterEspecialidade.cs:linha 94
   em SGA.Views.SGA.VEspecialidade.RelacionaEspecServ.RelacionarButton_Click(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\RelacionaEspecServ.aspx.cs:linha 60', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-25 22:16:32.300' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (456, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:16:44.607' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (457, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:17:15.153' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (458, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:17:45.873' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (459, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:18:22.827' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (460, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:18:53.843' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (461, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:19:28.933' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (462, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:19:59.900' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (483, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:26:47.743' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (484, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:27:18.543' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (463, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vregiaoatendimento_cadastroregiaoatendimento_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_pjmdlz0f.2.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-25 22:20:32.650' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (464, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:20:32.657' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (465, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:20:32.667' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (466, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:20:32.680' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (467, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:20:32.840' AS DateTime), N'fabianogestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (468, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:20:34.010' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (469, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:20:53.327' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (476, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:22:04.510' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (477, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:22:06.157' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (478, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:22:06.177' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (479, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:22:28.077' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (480, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:25:41.793' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (481, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:25:43.597' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (482, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:26:16.897' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (486, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:28:21.130' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (485, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:27:49.813' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (495, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:33:08.517' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (496, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:33:41.580' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (497, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:34:14.703' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (498, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:34:45.550' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (499, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:35:16.843' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (500, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:35:48.910' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (487, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:28:52.217' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (565, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:11:50.260' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (566, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:12:23.720' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (567, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:12:55.253' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (568, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:13:26.813' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (569, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:13:57.880' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (570, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:14:31.270' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (488, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:29:23.347' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (671, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:44:17.243' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (672, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:44:17.317' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (673, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:44:25.433' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (674, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:44:25.487' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (683, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:05:41.213' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (690, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:09:19.207' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (489, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:29:54.480' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (490, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:30:26.323' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (491, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:30:58.307' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (492, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:31:31.480' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (493, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:32:04.673' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (494, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:32:35.603' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (501, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:36:19.787' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (502, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:36:50.657' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (503, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:37:21.963' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (504, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:37:53.277' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (505, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:38:24.140' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (506, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:39:05.393' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (507, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.VServico.InativarServico.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VServico\InativarServico.aspx.cs:linha 31', N'Void AbortInternal()', CAST(N'2017-11-25 22:39:08.107' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (508, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VChamado.AbrirChamado.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VChamado\AbrirChamado.aspx.cs:linha 34', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 22:43:12.847' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (509, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:43:12.867' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (512, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VTipoServico.ConsultaTipoServicos.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VTipoServico\ConsultaTipoServicos.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-25 22:48:21.720' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (513, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:48:21.727' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (514, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:48:21.763' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (515, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:48:50.140' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (516, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:48:50.250' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (517, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:49:21.907' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (518, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:49:53.780' AS DateTime), N'jonasgestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (510, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:43:13.410' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (511, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:43:26.267' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (524, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:53:07.167' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (547, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:02:13.050' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (548, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:02:44.037' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (549, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:03:15.380' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (572, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:15:38.580' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (519, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:50:25.200' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (573, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 23:15:38.613' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (574, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:15:38.717' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (575, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 23:25:28.323' AS DateTime), N'hugocliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (576, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:25:30.757' AS DateTime), N'hugocliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (577, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:25:53.980' AS DateTime), N'hugocliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (578, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:28:14.933' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (579, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:28:17.343' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (520, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:50:56.227' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (521, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:51:29.580' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (522, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:52:01.817' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (523, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:52:33.613' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (525, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:53:39.173' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (526, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:54:11.620' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (527, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:54:42.693' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (528, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:55:16.200' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (529, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:55:49.720' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (530, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:56:23.140' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (531, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:56:54.333' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (532, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:57:25.340' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (533, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:57:58.700' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (534, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:58:32.197' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (535, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:59:03.363' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (536, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:59:34.850' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (537, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:59:45.233' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (538, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 22:59:45.237' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (539, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:59:45.490' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (540, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 22:59:48.180' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (541, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:59:48.200' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (542, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 22:59:50.850' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (543, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:00:06.217' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (544, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:00:37.220' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (545, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:01:10.327' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (546, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:01:41.917' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (553, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:05:21.187' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (554, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:05:52.223' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (550, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:03:46.510' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (551, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:04:18.563' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (552, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:04:50.073' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (555, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:06:23.300' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (556, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:06:54.393' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (557, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:07:26.467' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (558, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:08:00.083' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (559, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:08:33.683' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (560, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:09:05.163' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (561, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:09:38.653' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (562, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:10:12.233' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (563, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:10:43.360' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (564, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:11:16.707' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (571, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:15:04.570' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (580, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:31:48.837' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (633, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:07:58.103' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (634, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:08:31.477' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (649, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:22:43.877' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (650, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:23:15.400' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (660, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:41:14.667' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (663, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:41:15.250' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (581, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:31:52.593' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (582, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:32:30.803' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (583, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:32:31.847' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (584, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:33:02.217' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (585, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:33:03.133' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (586, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:33:42.917' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (587, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:34:21.160' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (588, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:35:18.963' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (606, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:54:44.203' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (607, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VEspecialidade.ConsultaEspecServ.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\ConsultaEspecServ.aspx.cs:linha 23', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 00:00:51.730' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (608, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:00:51.747' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (619, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:03:05.387' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (620, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VEspecialidade.ConsultaEspecialidades.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\ConsultaEspecialidades.aspx.cs:linha 19', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 00:03:13.680' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (621, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:03:13.693' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (622, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:03:13.753' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (589, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 23:35:18.993' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (590, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:35:19.577' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (591, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:37:12.053' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (592, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 23:37:12.070' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (593, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:37:12.650' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (594, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:37:16.160' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (595, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:37:31.310' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (596, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:38:02.477' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (597, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:38:33.673' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (598, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:39:05.087' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (599, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:39:44.380' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (600, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:40:15.490' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (601, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:40:47.523' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (602, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-25 23:40:47.543' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (603, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:40:47.700' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (604, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-25 23:48:31.883' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (610, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VEspecialidade.ConsultaEspecServ.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VEspecialidade\ConsultaEspecServ.aspx.cs:linha 23', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 00:01:17.817' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (611, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:01:20.197' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (711, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:42:28.927' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (712, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:42:28.977' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (713, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:43:03.487' AS DateTime), N'douglasgestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (720, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:51:43.757' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (721, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:51:43.790' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (605, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-25 23:54:36.757' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (723, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:51:44.380' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (740, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:03:03.420' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (743, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:03:04.053' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (744, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:03:05.517' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (748, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.RelacionamentoUsrRegiao.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrRegiao.aspx.cs:linha 26', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:06:45.317' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (753, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:07:09.390' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (754, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 22', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:10:52.677' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (755, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:10:53.170' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (609, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:01:17.810' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (612, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:01:20.267' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (613, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:01:20.273' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (614, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:01:20.333' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (615, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:01:30.580' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (616, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:01:31.013' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (617, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:02:02.660' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (618, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:02:33.853' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (623, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:03:15.080' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (675, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:01:26.897' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (676, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:01:58.147' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (677, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:02:31.823' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (684, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:06:12.057' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (685, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:06:42.863' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (686, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:07:13.657' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (624, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:03:30.853' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (702, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:15:16.353' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (703, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:15:47.113' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (704, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:42:25.940' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (706, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:42:25.970' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (709, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:42:26.543' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (710, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:42:28.923' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (625, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:03:36.547' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (626, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:04:08.143' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (627, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:04:40.177' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (628, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:05:15.373' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (629, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:05:50.250' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (630, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:06:24.290' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (631, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:06:55.790' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (632, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:07:26.993' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (664, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:41:36.583' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (665, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:41:38.383' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (666, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:42:27.327' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (667, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:43:34.380' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (668, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:43:34.480' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (669, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:43:42.870' AS DateTime), N'douglascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (670, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VChamado.ListaChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VChamado\ListaChamados.aspx.cs:linha 42', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 00:44:14.920' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (635, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:16:58.373' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (636, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:16:58.397' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (637, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:17:04.847' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (638, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:17:19.207' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (639, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:17:19.657' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (640, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:17:52.437' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (641, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:18:25.943' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (642, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:18:57.033' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (643, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:19:30.410' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (644, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:20:03.007' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (645, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:20:34.220' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (646, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:21:07.540' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (647, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:21:41.250' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (648, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:22:12.580' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (651, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:23:47.247' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (652, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:24:20.823' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (653, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:24:52.083' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (654, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:25:23.807' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (655, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:25:55.027' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (656, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:25:57.497' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (657, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:26:02.807' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (658, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:26:09.800' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (659, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 00:41:14.683' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (661, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 00:41:14.687' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (662, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 00:41:15.250' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (678, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:03:04.913' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (679, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:03:38.053' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (680, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:04:08.807' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (681, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:04:39.700' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (682, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:05:10.500' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (687, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:07:44.443' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (688, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:08:15.233' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (689, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:08:46.063' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (696, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:12:11.790' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (697, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:12:42.627' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (691, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:09:52.783' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (692, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:10:23.490' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (693, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:10:39.250' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (694, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:11:10.153' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (695, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:11:40.980' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (698, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:13:13.373' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (699, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:13:44.083' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (700, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:14:14.827' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (701, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:14:45.607' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (714, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:48:40.020' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (731, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:53:56.753' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (732, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:55:42.280' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (733, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:56:53.703' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (741, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:03:03.420' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (742, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:03:04.053' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (705, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:42:25.940' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (707, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:42:25.970' AS DateTime), N'douglasgestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (708, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:42:26.543' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (715, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.RelacionamentoUsrRegiao.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrRegiao.aspx.cs:linha 26', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 01:49:23.120' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (716, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:49:23.483' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (717, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:49:23.583' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (718, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:49:31.137' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (719, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:51:43.757' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (722, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:51:43.790' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (745, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:03:06.240' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (746, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:03:20.190' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (747, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:05:07.923' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (749, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:06:48.900' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (752, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:06:54.397' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (758, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:10:54.957' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (759, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:10:55.417' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (724, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:51:44.380' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (764, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.Cadastro.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\CadastroUsuario.aspx.cs:linha 30', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:11:26.083' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (765, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:11:27.263' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (766, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:11:27.550' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (767, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:11:33.680' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (770, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 22', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:20:36.037' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (771, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:20:36.183' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (772, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:20:40.313' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (773, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:21:22.570' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (725, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 01:51:46.727' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (726, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:51:46.733' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (727, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:51:46.750' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (728, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VUsuario.RelacionamentoUsrRegiao.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrRegiao.aspx.cs:linha 26', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 01:52:27.447' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (729, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:52:29.763' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (730, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:52:29.843' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (734, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VChamado.AbrirChamado.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VChamado\AbrirChamado.aspx.cs:linha 34', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 01:59:07.570' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (735, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 01:59:07.577' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (736, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:59:07.613' AS DateTime), N'jonascliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (737, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:59:23.003' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (738, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 01:59:54.903' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (739, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:02:59.903' AS DateTime), N'HugoGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (750, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:06:49.677' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (751, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:06:53.457' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (757, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:10:54.890' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (760, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:10:55.413' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (756, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:10:54.293' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (761, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:10:55.827' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (762, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:10:55.993' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (763, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:11:17.287' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (768, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:15:19.270' AS DateTime), N'JonasTecnico')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (769, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:15:36.977' AS DateTime), N'JonasTecnico')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (779, N'Referência de objeto não definida para uma instância de um objeto.', N'GoogleMapsGeocoding', N'   em GoogleMapsGeocoding.Geocoder.BuildGoogleRequest(ResponseFormat responseFormat, RequestParam requestParamType, String requestParamString)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address, ResponseFormat responseFormat)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address)
   em SGA.Models.Manter.ManterGeo.GetClienteLocalizacao() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterGeo.cs:linha 94
   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 39', N'System.String BuildGoogleRequest(GoogleMapsGeocoding.Common.ResponseFormat, GoogleMapsGeocoding.Common.RequestParam, System.String)', CAST(N'2017-11-26 02:23:55.670' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (774, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:21:39.700' AS DateTime), N'Admin')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (780, N'Referência de objeto não definida para uma instância de um objeto.', N'GoogleMapsGeocoding', N'   em GoogleMapsGeocoding.Geocoder.BuildGoogleRequest(ResponseFormat responseFormat, RequestParam requestParamType, String requestParamString)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address, ResponseFormat responseFormat)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address)
   em SGA.Models.Manter.ManterGeo.GetClienteLocalizacao() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterGeo.cs:linha 94
   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 39', N'System.String BuildGoogleRequest(GoogleMapsGeocoding.Common.ResponseFormat, GoogleMapsGeocoding.Common.RequestParam, System.String)', CAST(N'2017-11-26 02:24:17.783' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (799, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:18.017' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (803, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:19.207' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (817, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.673' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (820, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.677' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (775, N'Referência de objeto não definida para uma instância de um objeto.', N'GoogleMapsGeocoding', N'   em GoogleMapsGeocoding.Geocoder.BuildGoogleRequest(ResponseFormat responseFormat, RequestParam requestParamType, String requestParamString)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address, ResponseFormat responseFormat)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address)
   em SGA.Models.Manter.ManterGeo.GetClienteLocalizacao() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterGeo.cs:linha 94
   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 39', N'System.String BuildGoogleRequest(GoogleMapsGeocoding.Common.ResponseFormat, GoogleMapsGeocoding.Common.RequestParam, System.String)', CAST(N'2017-11-26 02:22:38.077' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (776, N'Referência de objeto não definida para uma instância de um objeto.', N'GoogleMapsGeocoding', N'   em GoogleMapsGeocoding.Geocoder.BuildGoogleRequest(ResponseFormat responseFormat, RequestParam requestParamType, String requestParamString)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address, ResponseFormat responseFormat)
   em GoogleMapsGeocoding.Geocoder.Geocode(String address)
   em SGA.Models.Manter.ManterGeo.GetClienteLocalizacao() na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterGeo.cs:linha 94
   em SGA.Views.SGA.VMapa.Mapa.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VMapa\Mapa.aspx.cs:linha 39', N'System.String BuildGoogleRequest(GoogleMapsGeocoding.Common.ResponseFormat, GoogleMapsGeocoding.Common.RequestParam, System.String)', CAST(N'2017-11-26 02:23:08.867' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (777, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:23:21.977' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (778, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:23:24.877' AS DateTime), N'JonasCliente')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (781, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:33:04.690' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (787, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:40:03.737' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (788, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:40:06.080' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (782, N'É necessário declarar a variável escalar "@IdRole1".', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   em System.Data.SqlClient.SqlDataReader.get_MetaData()
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader()
   em SGA.Models.DAO.ManterDAO.ManterUsuarioDAO.ConsultaUsuariosByPerfilDAO(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterUsuariosDAO.cs:linha 508
   em SGA.Models.Manter.ManterUsuario.ConsultaUsuariosByPerfil(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterUsuario.cs:linha 153
   em SGA.Views.SGA.VUsuario.RelacionamentoUsrEspec.DropDownListTipo_SelectedIndexChanged(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrEspec.aspx.cs:linha 59', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-26 02:38:16.673' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (785, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:40:03.090' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (786, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:40:03.123' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (783, N'É necessário declarar a variável escalar "@IdRole1".', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   em System.Data.SqlClient.SqlDataReader.get_MetaData()
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader()
   em SGA.Models.DAO.ManterDAO.ManterUsuarioDAO.ConsultaUsuariosByPerfilDAO(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterUsuariosDAO.cs:linha 508
   em SGA.Models.Manter.ManterUsuario.ConsultaUsuariosByPerfil(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterUsuario.cs:linha 153
   em SGA.Views.SGA.VUsuario.RelacionamentoUsrEspec.DropDownListTipo_SelectedIndexChanged(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrEspec.aspx.cs:linha 59', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-26 02:38:31.377' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (821, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:21.300' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (823, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:21.307' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (824, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:21.310' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (784, N'É necessário declarar a variável escalar "@IdRole1".', N'.Net SqlClient Data Provider', N'   em System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   em System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   em System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   em System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   em System.Data.SqlClient.SqlDataReader.get_MetaData()
   em System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)
   em System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   em System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   em System.Data.SqlClient.SqlCommand.ExecuteReader()
   em SGA.Models.DAO.ManterDAO.ManterUsuarioDAO.ConsultaUsuariosByPerfilDAO(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\DAO\ManterDAO\ManterUsuariosDAO.cs:linha 508
   em SGA.Models.Manter.ManterUsuario.ConsultaUsuariosByPerfil(List`1 Perfil) na C:\Users\Hugo\Desktop\SGA\SGA\Models\Manter\ManterUsuario.cs:linha 153
   em SGA.Views.SGA.VUsuario.RelacionamentoUsrEspec.DropDownListTipo_SelectedIndexChanged(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VUsuario\RelacionamentoUsrEspec.aspx.cs:linha 59', N'Void OnError(System.Data.SqlClient.SqlException, Boolean, System.Action`1[System.Action])', CAST(N'2017-11-26 02:38:45.187' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (794, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:44:50.327' AS DateTime), N'JonasTecnico')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (795, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:44:50.357' AS DateTime), N'JonasTecnico')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (789, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:40:17.303' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (796, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:44:59.263' AS DateTime), N'JonasTecnico')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (797, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:18.017' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (800, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:18.017' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (801, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:19.207' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (806, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:19.217' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (814, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:20.667' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (818, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.673' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (790, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:40:17.337' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (791, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:41:02.397' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (792, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:41:02.443' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (793, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:41:18.673' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (798, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:18.020' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (802, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:19.207' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (807, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:19.217' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (804, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:19.207' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (805, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:19.217' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (808, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:19.217' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (809, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.627' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (811, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.630' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (812, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.650' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (813, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:20.667' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (810, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.630' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (815, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:20.670' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (822, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:21.303' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (825, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:25.137' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (827, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:25.160' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (828, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:25.163' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (816, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:20.670' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (819, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:20.677' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (826, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:25.157' AS DateTime), N'douglasgestor')
GO
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (864, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_pap1vkts.0.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:55:06.297' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (865, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:06.300' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (866, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:06.307' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (867, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:10.527' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (868, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:55:14.367' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (829, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:25.807' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (830, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:25.810' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (869, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:14.430' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (870, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:15.653' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (871, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 26', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:57:34.023' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (873, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:57:34.417' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (874, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:57:34.423' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (875, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:57:37.907' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (831, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:25.813' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (832, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:25.817' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (833, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:26.727' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (834, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:26.730' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (835, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:26.730' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (836, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:26.733' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (837, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:28.523' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (839, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:28.530' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (838, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:28.527' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (872, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_pap1vkts.0.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:57:34.387' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (876, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:57:37.930' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (877, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:57:42.640' AS DateTime), N'JonasGestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (840, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:28.533' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (841, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:29.117' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (842, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:29.120' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (843, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:29.123' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (844, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:29.127' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (845, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:52:29.587' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (847, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:29.593' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (848, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:29.597' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (846, N'Exceção do tipo ''System.Web.HttpUnhandledException'' foi acionada.', N'System.Web', N'   em System.Web.UI.Page.HandleError(Exception e)
   em System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   em System.Web.UI.Page.ProcessRequest()
   em System.Web.UI.Page.ProcessRequest(HttpContext context)
   em ASP.views_sga_vrelatorio_relatoriochamados_aspx.ProcessRequest(HttpContext context) na C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\1e3bfe51\a7d17a88\App_Web_cdrjg0rn.1.cs:linha 0
   em System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   em System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'Boolean HandleError(System.Exception)', CAST(N'2017-11-26 02:52:29.590' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (849, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:52:30.380' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (850, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:52:30.397' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (851, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:30.493' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (852, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:52:33.450' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (853, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:52:33.453' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (854, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:33.507' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (857, N'Número não-negativo necessário.
Nome do parâmetro: count', N'mscorlib', N'   em System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   em System.Collections.Generic.List`1.RemoveRange(Int32 index, Int32 count)
   em SGA.Views.Site.Inicio.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\Inicio.aspx.cs:linha 97', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2017-11-26 02:55:01.407' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (858, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:55:01.440' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (859, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:02.057' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (860, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VTipoServico.ConsultaTipoServicos.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VTipoServico\ConsultaTipoServicos.aspx.cs:linha 25', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:55:03.683' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (861, N'O thread estava sendo anulado.', N'mscorlib', N'   em System.Threading.Thread.AbortInternal()
   em System.Threading.Thread.Abort(Object stateInfo)
   em System.Web.HttpResponse.AbortCurrentThread()
   em System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   em SGA.Views.SGA.SiteMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\SiteMaster.Master.cs:linha 37', N'Void AbortInternal()', CAST(N'2017-11-26 02:55:03.690' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (862, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:55:03.770' AS DateTime), N'jonasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (863, N'Referência de objeto não definida para uma instância de um objeto.', N'SGA', N'   em SGA.Views.SGA.VRelatorio.RelatorioChamados.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\SGA\VRelatorio\RelatorioChamados.aspx.cs:linha 26', N'Void Page_Load(System.Object, System.EventArgs)', CAST(N'2017-11-26 02:55:05.957' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (855, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:35.007' AS DateTime), N'douglasgestor')
INSERT [dbo].[LogExcecoesTratadas] ([id], [exMensagem], [exSource], [exStackTrace], [exTargetSite], [exDate], [exUser]) VALUES (856, N'O nome de usuário já está em uso.', N'System.Web', N'   em System.Web.Security.Membership.CreateUser(String username, String password, String email)
   em SGA.Views.LoginMaster.Page_Load(Object sender, EventArgs e) na C:\Users\Hugo\Desktop\SGA\SGA\Views\Login\LoginMaster.Master.cs:linha 20', N'System.Web.Security.MembershipUser CreateUser(System.String, System.String, System.String)', CAST(N'2017-11-26 02:52:39.913' AS DateTime), N'jonasgestor')
SET IDENTITY_INSERT [dbo].[LogExcecoesTratadas] OFF
SET IDENTITY_INSERT [dbo].[Notificacao] ON 

INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (73, 0, 76, 3, 4, 0, CAST(N'2017-11-25 22:45:30.847' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (74, 0, 75, 3, 4, 0, CAST(N'2017-11-25 22:45:34.520' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (75, 0, 80, 3, 4, 0, CAST(N'2017-11-25 22:54:27.417' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (76, 0, 79, 3, 4, 0, CAST(N'2017-11-25 22:54:30.423' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (77, 0, 78, 3, 4, 0, CAST(N'2017-11-25 22:54:32.147' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (78, 0, 77, 3, 4, 0, CAST(N'2017-11-25 22:54:34.923' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (79, 0, 77, 6, 4, 0, CAST(N'2017-11-26 00:24:58.017' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (80, 0, 82, 3, 4, 0, CAST(N'2017-11-26 00:54:06.237' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (81, 0, 81, 3, 4, 0, CAST(N'2017-11-26 00:54:09.593' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (82, 0, 78, 4, 4, 0, CAST(N'2017-11-26 01:05:40.943' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (83, 0, 77, 4, 4, 0, CAST(N'2017-11-26 01:05:44.053' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (84, 0, 76, 4, 4, 0, CAST(N'2017-11-26 01:05:53.270' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (85, 0, 75, 4, 4, 0, CAST(N'2017-11-26 01:05:55.927' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (86, 0, 78, 5, 4, 0, CAST(N'2017-11-26 01:06:42.680' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (87, 0, 77, 5, 4, 0, CAST(N'2017-11-26 01:06:45.447' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (88, 76, 71, 10, 4, 0, CAST(N'2017-11-26 01:10:39.233' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (89, 76, 72, 10, 4, 0, CAST(N'2017-11-26 01:10:39.237' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (90, 76, 73, 10, 4, 0, CAST(N'2017-11-26 01:10:39.240' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (91, 76, 74, 10, 4, 0, CAST(N'2017-11-26 01:10:39.243' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (92, 0, 80, 4, 4, 0, CAST(N'2017-11-26 01:13:35.880' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (93, 0, 79, 4, 4, 0, CAST(N'2017-11-26 01:13:38.860' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (94, 0, 80, 5, 4, 0, CAST(N'2017-11-26 01:14:26.447' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (95, 0, 79, 5, 4, 0, CAST(N'2017-11-26 01:14:29.283' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (96, 0, 76, 5, 4, 0, CAST(N'2017-11-26 01:16:02.740' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (97, 0, 75, 5, 4, 0, CAST(N'2017-11-26 01:16:06.147' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (98, 0, 76, 7, 4, 0, CAST(N'2017-11-26 01:17:53.030' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (99, 0, 75, 7, 4, 0, CAST(N'2017-11-26 01:17:55.957' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (100, 0, 82, 4, 4, 0, CAST(N'2017-11-26 01:19:35.520' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (101, 0, 81, 4, 4, 0, CAST(N'2017-11-26 01:19:38.287' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (102, 0, 82, 5, 4, 0, CAST(N'2017-11-26 01:20:36.277' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (103, 0, 81, 5, 4, 0, CAST(N'2017-11-26 01:20:39.657' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (104, 78, 71, 10, 4, 0, CAST(N'2017-11-26 02:33:01.057' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (105, 78, 71, 10, 4, 0, CAST(N'2017-11-26 02:33:01.073' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (106, 78, 72, 10, 4, 0, CAST(N'2017-11-26 02:33:01.077' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (107, 78, 72, 10, 4, 0, CAST(N'2017-11-26 02:33:01.093' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (108, 78, 73, 10, 4, 0, CAST(N'2017-11-26 02:33:01.097' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (109, 78, 73, 10, 4, 0, CAST(N'2017-11-26 02:33:01.100' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (110, 78, 74, 10, 4, 0, CAST(N'2017-11-26 02:33:01.103' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (111, 78, 74, 10, 4, 0, CAST(N'2017-11-26 02:33:01.103' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (112, 80, 71, 10, 4, 0, CAST(N'2017-11-26 02:33:32.510' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (113, 80, 71, 10, 4, 0, CAST(N'2017-11-26 02:33:32.533' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (114, 80, 72, 10, 4, 0, CAST(N'2017-11-26 02:33:32.533' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (115, 80, 72, 10, 4, 0, CAST(N'2017-11-26 02:33:32.537' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (116, 80, 73, 10, 4, 0, CAST(N'2017-11-26 02:33:32.537' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (117, 80, 73, 10, 4, 0, CAST(N'2017-11-26 02:33:32.540' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (118, 80, 74, 10, 4, 0, CAST(N'2017-11-26 02:33:32.540' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (119, 80, 74, 10, 4, 0, CAST(N'2017-11-26 02:33:32.540' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (120, 82, 71, 10, 4, 0, CAST(N'2017-11-26 02:34:05.710' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (121, 82, 71, 10, 4, 0, CAST(N'2017-11-26 02:34:05.710' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (122, 82, 72, 10, 4, 0, CAST(N'2017-11-26 02:34:05.730' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (123, 82, 72, 10, 4, 0, CAST(N'2017-11-26 02:34:05.730' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (124, 82, 73, 10, 4, 0, CAST(N'2017-11-26 02:34:05.733' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (125, 82, 73, 10, 4, 0, CAST(N'2017-11-26 02:34:05.733' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (126, 82, 74, 10, 4, 0, CAST(N'2017-11-26 02:34:05.737' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (127, 82, 74, 10, 4, 0, CAST(N'2017-11-26 02:34:05.737' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (128, 0, 76, 9, 4, 0, CAST(N'2017-11-26 02:49:16.110' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (129, 0, 71, 3, 4, 0, CAST(N'2017-11-26 02:49:19.297' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (130, 0, 72, 3, 4, 0, CAST(N'2017-11-26 02:49:22.287' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (131, 0, 73, 3, 4, 0, CAST(N'2017-11-26 02:49:25.370' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (132, 0, 74, 3, 4, 0, CAST(N'2017-11-26 02:49:28.393' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notificacao] OFF
SET IDENTITY_INSERT [dbo].[NotificacaoMensagem] ON 

INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (1, N'Requisição de chat')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (2, N'Requisição de chat privado')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (3, N'Novo atendimento')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (4, N'Início de atendimento')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (5, N'Atendimento finalizado')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (6, N'Chamado cancelado')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (7, N'Retrabalho')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (8, N'Reabertura de chamado')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (9, N'Chamado recusado')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (10, N'Sem geolocalização:  ')
INSERT [dbo].[NotificacaoMensagem] ([idMsgNotificacao], [mensagem]) VALUES (11, N'Mudança de técnico')
SET IDENTITY_INSERT [dbo].[NotificacaoMensagem] OFF
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Baixa', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Média', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Alta', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Urgente', CAST(N'2017-05-01 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[RecusaAtendimento] ([idChamado], [idTecnico], [idEmpresa], [motivo], [dataRegistro], [usuarioRegistro]) VALUES (108, 76, 13, N'75', CAST(N'2017-11-26 02:49:16.150' AS DateTime), N'JonasTecnico')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] ON 

INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (23, N'Praça Bandeira (RJ)', N'Rio de Janeiro', N'RJ', 1, 13, CAST(N'2017-11-25 22:18:56.003' AS DateTime), N'jonasgestor')
INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (24, N'Tijuca (RJ)', N'Rio de Janeiro', N'RJ', 1, 13, CAST(N'2017-11-25 22:19:30.970' AS DateTime), N'jonasgestor')
INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (25, N'Jacarepaguá (RJ)', N'Rio de Janeiro', N'RJ', 1, 13, CAST(N'2017-11-25 22:19:45.143' AS DateTime), N'jonasgestor')
INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (26, N'Trezentos (SJM)', N'São João de Meriti', N'RJ', 1, 13, CAST(N'2017-11-25 22:21:59.493' AS DateTime), N'jonasgestor')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] OFF
SET IDENTITY_INSERT [dbo].[Servico] ON 

INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (30, 16, N'Sistema Operacional', N'Windows', 2, 1, 13, CAST(N'2017-11-25 20:05:05.587' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (31, 16, N'Programas', N'Softwares em Geral', 2, 1, 13, CAST(N'2017-11-25 20:05:30.810' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (32, 15, N'Manutenção Preventiva', N'Manutenção Preventiva', 2, 1, 13, CAST(N'2017-11-25 20:06:29.697' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (33, 19, N'Montagem e Manutenção de PC', N'Montagem e Manutenção de PC', 2, 1, 13, CAST(N'2017-11-25 20:12:40.507' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (34, 14, N'Serviços em geral no Excel', N'Serviços em geral no Excel', 2, 1, 13, CAST(N'2017-11-25 20:14:41.453' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (35, 14, N'Serviços em geral no Word', N'Serviços em geral no Word', 2, 1, 13, CAST(N'2017-11-25 20:14:49.113' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (36, 14, N'Serviços em geral no Outlook', N'Serviços em geral no Outlook', 2, 1, 13, CAST(N'2017-11-25 20:14:56.690' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (37, 17, N'Sem conexão de Rede Local', N'Sem conexão de Rede Local', 2, 1, 13, CAST(N'2017-11-25 20:16:41.533' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (38, 17, N'Sem conexão de Internet', N'Sem conexão de Internet', 2, 1, 13, CAST(N'2017-11-25 20:15:56.723' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (39, 20, N'Computador Não Liga', N'Computador Não Liga', 1, 1, 13, CAST(N'2017-11-25 20:17:31.887' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (40, 20, N'Computador Sem Internet', N'Computador Sem Internet', 1, 1, 13, CAST(N'2017-11-25 20:18:09.143' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (41, 16, N'Inst. e Config. de Equipamentos Eletrônicos', N'Inst. e Config. de Equipamentos Eletrônicos', 1, 1, 13, CAST(N'2017-11-25 20:23:44.617' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (42, 21, N'aCorrigirPrimeiro', N'aCorrigirPrimeiro', 1, 0, 13, CAST(N'2017-11-25 22:12:48.017' AS DateTime), N'jonasgestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (43, 18, N'Teste', N'TEste', 10, 0, 13, CAST(N'2017-11-25 21:02:13.040' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (44, 19, N'Teste', N'TEste', 12, 0, 13, CAST(N'2017-11-25 21:52:38.567' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (45, 19, N'Teste', N'TEste', 12, 0, 13, CAST(N'2017-11-25 21:52:41.250' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (46, 19, N'Teste', N'TEste', 12, 0, 13, CAST(N'2017-11-25 21:52:43.567' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (47, 16, N'Teste', N'Teste', 1, 0, 13, CAST(N'2017-11-25 22:01:41.127' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (48, 16, N'a', N'a', 1, 0, 13, CAST(N'2017-11-25 22:04:23.057' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (49, 15, N'q', N'a', 1, 0, 13, CAST(N'2017-11-25 22:39:05.390' AS DateTime), N'HugoGestor')
INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (50, 15, N'q', N'a', 1, 0, 13, CAST(N'2017-11-25 22:39:08.097' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[Servico] OFF
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, 34, 1, CAST(N'2017-11-25 22:16:47.603' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, 35, 1, CAST(N'2017-11-25 22:16:54.637' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, 36, 1, CAST(N'2017-11-25 22:16:58.667' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 32, 1, CAST(N'2017-11-25 22:15:40.437' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 33, 1, CAST(N'2017-11-25 22:16:01.373' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 39, 1, CAST(N'2017-11-25 22:17:15.313' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 40, 1, CAST(N'2017-11-25 22:17:28.243' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (23, 37, 1, CAST(N'2017-11-25 22:17:04.467' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (23, 38, 1, CAST(N'2017-11-25 22:17:08.083' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (23, 41, 1, CAST(N'2017-11-25 22:17:45.260' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (24, 32, 1, CAST(N'2017-11-25 22:15:48.103' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (24, 33, 1, CAST(N'2017-11-25 22:16:15.050' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (24, 39, 1, CAST(N'2017-11-25 22:17:17.757' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (24, 40, 1, CAST(N'2017-11-25 22:17:31.720' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (25, 30, 1, CAST(N'2017-11-25 22:15:12.133' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (25, 41, 1, CAST(N'2017-11-25 22:17:52.217' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (26, 30, 1, CAST(N'2017-11-25 22:15:15.250' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (26, 41, 1, CAST(N'2017-11-25 22:17:54.607' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (27, 30, 1, CAST(N'2017-11-25 22:15:18.157' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (27, 41, 1, CAST(N'2017-11-25 22:17:57.173' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (28, 30, 1, CAST(N'2017-11-25 22:13:50.910' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (28, 31, 1, CAST(N'2017-11-25 22:14:15.647' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (28, 32, 1, CAST(N'2017-11-25 22:15:53.487' AS DateTime), N'jonasgestor')
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (28, 41, 1, CAST(N'2017-11-25 22:17:59.863' AS DateTime), N'jonasgestor')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Aberto', N'Chamado em estado de aberto e não atendido', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Em andamento', N'Chamado em estado de andamento', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Concluído', N'Chamado concluído com sucesso', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Retrabalho', N'Chamado que foi concluído o atendimento porém com pendência', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Cancelado', N'Chamado que foi cancelado por motivos diversos', 1, CAST(N'2017-05-01 11:27:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[StatusDisponibilidade] ON 

INSERT [dbo].[StatusDisponibilidade] ([idDisponibilidade], [descStatus]) VALUES (1, N'Disponível')
INSERT [dbo].[StatusDisponibilidade] ([idDisponibilidade], [descStatus]) VALUES (2, N'Em atendimento')
SET IDENTITY_INSERT [dbo].[StatusDisponibilidade] OFF
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Disponível', N'Usuário disponível', 1, CAST(N'2017-11-25 12:42:49.147' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Atend', N'Atendimento', 1, CAST(N'2017-11-25 12:42:49.147' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Bloq', N'Usuario bloq', 1, CAST(N'2017-11-25 12:42:49.147' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Ausente', N'Usuario ausente', 1, CAST(N'2017-11-25 12:42:49.147' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[TipoNotificacao] ON 

INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (1, N'Chat')
INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (2, N'Chat Privado')
INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (4, N'Sistema')
SET IDENTITY_INSERT [dbo].[TipoNotificacao] OFF
SET IDENTITY_INSERT [dbo].[TipoServico] ON 

INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (13, N'Office', 13, 0, CAST(N'2017-11-25 20:00:24.293' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (14, N'Office', 13, 1, CAST(N'2017-11-25 20:00:16.050' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (15, N'Manutenção', 13, 1, CAST(N'2017-11-25 20:02:39.393' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (16, N'Instalação', 13, 1, CAST(N'2017-11-25 20:02:54.473' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (17, N'Rede', 13, 1, CAST(N'2017-11-25 20:02:58.627' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (18, N'aCorrigirPrimeiro', 13, 0, CAST(N'2017-11-25 22:10:50.013' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (19, N'Hardware', 13, 1, CAST(N'2017-11-25 20:06:52.933' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, N'Problema', 13, 1, CAST(N'2017-11-25 20:16:57.043' AS DateTime), N'jonasgestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, N'aInativar', 13, 0, CAST(N'2017-11-25 22:13:00.110' AS DateTime), N'jonasgestor')
SET IDENTITY_INSERT [dbo].[TipoServico] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (71, N'Jonas Garcia Rosa', N'Praça da Bandeira 179 Praça da Bandeira Rio de Janeiro RJ', N'179', N'20270150', N'984991192', 13, 1, CAST(N'2017-11-25 19:49:31.410' AS DateTime), N'Admin')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (72, N'Fabiano Gestor', N'Rua Capitão Menezes 568 Praça Seca Rio de Janeiro RJ', N'568', N'21320040', N'965027774', 13, 1, CAST(N'2017-11-25 19:55:27.883' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (73, N'Hugo Bezerra Pimentel', N'Rua Bom Jardim Lote 48 Quadra 08 Trezentos São João de Meriti RJ', N'Lote 48 Quadra 08', N'25580740', N'974688867', 13, 1, CAST(N'2017-11-25 20:01:15.843' AS DateTime), N'JonasGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (74, N'Douglas Correa', N'Rua General Roca Apartamento Tijuca Rio de Janeiro RJ', N'Apartamento', N'20521070', N'969328011', 13, 1, CAST(N'2017-11-25 20:01:19.537' AS DateTime), N'fabianogestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (75, N'Jonas Cliente', N'Praça da Bandeira 179 Praça da Bandeira Rio de Janeiro RJ', N'179', N'20270150', N'984991192', 13, 1, CAST(N'2017-11-25 22:23:39.503' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (76, N'Jonas Tecnico', N'Praça da Bandeira 179 Praça da Bandeira Rio de Janeiro RJ', N'179', N'20270150', N'984991192', 13, 1, CAST(N'2017-11-25 22:24:23.723' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (77, N'Douglas Cliente', N'Rua General Roca 454  Apto. 204 Tijuca Rio de Janeiro RJ', N'454  Apto. 204', N'20521070', N'969328011', 13, 1, CAST(N'2017-11-25 22:29:32.740' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (78, N'Douglas Tecnico', N'Rua General Roca 454  Apto. 204 Tijuca Rio de Janeiro RJ', N'454  Apto. 204', N'20521070', N'969328011', 13, 1, CAST(N'2017-11-25 22:32:17.927' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (79, N'Hugo Cliente', N'Rua Bom Jardim lote 48 - quadra 8 Trezentos São João de Meriti RJ', N'lote 48 - quadra 8', N'25580740', N'974688867', 13, 1, CAST(N'2017-11-25 22:35:05.117' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (80, N'Hugo Tecnico', N'Rua Bom Jardim lote 48 - quadra 8 Trezentos São João de Meriti RJ', N'lote 48 - quadra 8', N'25580740', N'974688867', 13, 1, CAST(N'2017-11-25 22:36:31.927' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (81, N'Fabiano Cliente', N'Rua Capitão Menezes 568 Praça Seca Rio de Janeiro RJ', N'568', N'21320040', N'965027774', 13, 1, CAST(N'2017-11-25 22:38:05.343' AS DateTime), N'jonasgestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (82, N'Fabiano Tecnico', N'Rua Capitão Menezes 568 Praça Seca Rio de Janeiro RJ', N'568', N'21320040', N'965027774', 13, 1, CAST(N'2017-11-26 00:45:32.360' AS DateTime), N'jonasgestor')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (76, 20, 1, CAST(N'2017-11-25 22:24:23.730' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (78, 28, 1, CAST(N'2017-11-25 22:32:17.933' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (80, 21, 1, CAST(N'2017-11-25 22:36:31.937' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (82, 23, 1, CAST(N'2017-11-25 22:38:33.630' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (71, N'f7fa723a-17b0-4309-9229-d9b78702ecbe')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (72, N'fe82ba09-204d-46ce-92a5-7fa7815f3b1f')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (73, N'06f7bff6-a8b6-4475-a436-f73597017223')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (74, N'ab52a038-298c-4996-bc41-62e38650119b')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (75, N'71f3757f-1cd6-45af-b805-6e6450e90e16')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (76, N'26bc99ab-19d2-4d1f-bdf8-d364419c508e')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (77, N'68a89407-1899-4571-99e5-a182e52d717e')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (78, N'655d4f8c-cce3-4456-b981-8912d5515770')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (79, N'c9b9f38b-e433-4b76-a7d2-a8b0ca53630e')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (80, N'a3dfbf77-9ee7-41e1-a7b7-9b0c9d5853af')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (81, N'7964d00d-2e58-4e0d-9c9c-cb6984ea1d7c')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (82, N'a83dd0ee-ee8b-4ce2-9449-21b3bb8ed70e')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (75, 23, 1, CAST(N'2017-11-25 22:23:39.510' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (76, 23, 1, CAST(N'2017-11-25 22:24:23.727' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (76, 24, 1, CAST(N'2017-11-26 01:50:04.197' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (77, 24, 1, CAST(N'2017-11-25 22:28:56.910' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (78, 23, 1, CAST(N'2017-11-26 01:50:11.493' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (78, 24, 1, CAST(N'2017-11-25 22:32:17.933' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (79, 26, 1, CAST(N'2017-11-25 22:35:05.123' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (80, 26, 1, CAST(N'2017-11-25 22:36:31.933' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (81, 25, 1, CAST(N'2017-11-25 22:38:05.347' AS DateTime), N'jonasgestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (82, 25, 1, CAST(N'2017-11-25 22:38:33.630' AS DateTime), N'jonasgestor')
/****** Object:  Index [PK__aspnet_A__C93A4C987BF3A7B2]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE439155BB1]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__30910331199B28BE]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D83BF2E78]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58B6833B55]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06C30FD0B4]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 26/11/2017 09:31:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1BF0FEA2BB]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4DF9780D41]    Script Date: 26/11/2017 09:31:32 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 26/11/2017 09:31:32 ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 26/11/2017 09:31:32 ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_PrioridadeChamado] FOREIGN KEY([idPrioridade])
REFERENCES [dbo].[PrioridadeChamado] ([idPrioridade])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_PrioridadeChamado]
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_StatusChamado] FOREIGN KEY([idStatusChamado])
REFERENCES [dbo].[StatusChamado] ([idStatusChamado])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_StatusChamado]
GO
ALTER TABLE [dbo].[ClienteJuridico]  WITH CHECK ADD  CONSTRAINT [FK_ClienteJuridico_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[ClienteJuridico] CHECK CONSTRAINT [FK_ClienteJuridico_Usuario]
GO
ALTER TABLE [dbo].[Especialidade]  WITH CHECK ADD  CONSTRAINT [FK_Especialidade_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Especialidade] CHECK CONSTRAINT [FK_Especialidade_Empresa]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Funcionario_Disponibilidade] FOREIGN KEY([idDisponibilidade])
REFERENCES [dbo].[StatusDisponibilidade] ([idDisponibilidade])
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_Disponibilidade]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_NotificacaoMensagem] FOREIGN KEY([idMsgNotificacao])
REFERENCES [dbo].[NotificacaoMensagem] ([idMsgNotificacao])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_NotificacaoMensagem]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_TipoNotificacao] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoNotificacao] ([idTipo])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_TipoNotificacao]
GO
ALTER TABLE [dbo].[RegiaoDeAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_RegiaoDeAtendimento_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[RegiaoDeAtendimento] CHECK CONSTRAINT [FK_RegiaoDeAtendimento_Empresa]
GO
ALTER TABLE [dbo].[Servico]  WITH CHECK ADD  CONSTRAINT [FK_Servico_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Servico] CHECK CONSTRAINT [FK_Servico_Empresa]
GO
ALTER TABLE [dbo].[Servico]  WITH CHECK ADD  CONSTRAINT [FK_Servico_TipoServico] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoServico] ([idTipoServ])
GO
ALTER TABLE [dbo].[Servico] CHECK CONSTRAINT [FK_Servico_TipoServico]
GO
ALTER TABLE [dbo].[ServicoXEspecialidade]  WITH CHECK ADD  CONSTRAINT [FK_ServicoXEspecialidade_Especialidade] FOREIGN KEY([idEspecialidade])
REFERENCES [dbo].[Especialidade] ([idEspecialidade])
GO
ALTER TABLE [dbo].[ServicoXEspecialidade] CHECK CONSTRAINT [FK_ServicoXEspecialidade_Especialidade]
GO
ALTER TABLE [dbo].[ServicoXEspecialidade]  WITH CHECK ADD  CONSTRAINT [FK_ServicoXEspecialidade_Servico] FOREIGN KEY([idServico])
REFERENCES [dbo].[Servico] ([idServico])
GO
ALTER TABLE [dbo].[ServicoXEspecialidade] CHECK CONSTRAINT [FK_ServicoXEspecialidade_Servico]
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXEspecialidade_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade] CHECK CONSTRAINT [FK_UsuarioXEspecialidade_Usuario]
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXRegiaoAtendimento_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento] CHECK CONSTRAINT [FK_UsuarioXRegiaoAtendimento_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u WITH ( UPDLOCK, ROWLOCK ), dbo.aspnet_Membership m WITH ( UPDLOCK, ROWLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users WITH (ROWLOCK)
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 26/11/2017 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END

GO
USE [master]
GO
ALTER DATABASE [SGAHML] SET  READ_WRITE 
GO

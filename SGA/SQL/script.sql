USE [master]
GO
/****** Object:  Database [SAS]    Script Date: 20/11/2017 21:03:02 ******/
CREATE DATABASE [SAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAS', FILENAME = N'E:\Projetos\Bancos\SAS.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SAS_log', FILENAME = N'E:\Projetos\Bancos\SAS_log.ldf' , SIZE = 164672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SAS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAS] SET RECOVERY FULL 
GO
ALTER DATABASE [SAS] SET  MULTI_USER 
GO
ALTER DATABASE [SAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SAS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SAS]
GO
/****** Object:  User [SGA]    Script Date: 20/11/2017 21:03:03 ******/
CREATE USER [SGA] FOR LOGIN [SGA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [SGA]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 20/11/2017 21:03:03 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 20/11/2017 21:03:03 ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_Membership_index]    Script Date: 20/11/2017 21:03:03 ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_Paths_index]    Script Date: 20/11/2017 21:03:03 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 20/11/2017 21:03:03 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 20/11/2017 21:03:03 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Index [aspnet_Users_Index]    Script Date: 20/11/2017 21:03:03 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Atendimento]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[AvaliacaoSolucao]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Chamado]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[ChatPrivado]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[ClienteFisico]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[ClienteJuridico]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Especialidade]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Funcionario]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[idUsuario] [int] NOT NULL,
	[idDisponibilidade] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Geolocalizacao]    Script Date: 20/11/2017 21:03:03 ******/
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
	[dataRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Geolocalizacao] PRIMARY KEY CLUSTERED 
(
	[idGeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogExcecoesTratadas]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Mensagem]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[MensagemXChatPrivado]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MensagemXChatPrivado](
	[idChat] [int] NOT NULL,
	[idChatPrivado] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[NotificacaoMensagem]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[PrioridadeChamado]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[RecusaAtendimento]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[RegiaoDeAtendimento]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegiaoDeAtendimento](
	[idRegiaoAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[regiao] [varchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[Servico]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[ServicoXEspecialidade]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[StatusChamado]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[StatusDisponibilidade]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[StatusUsuario]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[TipoNotificacao]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[TipoServico]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[UsuarioXEspecialidade]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[UsuarioXMemberShipUser]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  Table [dbo].[UsuarioXRegiaoAtendimento]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 20/11/2017 21:03:03 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 20/11/2017 21:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'SGA', N'sga', N'1c998a8a-f886-4b7c-a235-02e480e259b7', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'0f3a0157-7f4b-4df1-b0ee-9110be7fa54e', N'hOHUy9ZKz2Ixt9t3FDcQuI2aFCg=', 1, N'c0BWVX8ltTsuCUnqyiJVMA==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2017-01-05 16:06:46.000' AS DateTime), CAST(N'2017-08-13 13:51:44.457' AS DateTime), CAST(N'2017-01-05 16:06:46.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'2068fb54-2f86-411d-b630-999518a65fa5', N'06PG53bs09Vd91A/FtVy4N3VAa4=', 1, N'3+nhngpZRGpuG+O3Li9AfQ==', NULL, N'hugoatendente@gmail.com', N'hugoatendente@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-20 20:07:27.000' AS DateTime), CAST(N'2017-11-20 20:07:32.873' AS DateTime), CAST(N'2017-11-20 20:07:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'e4033a4e-b4f3-4348-846a-85d86c35ee76', N'DuSzkQQebghmVpa78OmBq2+f2ZQ=', 1, N'm6l1JxOtB9HJuTcFRK1ccA==', NULL, N'hugocliente2@gmail.com', N'hugocliente2@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-19 21:02:05.000' AS DateTime), CAST(N'2017-11-19 21:02:05.000' AS DateTime), CAST(N'2017-11-19 21:02:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'd32adf41-4208-4113-9274-a49c975a4105', N'iVySveFgFpgxgxhmLRgoX6HwUfg=', 1, N'TR9oCJoauuBGUsiZKJvWkg==', NULL, N'hugocliente3@gmail.com', N'hugocliente3@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-19 21:09:25.000' AS DateTime), CAST(N'2017-11-19 21:09:25.000' AS DateTime), CAST(N'2017-11-19 21:09:25.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'dd3c4034-cef9-47de-b631-5a82e8c1bb05', N'+rWxgJMR9SdMCwaqC25Q0oB9znE=', 1, N'J5hGzmDGC0bq25wnW1BggQ==', NULL, N'hugocliente4@gmail.com', N'hugocliente4@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-19 21:15:35.000' AS DateTime), CAST(N'2017-11-19 21:17:14.020' AS DateTime), CAST(N'2017-11-19 21:15:35.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'ee397632-e4df-45dd-9ec0-77f72dac74a7', N'MUrcQYRx+w+khSrCw05P5KrVHTk=', 1, N'nsZIw0Mx9e+69xORYAD8dw==', NULL, N'hugocliente7@gmail.com', N'hugocliente7@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-20 15:26:04.000' AS DateTime), CAST(N'2017-11-20 21:30:09.930' AS DateTime), CAST(N'2017-11-20 15:26:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'18601197-4e4a-40f4-b334-b4394e968758', N'a+6FnsqHPlwWgjoSaZvIuN6mua8=', 1, N'bTMyMoBXT+/6eAgM2e7W1w==', NULL, N'hugosuporte@gmail.com', N'hugosuporte@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-19 20:52:41.000' AS DateTime), CAST(N'2017-11-19 20:52:41.000' AS DateTime), CAST(N'2017-11-19 20:52:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'e06da998-fd0c-43b7-bfc1-7bea6bb3d013', N'50JjO/DZB3//n4WU71xCRgCLE8g=', 1, N'I7t9iE/BP/cp58FvwXg8wA==', NULL, N'hugotecnico3@gmail.com', N'hugotecnico3@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-20 15:22:08.000' AS DateTime), CAST(N'2017-11-20 22:50:47.177' AS DateTime), CAST(N'2017-11-20 15:22:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b', N'68BOwC9C9qKUWWiF/CbVZULWryw=', 1, N'XbpNhiWDdbHG4viikX0Hag==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-09-08 01:13:30.000' AS DateTime), CAST(N'2017-11-20 16:41:50.733' AS DateTime), CAST(N'2017-11-04 21:25:43.137' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'01309bbd-0a03-47b1-bdca-f2b18623ef16', N'HIWng7VEBH1ntpCMevcr/FZ4TP0=', 1, N'sy3LwUwOWKGvORYe60APvQ==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-11-04 17:43:57.000' AS DateTime), CAST(N'2017-11-19 15:42:41.517' AS DateTime), CAST(N'2017-11-04 17:43:57.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'9c80e881-cb3f-4df0-bcc4-05d1d5195122', N'JYe9qF+GzBCH6EXzrVGQ+vxR0LA=', 1, N'GXVeAhjoGbumUVN++rg/ww==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-08-13 14:10:41.000' AS DateTime), CAST(N'2017-08-14 22:16:29.003' AS DateTime), CAST(N'2017-08-13 14:10:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'33aa3834-cb10-4b29-b363-44483ddfc650', N'7dJe+1YLk0HRvOvgrQL1vAUqCoU=', 1, N'aaFCUfutJGw1oK17GxfjqA==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-10-05 00:04:13.000' AS DateTime), CAST(N'2017-10-05 00:05:05.253' AS DateTime), CAST(N'2017-10-05 00:04:13.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'954b1c39-050f-4947-b26f-09bcf4abb34c', N'YOfKu9BGSEudBJ98Gr8dr+yew+U=', 1, N'MRyGY+c8sUmv6s3N5MdWQw==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-08-14 23:11:47.000' AS DateTime), CAST(N'2017-11-20 21:05:35.250' AS DateTime), CAST(N'2017-08-14 23:11:47.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'054b0932-65c3-4d9d-8b0f-a6c62a2f8e0a', N'vz6FRsRp5vxcWlmfenf68sqPVko=', 1, N'aN9c0C9DtbhM8NQ4FLWpVA==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-08-13 14:06:43.000' AS DateTime), CAST(N'2017-11-20 21:29:38.550' AS DateTime), CAST(N'2017-11-12 17:54:26.140' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'55a3bc79-222a-4925-90bc-110440104767', N'27+bNEpqZ/4B/CdxWGOb+09/b0g=', 1, N'MwDzz4PdcDJAro0JvC/jiA==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-08-14 23:14:24.000' AS DateTime), CAST(N'2017-11-19 18:51:31.087' AS DateTime), CAST(N'2017-08-14 23:14:24.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'bf9aef5e-30a3-408a-940a-c3140cec4f98', N'OB62nCPDnIxWCi25QA8lvTdMPBs=', 1, N'2d7zw3l/Bii/CL9VWAkyFw==', NULL, N'noreplysgati@gmail.com', N'noreplysgati@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-08-23 22:19:30.000' AS DateTime), CAST(N'2017-11-19 16:57:26.547' AS DateTime), CAST(N'2017-08-23 22:19:30.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
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
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'0f3a0157-7f4b-4df1-b0ee-9110be7fa54e', N'Admin', N'admin', NULL, 0, CAST(N'2017-08-13 14:07:22.950' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'9c80e881-cb3f-4df0-bcc4-05d1d5195122', N'DouglasGestor', N'douglasgestor', NULL, 0, CAST(N'2017-08-14 22:17:07.407' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'33aa3834-cb10-4b29-b363-44483ddfc650', N'FabianoGestor', N'fabianogestor', NULL, 0, CAST(N'2017-10-05 00:05:25.280' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'2068fb54-2f86-411d-b630-999518a65fa5', N'HugoAtendente', N'hugoatendente', NULL, 0, CAST(N'2017-11-20 20:08:33.040' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'954b1c39-050f-4947-b26f-09bcf4abb34c', N'HugoCliente', N'hugocliente', NULL, 0, CAST(N'2017-11-20 21:05:58.903' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'01309bbd-0a03-47b1-bdca-f2b18623ef16', N'HugoCliente0', N'hugocliente0', NULL, 0, CAST(N'2017-11-19 15:44:54.733' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'18601197-4e4a-40f4-b334-b4394e968758', N'HugoCliente1', N'hugocliente1', NULL, 0, CAST(N'2017-11-19 20:52:41.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'e4033a4e-b4f3-4348-846a-85d86c35ee76', N'HugoCliente2', N'hugocliente2', NULL, 0, CAST(N'2017-11-19 21:02:05.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'd32adf41-4208-4113-9274-a49c975a4105', N'HugoCliente3', N'hugocliente3', NULL, 0, CAST(N'2017-11-19 21:09:25.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'dd3c4034-cef9-47de-b631-5a82e8c1bb05', N'HugoCliente4', N'hugocliente4', NULL, 0, CAST(N'2017-11-19 21:17:18.743' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'ee397632-e4df-45dd-9ec0-77f72dac74a7', N'HugoCliente7', N'hugocliente7', NULL, 0, CAST(N'2017-11-20 21:30:09.957' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'054b0932-65c3-4d9d-8b0f-a6c62a2f8e0a', N'HugoGestor', N'hugogestor', NULL, 0, CAST(N'2017-11-20 21:29:38.673' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'55a3bc79-222a-4925-90bc-110440104767', N'HugoTecnico', N'hugotecnico', NULL, 0, CAST(N'2017-11-19 18:51:47.037' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b', N'HugoTecnico0', N'hugotecnico0', NULL, 0, CAST(N'2017-11-20 16:41:50.793' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'bf9aef5e-30a3-408a-940a-c3140cec4f98', N'HugoTecnico2', N'hugotecnico2', NULL, 0, CAST(N'2017-11-19 16:58:22.670' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'1c998a8a-f886-4b7c-a235-02e480e259b7', N'e06da998-fd0c-43b7-bfc1-7bea6bb3d013', N'HugoTecnico3', N'hugotecnico3', NULL, 0, CAST(N'2017-11-20 22:50:47.177' AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2068fb54-2f86-411d-b630-999518a65fa5', N'4355c114-eaf9-4b05-b6d2-3cb47ffae948')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'954b1c39-050f-4947-b26f-09bcf4abb34c', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dd3c4034-cef9-47de-b631-5a82e8c1bb05', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ee397632-e4df-45dd-9ec0-77f72dac74a7', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e4033a4e-b4f3-4348-846a-85d86c35ee76', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd32adf41-4208-4113-9274-a49c975a4105', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'18601197-4e4a-40f4-b334-b4394e968758', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'01309bbd-0a03-47b1-bdca-f2b18623ef16', N'77daa669-c0f6-4d2f-8b3a-ad4accbf8d1e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9c80e881-cb3f-4df0-bcc4-05d1d5195122', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'33aa3834-cb10-4b29-b363-44483ddfc650', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'054b0932-65c3-4d9d-8b0f-a6c62a2f8e0a', N'6a0bd300-3942-49e5-8307-f0dbc1591186')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'55a3bc79-222a-4925-90bc-110440104767', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e06da998-fd0c-43b7-bfc1-7bea6bb3d013', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bf9aef5e-30a3-408a-940a-c3140cec4f98', N'5e106c37-3e4d-4b41-9eee-f190ea99e534')
SET IDENTITY_INSERT [dbo].[Atendimento] ON 

INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (38, NULL, NULL, NULL, 8, 20, 19, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (39, NULL, NULL, NULL, 9, 20, 19, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (40, NULL, NULL, NULL, 10, 20, 19, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (47, CAST(N'2017-08-23 18:49:28.993' AS DateTime), CAST(N'2017-08-27 12:51:36.697' AS DateTime), N'asdasdas', 18, 20, 19, 4, N' 90.03', 2, CAST(N'2017-08-27 12:51:36.697' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (48, CAST(N'2017-08-27 14:16:49.077' AS DateTime), CAST(N'2017-08-27 14:31:51.257' AS DateTime), N'aaa', 19, 21, 19, 4, N' 0.25', 2, CAST(N'2017-08-27 14:31:51.257' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (58, CAST(N'2017-08-27 16:02:49.830' AS DateTime), CAST(N'2017-08-27 16:13:39.377' AS DateTime), N'asd', 29, 21, 19, 4, N' 0.18', 2, CAST(N'2017-08-27 16:13:39.377' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (61, CAST(N'2017-08-27 16:32:39.977' AS DateTime), CAST(N'2017-08-27 16:32:50.130' AS DateTime), N'asdasda', 32, 21, 19, 4, N' 0.00', 2, CAST(N'2017-08-27 16:32:50.130' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (62, CAST(N'2017-08-27 16:34:31.617' AS DateTime), CAST(N'2017-08-27 16:35:33.723' AS DateTime), N'asdasd', 33, 20, 19, 4, N' 0.02', 2, CAST(N'2017-08-27 16:35:33.723' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (63, CAST(N'2017-08-27 16:53:30.767' AS DateTime), CAST(N'2017-08-27 16:54:30.457' AS DateTime), N'asdasd', 34, 21, 19, 4, N' 0.02', 2, CAST(N'2017-08-27 16:54:30.457' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (64, CAST(N'2017-08-28 19:06:55.223' AS DateTime), CAST(N'2017-08-28 19:08:36.087' AS DateTime), N'fui até o lasdkojasdjk', 35, 21, 19, 4, N' 0.03', 2, CAST(N'2017-08-28 19:08:36.087' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (65, CAST(N'2017-08-28 20:02:44.750' AS DateTime), CAST(N'2017-08-28 20:03:42.023' AS DateTime), N'asdasd', 36, 21, 19, 4, N' 0.02', 2, CAST(N'2017-08-28 20:03:42.023' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (66, CAST(N'2017-09-03 13:26:21.607' AS DateTime), CAST(N'2017-09-03 13:12:12.983' AS DateTime), N'asdasd', 37, 21, 19, 4, N' 0.00', 2, CAST(N'2017-09-03 13:26:21.607' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (67, CAST(N'2017-09-03 13:33:25.750' AS DateTime), CAST(N'2017-08-28 20:16:10.083' AS DateTime), N'asd', 38, 21, 19, 4, N' 0.00', 2, CAST(N'2017-09-03 13:33:25.750' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (68, CAST(N'2017-09-03 13:33:25.750' AS DateTime), CAST(N'2017-10-16 13:26:00.413' AS DateTime), N'aaa', 38, 21, 19, 4, N' 1031.88', 2, CAST(N'2017-10-16 13:26:00.413' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (69, CAST(N'2017-09-03 13:26:21.607' AS DateTime), CAST(N'2017-09-03 13:12:12.983' AS DateTime), N'asdasd', 37, 21, 19, 4, N' 0.00', 2, CAST(N'2017-09-03 13:26:21.607' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (70, CAST(N'2017-09-03 13:26:21.607' AS DateTime), CAST(N'2017-09-03 13:12:12.983' AS DateTime), N'asdasd', 37, 21, 19, 4, N' 0.00', 2, CAST(N'2017-09-03 13:26:21.607' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (71, CAST(N'2017-09-03 13:26:21.607' AS DateTime), CAST(N'2017-09-03 13:26:30.607' AS DateTime), N'KIJHOHJ', 37, 21, 19, 4, N' 0.00', 2, CAST(N'2017-09-03 13:26:30.607' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (72, CAST(N'2017-09-03 13:45:28.107' AS DateTime), CAST(N'2017-09-03 14:03:15.850' AS DateTime), N'asdasd', 42, 20, 19, 4, N' 0.29', 2, CAST(N'2017-09-03 14:03:15.850' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (73, NULL, NULL, NULL, 42, 20, 19, 4, NULL, 2, CAST(N'2017-09-03 14:06:01.920' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (79, CAST(N'2017-10-15 18:10:21.583' AS DateTime), CAST(N'2017-10-15 18:10:48.660' AS DateTime), N'Teste', 51, 22, 19, 4, N' 0.01', 2, CAST(N'2017-10-15 18:10:48.660' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (80, CAST(N'2017-10-15 18:13:40.330' AS DateTime), CAST(N'2017-10-15 18:12:32.183' AS DateTime), N'Pendencia', 52, 22, 19, 4, N' 0.00', 2, CAST(N'2017-10-15 18:13:40.330' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (81, CAST(N'2017-10-15 18:13:40.330' AS DateTime), CAST(N'2017-10-15 18:14:08.337' AS DateTime), N'Teste', 52, 22, 19, 4, N' 0.01', 2, CAST(N'2017-10-15 18:14:08.337' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (82, CAST(N'2017-10-17 19:03:42.480' AS DateTime), CAST(N'2017-10-17 19:06:52.577' AS DateTime), N'teste', 53, 22, 19, 4, N' 0.05', 2, CAST(N'2017-10-17 19:06:52.577' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (83, CAST(N'2017-10-17 19:12:29.823' AS DateTime), CAST(N'2017-10-17 19:13:26.647' AS DateTime), N'teste', 54, 22, 19, 4, N' 0.02', 2, CAST(N'2017-10-17 19:13:26.647' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (84, CAST(N'2017-10-17 20:59:17.323' AS DateTime), CAST(N'2017-10-17 21:02:15.200' AS DateTime), N'teste', 55, 22, 19, 4, N' 0.05', 2, CAST(N'2017-10-17 21:02:15.200' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (85, NULL, NULL, NULL, 56, 22, 19, 4, NULL, 2, CAST(N'2017-10-17 19:10:11.793' AS DateTime), N'HugoCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (86, CAST(N'2017-10-17 19:21:39.680' AS DateTime), CAST(N'2017-10-17 19:22:48.790' AS DateTime), N'teste', 57, 22, 19, 4, N' 0.02', 2, CAST(N'2017-10-17 19:22:48.790' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (87, CAST(N'2017-10-17 19:35:44.973' AS DateTime), CAST(N'2017-10-17 19:35:44.973' AS DateTime), NULL, 58, 22, 19, 4, NULL, 2, CAST(N'2017-10-17 19:35:44.973' AS DateTime), N'HugoCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (88, CAST(N'2017-10-17 19:37:04.620' AS DateTime), CAST(N'2017-10-17 19:37:04.620' AS DateTime), NULL, 59, 22, 19, 4, NULL, 2, CAST(N'2017-10-17 19:37:04.620' AS DateTime), N'HugoCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (89, CAST(N'2017-11-03 14:57:45.880' AS DateTime), CAST(N'2017-11-03 15:03:51.057' AS DateTime), N'1111', 60, 22, 19, 4, N' 0.10', 2, CAST(N'2017-11-03 15:03:51.057' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (90, CAST(N'2017-10-24 19:14:00.820' AS DateTime), CAST(N'2017-10-24 19:16:48.200' AS DateTime), N'fui na assadkoaj', 61, 22, 19, 4, N' 0.05', 2, CAST(N'2017-10-24 19:16:48.200' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (91, CAST(N'2017-11-03 15:07:27.830' AS DateTime), CAST(N'2017-11-03 15:10:25.527' AS DateTime), N'terminado com sucesso', 62, 22, 19, 4, N' 0.05', 2, CAST(N'2017-11-03 15:10:25.527' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (92, CAST(N'2017-11-03 19:22:16.213' AS DateTime), CAST(N'2017-11-03 19:22:16.213' AS DateTime), NULL, 63, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:22:16.213' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (93, CAST(N'2017-11-03 19:22:34.783' AS DateTime), CAST(N'2017-11-03 19:22:34.783' AS DateTime), NULL, 64, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:22:34.783' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (94, CAST(N'2017-11-03 19:22:58.963' AS DateTime), CAST(N'2017-11-03 19:22:58.963' AS DateTime), NULL, 65, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:22:58.963' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (95, CAST(N'2017-11-03 19:23:19.493' AS DateTime), CAST(N'2017-11-03 19:23:19.493' AS DateTime), NULL, 66, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:23:19.493' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (96, CAST(N'2017-11-03 19:23:37.733' AS DateTime), CAST(N'2017-11-03 19:23:37.733' AS DateTime), NULL, 67, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:23:37.733' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (97, CAST(N'2017-11-03 19:24:05.857' AS DateTime), CAST(N'2017-11-03 19:24:05.857' AS DateTime), NULL, 68, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:24:05.857' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (98, CAST(N'2017-11-03 19:24:25.320' AS DateTime), CAST(N'2017-11-03 19:24:25.320' AS DateTime), NULL, 69, 22, 19, 4, NULL, 2, CAST(N'2017-11-03 19:24:25.320' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (99, CAST(N'2017-11-03 19:25:48.890' AS DateTime), CAST(N'2017-11-03 19:41:18.477' AS DateTime), N'finalziado', 70, 22, 19, 4, N' 0.26', 2, CAST(N'2017-11-03 19:41:18.477' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (100, CAST(N'2017-11-04 19:27:00.290' AS DateTime), CAST(N'2017-11-14 19:06:52.053' AS DateTime), N'teste', 71, 22, 19, 4, N' 239.66', 2, CAST(N'2017-11-14 19:06:52.053' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (101, CAST(N'2017-11-07 19:51:09.247' AS DateTime), CAST(N'2017-11-04 19:44:50.050' AS DateTime), N'asd', 72, 21, 19, 4, N' 0.01', 2, CAST(N'2017-11-07 19:51:09.247' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (102, CAST(N'2017-11-09 19:20:59.440' AS DateTime), CAST(N'2017-11-07 19:50:20.637' AS DateTime), N'Tudo ok', 73, 21, 19, 4, N' 72.01', 2, CAST(N'2017-11-09 19:20:59.440' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (103, CAST(N'2017-11-07 19:51:09.247' AS DateTime), CAST(N'2017-11-07 19:51:58.963' AS DateTime), N'Tudo Ok', 72, 21, 19, 4, N' 0.01', 2, CAST(N'2017-11-07 19:51:58.963' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (104, CAST(N'2017-11-09 19:20:59.440' AS DateTime), CAST(N'2017-11-12 16:21:13.410' AS DateTime), NULL, 73, 21, 19, 4, NULL, 2, CAST(N'2017-11-12 16:21:13.410' AS DateTime), N'HugoGestor')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (105, CAST(N'2017-11-12 12:59:38.097' AS DateTime), CAST(N'2017-11-12 12:59:38.097' AS DateTime), NULL, 72, 21, 19, 4, NULL, 2, CAST(N'2017-11-12 12:59:38.097' AS DateTime), N'HugoGestor')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (106, NULL, NULL, NULL, 70, 22, 19, 4, NULL, 2, CAST(N'2017-11-07 20:07:09.407' AS DateTime), N'HugoCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (107, CAST(N'2017-11-12 16:24:42.673' AS DateTime), CAST(N'2017-11-12 16:24:42.673' AS DateTime), NULL, 74, 20, 19, 4, NULL, 2, CAST(N'2017-11-12 16:24:42.673' AS DateTime), N'HugoGestor')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (108, CAST(N'2017-11-14 18:55:49.987' AS DateTime), CAST(N'2017-11-19 13:49:46.683' AS DateTime), N'Tudo ok', 75, 20, 19, 4, N' 114.90', 2, CAST(N'2017-11-19 13:49:46.683' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (109, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 22, 19, 4, N'0.00', 2, CAST(N'2017-11-12 22:27:05.617' AS DateTime), N'HugoGestor')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (110, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 22, 19, 4, N'0.00', 2, CAST(N'2017-11-12 22:39:36.770' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (111, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 20, 19, 4, N'0.00', 2, CAST(N'2017-11-12 22:43:04.717' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (112, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 22, 19, 4, N'0.00', 2, CAST(N'2017-11-12 22:47:58.180' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (113, CAST(N'2017-11-18 19:30:19.303' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 21, 19, 4, N'0.00', 2, CAST(N'2017-11-18 19:30:19.303' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (114, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'Atendimento recusado', 76, 20, 19, 4, N'0.00', 2, CAST(N'2017-11-12 22:53:23.463' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (115, CAST(N'2017-11-18 19:30:19.303' AS DateTime), CAST(N'2017-11-18 19:33:12.287' AS DateTime), N'Finalizado.', 76, 21, 19, 4, N' 0.05', 2, CAST(N'2017-11-18 19:33:12.287' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (116, CAST(N'2017-11-19 14:39:20.710' AS DateTime), CAST(N'2017-11-19 14:39:20.710' AS DateTime), NULL, 77, 21, 19, 4, NULL, 2, CAST(N'2017-11-19 14:39:20.710' AS DateTime), N'HugoCliente')
INSERT [dbo].[Atendimento] ([idAtendimento], [dataInicioAtendimento], [dataFimAtendimento], [relatorioAtendimento], [idChamado], [idTecnico], [idCliente], [idRegiaoAtendimento], [tempoAtendimento], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (117, CAST(N'2017-11-20 14:45:40.073' AS DateTime), CAST(N'2017-11-20 19:15:34.450' AS DateTime), N'Concluído com sucesso!', 78, 30, 31, 4, N' 4.50', 2, CAST(N'2017-11-20 19:15:34.450' AS DateTime), N'HugoTecnico3')
SET IDENTITY_INSERT [dbo].[Atendimento] OFF
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'aaaaaaaaaa', 68, 38, 2, CAST(N'2017-11-04 16:19:37.987' AS DateTime), N'HugoCliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'', 71, 37, 2, CAST(N'2017-11-04 16:03:22.737' AS DateTime), N'HugoCliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 4, N'', 81, 52, 2, CAST(N'2017-10-16 13:20:49.083' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 4, N'', 82, 53, 2, CAST(N'2017-10-17 19:34:36.367' AS DateTime), N'HugoCliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (3, 5, N'jjjj', 90, 61, 2, CAST(N'2017-10-24 19:17:37.713' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'Muito bom', 91, 62, 2, CAST(N'2017-11-03 19:28:01.760' AS DateTime), N'HugoCliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 2, N'', 99, 70, 2, CAST(N'2017-11-03 20:49:45.640' AS DateTime), N'HugoGestor')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 5, N'Muito bom', 100, 71, 2, CAST(N'2017-11-14 19:11:45.397' AS DateTime), N'HugoCliente')
INSERT [dbo].[Avaliacao] ([avaliacaoTecnico], [avaliacaoAtendimento], [comentario], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (5, 4, N'Muito bom', 115, 76, 2, CAST(N'2017-11-19 15:00:42.660' AS DateTime), N'HugoCliente')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (23, 47, 18, 2, CAST(N'2017-11-03 12:29:58.117' AS DateTime), N'HugoTecnico')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, 48, 19, 2, CAST(N'2017-11-03 13:03:06.573' AS DateTime), N'HugoTecnico')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (2, 64, 35, 2, CAST(N'2017-11-03 13:03:51.510' AS DateTime), N'HugoTecnico')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, 80, 52, 2, CAST(N'2017-11-03 19:26:31.963' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, 83, 54, 2, CAST(N'2017-11-09 20:33:43.023' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[AvaliacaoSolucao] ([likeSolucao], [idAtendimento], [idChamado], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (1, 90, 61, 0, CAST(N'2017-11-03 13:04:32.063' AS DateTime), N'HugoTecnico')
SET IDENTITY_INSERT [dbo].[Chamado] ON 

INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (8, 19, N'Instalar windows no meu PC', N'a', 5, CAST(N'2017-08-14 20:18:24.910' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 6, 2, N'a', NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-14 20:18:50.377' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (9, 19, N'Instalar windows no meu PC', N'asasdas', 5, CAST(N'2017-08-14 20:46:12.863' AS DateTime), CAST(N'2017-08-14 20:47:20.427' AS DateTime), 6, 4, N'aaa', NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-14 20:47:20.427' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (10, 19, N'Instalar windows no meu PC', N'sdfdsddf', 5, CAST(N'2017-08-14 20:48:12.510' AS DateTime), CAST(N'2017-08-15 18:43:36.063' AS DateTime), 6, 3, N'sdhbfhbsd', NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-15 18:43:36.063' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (18, 19, N'Instalar windows no meu PC', N'hhhh', 3, CAST(N'2017-08-15 23:41:13.503' AS DateTime), CAST(N'2017-08-27 12:51:46.940' AS DateTime), 6, 4, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 12:51:46.940' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (19, 19, N'Instalar Windows 7', N'Instalação padrão', 3, CAST(N'2017-08-27 13:56:01.570' AS DateTime), CAST(N'2017-08-27 14:31:51.263' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 14:31:51.263' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (29, 19, N'aidas', N'dasdasd', 3, CAST(N'2017-08-27 16:02:03.357' AS DateTime), CAST(N'2017-08-27 16:13:43.400' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 16:13:43.400' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (32, 19, N'asdas', N'asda', 3, CAST(N'2017-08-27 16:32:04.760' AS DateTime), CAST(N'2017-08-27 16:32:50.153' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 16:32:50.153' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (33, 19, N'asdasd', N'asdasd', 3, CAST(N'2017-08-27 16:33:56.447' AS DateTime), CAST(N'2017-08-27 16:35:35.290' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 16:35:35.290' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (34, 19, N'asdasd', N'asdasd', 3, CAST(N'2017-08-27 16:52:51.360' AS DateTime), CAST(N'2017-08-27 16:54:33.680' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-27 16:54:33.680' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (35, 19, N'asdasdas', N'asdasd', 3, CAST(N'2017-08-28 19:05:42.103' AS DateTime), CAST(N'2017-08-28 19:08:36.110' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-28 19:08:36.110' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (36, 19, N'asdasd', N'asdasd', 3, CAST(N'2017-08-28 19:50:20.033' AS DateTime), CAST(N'2017-08-28 20:03:42.030' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-08-28 20:03:42.030' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (37, 19, N'asdasd', N'asdasd', 3, CAST(N'2017-08-28 20:04:17.483' AS DateTime), CAST(N'2017-09-03 13:26:30.630' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2017-09-03 13:26:30.630' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (38, 19, N'asdasd', N'asdasdas', 3, CAST(N'2017-08-28 20:15:41.237' AS DateTime), CAST(N'2017-10-16 13:26:00.427' AS DateTime), 6, 2, NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2017-10-16 13:26:00.427' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (42, 19, N'Instalar windows no meu PC', N'asd', 2, CAST(N'2017-09-03 13:44:20.443' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 1, CAST(N'2017-09-05 19:07:15.747' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (51, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-15 18:08:39.770' AS DateTime), CAST(N'2017-10-15 18:10:48.727' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-15 18:10:48.727' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (52, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-15 18:11:49.933' AS DateTime), CAST(N'2017-10-15 18:14:08.337' AS DateTime), 6, 4, NULL, NULL, NULL, 2, 0, 1, CAST(N'2017-10-15 18:14:08.337' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (53, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-16 14:58:40.333' AS DateTime), CAST(N'2017-10-17 19:06:52.587' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:06:52.587' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (54, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-17 19:09:06.033' AS DateTime), CAST(N'2017-10-17 19:13:26.713' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:13:26.713' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (55, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-17 19:10:09.880' AS DateTime), CAST(N'2017-10-17 21:02:15.203' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 21:02:15.203' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (56, 19, N'Instalar Windows 7', N'Instalar Windows 7', 5, CAST(N'2017-10-17 19:10:11.790' AS DateTime), CAST(N'2017-10-17 19:26:43.420' AS DateTime), 6, 2, N'teste', NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:26:43.420' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (57, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-17 19:20:22.960' AS DateTime), CAST(N'2017-10-17 19:22:48.853' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:22:48.853' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (58, 19, N'Instalar Windows 7', N'Instalar Windows 7', 5, CAST(N'2017-10-17 19:35:17.497' AS DateTime), CAST(N'2017-10-17 19:35:39.380' AS DateTime), 6, 2, N'teste', NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:35:39.380' AS DateTime), N'HugoCliente')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (59, 19, N'Instalar Windows 7', N'Instalar Windows 7', 5, CAST(N'2017-10-17 19:36:49.793' AS DateTime), CAST(N'2017-10-17 19:37:01.983' AS DateTime), 6, 2, N'teste', NULL, NULL, 2, 0, 0, CAST(N'2017-10-17 19:37:01.983' AS DateTime), N'HugoCliente')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (60, 19, N'Instalar Windows 7', N'Instalar Windows 7', 3, CAST(N'2017-10-17 20:57:41.340' AS DateTime), CAST(N'2017-11-03 15:03:51.130' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 15:03:51.130' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (61, 19, N'Instalar Windows 7', N'bla', 3, CAST(N'2017-10-24 19:12:02.690' AS DateTime), CAST(N'2017-10-24 19:16:48.213' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-10-24 19:16:48.213' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (62, 19, N'Instalação de Windows 7', N'Instalação de Windows 7', 3, CAST(N'2017-11-02 14:29:22.357' AS DateTime), CAST(N'2017-11-03 15:10:25.607' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 15:10:25.607' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (63, 19, N'Preciso que instale o windows na minha máquina', N'Peço urgente, estou sem computador.
Obrigado.', 5, CAST(N'2017-11-03 19:09:00.503' AS DateTime), CAST(N'2017-11-03 19:22:16.070' AS DateTime), 6, 3, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:22:16.070' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (64, 19, N'Preciso que instale o windows na minha máquina', N'Peço urgente, estou sem computador. Obrigado.', 5, CAST(N'2017-11-03 19:09:08.813' AS DateTime), CAST(N'2017-11-03 19:22:34.673' AS DateTime), 6, 3, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:22:34.673' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (65, 19, N'Preciso que instale', N'Peço urgente, estou sem computador. Obrigado.', 5, CAST(N'2017-11-03 19:09:37.877' AS DateTime), CAST(N'2017-11-03 19:22:58.823' AS DateTime), 6, 3, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:22:58.823' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (66, 19, N'Preciso que instale', N'Peço urgente, estou', 5, CAST(N'2017-11-03 19:09:41.543' AS DateTime), CAST(N'2017-11-03 19:23:19.380' AS DateTime), 6, 3, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:23:19.380' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (67, 19, N'Preciso que instale o windows na minha máquina', N'asdasdasdas', 5, CAST(N'2017-11-03 19:12:20.420' AS DateTime), CAST(N'2017-11-03 19:23:37.630' AS DateTime), 6, 2, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:23:37.630' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (68, 19, N'Preciso que instale o windows na minha máquina', N'asdasdasdas', 5, CAST(N'2017-11-03 19:13:50.067' AS DateTime), CAST(N'2017-11-03 19:24:05.750' AS DateTime), 6, 2, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:24:05.750' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (69, 19, N'Preciso que instale o windows na minha máquina', N'asdasdasdas', 5, CAST(N'2017-11-03 19:14:24.563' AS DateTime), CAST(N'2017-11-03 19:24:25.223' AS DateTime), 6, 2, N'Cancelado', NULL, NULL, 2, 0, 0, CAST(N'2017-11-03 19:24:25.223' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (70, 19, N'Preciso que instale o windows na minha máquina', N'Preciso que instale o windows na minha máquina', 4, CAST(N'2017-11-03 19:20:04.807' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 1, CAST(N'2017-11-03 19:41:18.497' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (71, 19, N'asdasd', N'asdasd', 3, CAST(N'2017-11-04 19:26:15.627' AS DateTime), CAST(N'2017-11-14 19:06:52.067' AS DateTime), 6, 2, NULL, N'  05/11/2017 19:46:43: teste  05/11/2017 19:46:33: testeteste ||| Trâmites anteriores: ', NULL, 2, 0, 0, CAST(N'2017-11-14 19:06:52.067' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (72, 19, N'asd', N'asd', 5, CAST(N'2017-11-04 19:40:40.867' AS DateTime), CAST(N'2017-11-12 12:59:38.043' AS DateTime), 6, 2, N'teste', N'  12/11/2017 12:53:56: teste  09/11/2017 20:38:53: fui lá foi  09/11/2017 20:38:40: asdasdasd', NULL, 2, 0, 1, CAST(N'2017-11-12 12:59:38.043' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (73, 19, N'asdasdas', N'asdasdas', 5, CAST(N'2017-11-04 19:49:22.277' AS DateTime), CAST(N'2017-11-12 16:21:13.400' AS DateTime), 6, 2, N'ca', N'  07/11/2017 20:02:33: Fadigou', NULL, 2, 0, 1, CAST(N'2017-11-12 16:21:13.400' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (74, 19, N'Teste', N'Teste', 5, CAST(N'2017-11-12 16:14:07.310' AS DateTime), CAST(N'2017-11-12 16:24:42.663' AS DateTime), 6, 2, N'a', NULL, NULL, 2, 0, 0, CAST(N'2017-11-12 16:24:42.663' AS DateTime), N'HugoGestor')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (75, 19, N'Teste', N'teste', 3, CAST(N'2017-11-12 16:17:12.303' AS DateTime), CAST(N'2017-11-19 13:49:46.697' AS DateTime), 6, 2, NULL, N'  12/11/2017 16:17:50: Anda logo, porra', NULL, 2, 0, 0, CAST(N'2017-11-19 13:49:46.697' AS DateTime), N'HugoTecnico')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (76, 19, N'Teste', N'teste', 3, CAST(N'2017-11-12 22:26:32.780' AS DateTime), CAST(N'2017-11-18 19:33:12.307' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-11-18 19:33:12.307' AS DateTime), N'HugoTecnico2')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (77, 19, N'Teste', N'Teste', 5, CAST(N'2017-11-18 19:15:35.830' AS DateTime), CAST(N'2017-11-19 14:39:20.487' AS DateTime), 6, 2, N'Não é mais preciso.', N'  18/11/2017 19:15:51 HugoCliente: Peço prioridade, preciso de ajuda', NULL, 2, 0, 0, CAST(N'2017-11-19 14:39:20.487' AS DateTime), N'HugoCliente')
INSERT [dbo].[Chamado] ([idChamado], [idCliente], [assunto], [descricao], [idStatusChamado], [dataAbertura], [dataFechamento], [idServico], [idPrioridade], [infoCancelamento], [infoTramite], [infoPendencias], [idEmpresa], [ContReabertura], [ContPendencia], [dataRegistro], [usuarioRegistro]) VALUES (78, 31, N'Teste Localização', N'Teste', 3, CAST(N'2017-11-20 14:22:12.277' AS DateTime), CAST(N'2017-11-20 19:15:34.467' AS DateTime), 6, 2, NULL, NULL, NULL, 2, 0, 0, CAST(N'2017-11-20 19:15:34.467' AS DateTime), N'HugoTecnico3')
SET IDENTITY_INSERT [dbo].[Chamado] OFF
SET IDENTITY_INSERT [dbo].[ChatPrivado] ON 

INSERT [dbo].[ChatPrivado] ([idChatPrivado], [idUsuarioOrig], [idUsuarioDest], [dataSala]) VALUES (5, N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b', N'55a3bc79-222a-4925-90bc-110440104767', CAST(N'2017-09-29 03:37:12.173' AS DateTime))
INSERT [dbo].[ChatPrivado] ([idChatPrivado], [idUsuarioOrig], [idUsuarioDest], [dataSala]) VALUES (6, N'55a3bc79-222a-4925-90bc-110440104767', N'bf9aef5e-30a3-408a-940a-c3140cec4f98', CAST(N'2017-09-29 03:51:15.353' AS DateTime))
INSERT [dbo].[ChatPrivado] ([idChatPrivado], [idUsuarioOrig], [idUsuarioDest], [dataSala]) VALUES (7, N'55a3bc79-222a-4925-90bc-110440104767', N'054b0932-65c3-4d9d-8b0f-a6c62a2f8e0a', CAST(N'2017-09-30 20:08:03.333' AS DateTime))
INSERT [dbo].[ChatPrivado] ([idChatPrivado], [idUsuarioOrig], [idUsuarioDest], [dataSala]) VALUES (8, N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b', N'bf9aef5e-30a3-408a-940a-c3140cec4f98', CAST(N'2017-11-15 19:43:05.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[ChatPrivado] OFF
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (19, N'123123', N'1212', N'1132132')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (24, N'123456', N'123456', N'123456')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (29, N'121212121212121', N'Detran', N'13453222750')
INSERT [dbo].[ClienteFisico] ([idUsuario], [docIdentificador], [orgaoEmissor], [cpf]) VALUES (31, N'111111111111111', N'Detran', N'13453222750')
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([idEmpresa], [nome], [endereco], [complemento], [cep], [telefone], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Suporte S.A.', N'Rua da assembleia 10', N'sala 3411', N'20022211', N'22123900', 1, CAST(N'2017-08-13 10:52:48.030' AS DateTime), N'Admin')
INSERT [dbo].[Empresa] ([idEmpresa], [nome], [endereco], [complemento], [cep], [telefone], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'News Suporte', N'Rua da assembleia 10', N'Sala 1022', N'20022211', N'22123900', 1, CAST(N'2017-08-13 11:09:41.010' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Especialidade] ON 

INSERT [dbo].[Especialidade] ([idEspecialidade], [especialidade], [descricao], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Suporte técnico de computadores', N'Especialidade em manutenção de computadores', 1, 2, CAST(N'2017-08-13 11:16:27.797' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[Especialidade] OFF
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (9, 2)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (10, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (11, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (20, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (21, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (22, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (23, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (30, 1)
INSERT [dbo].[Funcionario] ([idUsuario], [idDisponibilidade]) VALUES (32, 1)
SET IDENTITY_INSERT [dbo].[Geolocalizacao] ON 

INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (13, N'-22.9041059', N'-43.1755108', 20, CAST(N'2017-10-09 19:46:15.167' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (14, N'-22.9041743', N'-43.1755014', 20, CAST(N'2017-10-09 19:46:19.870' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (15, N'-22.9040811', N'-43.1755014', 20, CAST(N'2017-10-09 19:51:20.013' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (16, N'-22.9040434', N'-43.1755581', 20, CAST(N'2017-10-09 19:56:20.183' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (17, N'-22.9041052', N'-43.175596', 20, CAST(N'2017-10-09 20:01:22.863' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (18, N'-22.9040929', N'-43.175577', 20, CAST(N'2017-10-09 20:06:20.470' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (19, N'-22.904037', N'-43.175577', 20, CAST(N'2017-10-09 20:11:20.610' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (20, N'-22.9040993', N'-43.1755581', 22, CAST(N'2017-10-09 20:16:08.433' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (21, N'-22.9041523', N'-43.1753534', 22, CAST(N'2017-10-09 20:16:11.650' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (22, N'-22.9041523', N'-43.1753534', 22, CAST(N'2017-10-09 20:16:14.693' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (23, N'-22.9041523', N'-43.1753534', 20, CAST(N'2017-10-09 20:16:20.673' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (24, N'-22.90400654627003', N'-43.175432019255176', 22, CAST(N'2017-10-09 20:21:08.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (25, N'-22.90400654627003', N'-43.175432019255176', 20, CAST(N'2017-10-09 20:21:20.847' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (26, N'-22.90400654627003', N'-43.175432019255176', 22, CAST(N'2017-10-09 20:26:08.963' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (27, N'-22.90400654627003', N'-43.175432019255176', 20, CAST(N'2017-10-09 20:26:20.773' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (28, N'0.0', N'0.0', 20, CAST(N'2017-10-15 12:12:29.803' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (29, N'0.0', N'0.0', 20, CAST(N'2017-10-15 12:12:34.747' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (30, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:12:39.833' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (31, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:12:44.890' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (32, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:12:49.967' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (33, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:12:55.037' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (34, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:13:00.153' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (35, N'-22.788262', N'-43.3401779', 20, CAST(N'2017-10-15 12:13:05.193' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (36, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:10.250' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (37, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:15.303' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (38, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:20.393' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (39, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:25.463' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (40, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:30.533' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (41, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:35.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (42, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:40.660' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (43, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:45.730' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (44, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:13:50.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (45, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:25:57.190' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (46, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:01.500' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (47, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:06.573' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (48, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:11.747' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (49, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:16.733' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (50, N'0.0', N'0.0', 20, CAST(N'2017-10-15 12:26:21.853' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (51, N'-22.7872525', N'-43.3422899', 20, CAST(N'2017-10-15 12:26:26.837' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (52, N'-22.7872525', N'-43.3422899', 20, CAST(N'2017-10-15 12:26:31.890' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (53, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:36.917' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (54, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:41.977' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (55, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:47.020' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (56, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:52.043' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (57, N'-22.787032', N'-43.3378753', 20, CAST(N'2017-10-15 12:26:57.090' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (58, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:15:21.840' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (59, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:18:09.677' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (60, N'-22.9140043', N'-43.1909276', 21, CAST(N'2017-10-22 12:19:09.717' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (61, N'-22.9140043', N'-43.1909276', 21, CAST(N'2017-10-22 12:20:09.773' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (62, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:20:53.797' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (63, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:01.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (64, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:21.193' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (65, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:24.320' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (66, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:25.617' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (67, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:26.953' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (68, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:28.233' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (69, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:29.523' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (70, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:30.877' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (71, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:32.073' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (72, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:33.350' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (73, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:34.740' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (74, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:35.957' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (75, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:37.240' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (76, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:38.437' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (77, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:39.833' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (78, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:41.133' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (79, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:42.427' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (80, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:43.727' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (81, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:21:45.047' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (82, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:22:44.310' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (83, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:23:30.863' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (84, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:26:17.807' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (85, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:30:03.543' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (86, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:39:46.497' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (87, N'0.0', N'0.0', 21, CAST(N'2017-10-22 12:58:02.003' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (88, N'0.0', N'0.0', 21, CAST(N'2017-10-22 13:04:51.820' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (89, N'0.0', N'0.0', 21, CAST(N'2017-10-22 13:09:31.917' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (90, N'0.0', N'0.0', 21, CAST(N'2017-10-22 13:09:51.160' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (91, N'-22.9126594', N'-43.1912112', 21, CAST(N'2017-10-22 13:12:02.273' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (92, N'-22.9126594', N'-43.1912112', 21, CAST(N'2017-10-22 13:12:12.313' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (93, N'-22.9126594', N'-43.1912112', 21, CAST(N'2017-10-22 13:13:04.813' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (94, N'-22.9126594', N'-43.1912112', 21, CAST(N'2017-10-22 13:13:56.340' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (95, N'-22.913967', N'-43.1909276', 21, CAST(N'2017-10-22 13:14:33.237' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (96, N'-22.9139732', N'-43.190937', 21, CAST(N'2017-10-22 13:19:56.227' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (97, N'0.0', N'0.0', 22, CAST(N'2017-10-24 19:20:27.107' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (98, N'0.0', N'0.0', 22, CAST(N'2017-10-24 19:21:27.230' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (99, N'0.0', N'0.0', 22, CAST(N'2017-10-24 19:22:29.237' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (100, N'-22.9040038', N'-43.1751179', 22, CAST(N'2017-10-24 19:23:29.333' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (101, N'-22.9040096', N'-43.1751041', 22, CAST(N'2017-10-24 19:24:29.417' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (102, N'-22.9040038', N'-43.1751179', 22, CAST(N'2017-10-24 19:25:29.460' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (103, N'-22.9040032', N'-43.175123', 22, CAST(N'2017-10-24 19:26:45.157' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (104, N'0.0', N'0.0', 22, CAST(N'2017-11-14 19:16:23.297' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (105, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:16:48.017' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (106, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:17:23.380' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (107, N'-22.9035389', N'-43.1748675', 22, CAST(N'2017-11-14 19:17:48.023' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (108, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:18:23.407' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (109, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:18:48.097' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (110, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:19:23.393' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (111, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:19:48.120' AS DateTime))
GO
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (112, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:20:23.467' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (113, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:20:48.140' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (114, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:21:23.517' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (115, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:21:48.187' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (116, N'-22.9041153', N'-43.1750365', 22, CAST(N'2017-11-14 19:22:23.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (117, N'-22.9041154', N'-43.1750359', 22, CAST(N'2017-11-14 19:22:48.473' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (118, N'-22.9040383', N'-43.1751418', 22, CAST(N'2017-11-14 19:23:23.850' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (119, N'-22.9040383', N'-43.1751418', 22, CAST(N'2017-11-14 19:23:48.517' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (120, N'-22.9040383', N'-43.1751418', 22, CAST(N'2017-11-14 19:24:24.643' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (121, N'-22.9040383', N'-43.1751418', 22, CAST(N'2017-11-14 19:24:49.400' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (122, N'-22.9041159', N'-43.1750302', 22, CAST(N'2017-11-14 19:25:26.093' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (123, N'-22.9041159', N'-43.1750302', 22, CAST(N'2017-11-14 19:25:50.840' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (124, N'-22.9041159', N'-43.1750302', 22, CAST(N'2017-11-14 19:26:26.370' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (125, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:26:51.283' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (126, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:27:26.653' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (127, N'-22.904112', N'-43.1750217', 22, CAST(N'2017-11-14 19:27:51.310' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (128, N'-22.9041282', N'-43.1750143', 22, CAST(N'2017-11-14 19:28:27.043' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (129, N'-22.9041302', N'-43.1750067', 22, CAST(N'2017-11-14 19:28:51.700' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (130, N'-22.9041118', N'-43.1750212', 22, CAST(N'2017-11-14 19:29:29.597' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (131, N'-22.9040412', N'-43.1751245', 22, CAST(N'2017-11-14 19:30:06.420' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (132, N'-22.9040416', N'-43.1751236', 22, CAST(N'2017-11-14 19:30:52.917' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (133, N'-22.9040418', N'-43.1751225', 22, CAST(N'2017-11-14 19:31:18.290' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (134, N'-22.9040418', N'-43.1751225', 22, CAST(N'2017-11-14 19:32:09.507' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (135, N'-22.9041358', N'-43.1748793', 22, CAST(N'2017-11-14 19:32:41.203' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (136, N'-22.9041358', N'-43.1748793', 22, CAST(N'2017-11-14 19:33:28.050' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (137, N'-22.9041186', N'-43.1748934', 22, CAST(N'2017-11-14 19:33:52.680' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (138, N'-22.9041186', N'-43.1748934', 22, CAST(N'2017-11-14 19:34:48.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (139, N'-22.9041358', N'-43.1748797', 22, CAST(N'2017-11-14 19:35:19.900' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (140, N'-22.9041278', N'-43.1748742', 22, CAST(N'2017-11-14 19:36:00.543' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (141, N'-22.9040917', N'-43.1748615', 22, CAST(N'2017-11-14 19:36:24.760' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (142, N'-22.9040989', N'-43.1748697', 22, CAST(N'2017-11-14 19:37:00.243' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (143, N'-22.9040989', N'-43.1748697', 22, CAST(N'2017-11-14 19:37:24.803' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (144, N'-22.9040849', N'-43.1748617', 22, CAST(N'2017-11-14 19:38:00.300' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (145, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:38:24.863' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (146, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:39:00.360' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (147, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:39:24.950' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (148, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:40:00.420' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (149, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:40:25.380' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (150, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:41:00.523' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (151, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:41:25.187' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (152, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:42:00.613' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (153, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:42:25.127' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (154, N'-22.9041408', N'-43.1748555', 22, CAST(N'2017-11-14 19:43:00.680' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (155, N'-22.9041311', N'-43.1748935', 22, CAST(N'2017-11-14 19:43:25.190' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (156, N'-22.904133', N'-43.1748896', 22, CAST(N'2017-11-14 19:44:00.737' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (157, N'-22.9041312', N'-43.1748931', 22, CAST(N'2017-11-14 19:44:25.227' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (158, N'-22.9041309', N'-43.1748934', 22, CAST(N'2017-11-14 19:45:01.303' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (159, N'-22.904133', N'-43.1748896', 22, CAST(N'2017-11-14 19:45:25.303' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (160, N'-22.904133', N'-43.1750193', 22, CAST(N'2017-11-14 19:46:00.900' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (161, N'-22.904133', N'-43.1750193', 22, CAST(N'2017-11-14 19:46:25.377' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (162, N'-22.9041106', N'-43.1750257', 22, CAST(N'2017-11-14 19:47:00.980' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (163, N'-22.9041398', N'-43.1750113', 22, CAST(N'2017-11-14 19:47:25.780' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (164, N'-22.9041519', N'-43.1750223', 22, CAST(N'2017-11-14 19:48:01.067' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (165, N'-22.9041213', N'-43.175006', 22, CAST(N'2017-11-14 19:48:25.500' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (166, N'-22.9041201', N'-43.1750082', 22, CAST(N'2017-11-14 19:49:01.117' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (167, N'-22.9041199', N'-43.1750083', 22, CAST(N'2017-11-14 19:49:25.560' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (168, N'-22.9041216', N'-43.1749934', 22, CAST(N'2017-11-14 19:50:06.267' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (169, N'-22.9041261', N'-43.1750095', 22, CAST(N'2017-11-14 19:50:30.463' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (170, N'0.0', N'0.0', 30, CAST(N'2017-11-20 16:18:28.083' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (171, N'0.0', N'0.0', 30, CAST(N'2017-11-20 16:19:28.160' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (172, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:20:28.220' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (173, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:21:28.303' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (174, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:22:28.393' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (175, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:23:28.577' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (176, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:24:28.653' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (177, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:25:28.740' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (178, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:26:28.897' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (179, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:27:28.920' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (180, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:28:28.973' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (181, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:29:29.043' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (182, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:30:29.150' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (183, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:31:29.233' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (184, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:32:29.330' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (185, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:33:29.417' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (186, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:34:29.517' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (187, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:35:29.597' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (188, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:36:29.653' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (189, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:37:29.667' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (190, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:38:29.727' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (191, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:39:29.830' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (192, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:40:29.907' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (193, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:41:30.003' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (194, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:42:30.070' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (195, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:43:30.160' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (196, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:44:30.227' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (197, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:45:30.317' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (198, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:46:30.367' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (199, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:47:30.457' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (200, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:48:30.593' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (201, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:49:31.277' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (202, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:50:30.690' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (203, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:51:30.780' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (204, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:52:30.853' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (205, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:53:30.943' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (206, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:54:31.043' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (207, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:55:31.137' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (208, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:56:31.223' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (209, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:57:31.317' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (210, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:58:31.387' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (211, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 16:59:31.477' AS DateTime))
GO
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (212, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:00:31.573' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (213, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:01:31.667' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (214, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:02:31.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (215, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:03:31.863' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (216, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:05:22.837' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (217, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:06:09.333' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (218, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:06:22.873' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (219, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:08:15.043' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (220, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:08:49.543' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (221, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:09:15.127' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (222, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:09:49.620' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (223, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:10:15.170' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (224, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:27:49.097' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (225, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:29:19.863' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (226, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 17:31:46.070' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (227, N'-22.78695831865075', N'-43.337944862115336', 30, CAST(N'2017-11-20 17:33:51.550' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (228, N'-22.787222288665046', N'-43.33787571003699', 30, CAST(N'2017-11-20 19:36:54.260' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (229, N'-22.787222288665046', N'-43.33787571003699', 30, CAST(N'2017-11-20 19:38:17.867' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (230, N'-22.787222288665046', N'-43.33787571003699', 30, CAST(N'2017-11-20 19:39:27.187' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (231, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 19:40:55.560' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (232, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 19:42:50.330' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (233, N'0.0', N'0.0', 30, CAST(N'2017-11-20 19:44:05.130' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (234, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 19:44:07.747' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (235, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 19:44:07.787' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (236, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:01:59.373' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (237, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:02:55.900' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (238, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:03:25.573' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (239, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:03:37.517' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (240, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:04:01.217' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (241, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:11:41.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (242, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:11:53.993' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (243, N'-22.787024884668718', N'-43.33781444344771', 30, CAST(N'2017-11-20 20:24:04.777' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (244, N'-22.787024884668718', N'-43.33781444344771', 30, CAST(N'2017-11-20 20:24:17.877' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (245, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:24:24.957' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (246, N'-22.787024884668718', N'-43.33781444344771', 30, CAST(N'2017-11-20 20:24:28.060' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (247, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:25:09.993' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (248, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:10.900' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (249, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:10.910' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (250, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:10.910' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (251, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:46.330' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (252, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:47.060' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (253, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:47.073' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (254, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:47.080' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (255, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:25:57.247' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (256, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:26:01.257' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (257, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:01.270' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (258, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:26:01.270' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (259, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:15.053' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (260, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:15.697' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (261, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:15.700' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (262, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:15.710' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (263, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:27.413' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (264, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:27.997' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (265, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:28.000' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (266, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:28.003' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (267, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:41.100' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (268, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:42.180' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (269, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:42.190' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (270, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:26:42.197' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (271, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:26:57.237' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (272, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:26:57.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (273, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:26:57.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (274, N'-22.7869546', N'-43.3422899', 30, CAST(N'2017-11-20 20:26:57.770' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (275, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:51:59.837' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (276, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:52:11.860' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (277, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:52:21.853' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (278, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:52:43.910' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (279, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:52:53.937' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (280, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:53:16.533' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (281, N'0.0', N'0.0', 30, CAST(N'2017-11-20 20:56:58.290' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (282, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:57:11.940' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (283, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:57:54.373' AS DateTime))
INSERT [dbo].[Geolocalizacao] ([idGeo], [latitude], [longitude], [idUsuario], [dataRegistro]) VALUES (284, N'-22.7870316', N'-43.3378747', 30, CAST(N'2017-11-20 20:59:09.863' AS DateTime))
SET IDENTITY_INSERT [dbo].[Geolocalizacao] OFF
SET IDENTITY_INSERT [dbo].[Mensagem] ON 

INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (78, N'HugoTecnico', N'a', CAST(N'2017-09-29 03:50:09.400' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (79, N'HugoTecnico', N'a', CAST(N'2017-09-29 04:16:29.530' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (80, N'HugoTecnico', N'b', CAST(N'2017-09-29 04:17:03.667' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (81, N'HugoTecnico', N'c', CAST(N'2017-09-29 04:17:22.983' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (82, N'HugoTecnico', N'd', CAST(N'2017-09-29 04:17:31.583' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (83, N'HugoTecnico', N'Ahhshsushsushsushs
', CAST(N'2017-09-29 22:36:13.703' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (84, N'HugoTecnico0', N'asdashduihasuidhaiushdiuahsuidh', CAST(N'2017-09-29 22:36:54.587' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (85, N'HugoTecnico0', N'asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', CAST(N'2017-09-29 22:39:15.160' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (86, N'HugoTecnico0', N'asdasdasdasdasdaaaaaadddddddddddddddddddddddddddddddddddddddddd', CAST(N'2017-09-29 22:41:03.567' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (87, N'HugoTecnico0', N'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', CAST(N'2017-09-29 22:41:08.877' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (88, N'HugoTecnico0', N'asiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidhasiudhaisuhdiaushdiuashuidlhalsidh', CAST(N'2017-09-29 22:49:23.373' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (89, N'HugoTecnico0', N'ashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdausashudahsuihdaus', CAST(N'2017-09-29 22:59:55.943' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (90, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:26.500' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (91, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:28.303' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (92, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:29.153' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (93, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:31.047' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (94, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:32.063' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (95, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:33.253' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (96, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:34.633' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (97, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:35.527' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (98, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:36.473' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (99, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:37.630' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (100, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:43:38.790' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (101, N'HugoTecnico0', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2017-09-29 23:43:48.803' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (102, N'HugoTecnico0', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2017-09-29 23:44:00.683' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (103, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:44:25.930' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (104, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:44:26.733' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (105, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:44:28.193' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (106, N'HugoTecnico0', N'a', CAST(N'2017-09-29 23:44:33.250' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (107, N'HugoTecnico0', N'ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d 
', CAST(N'2017-09-30 00:12:46.990' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (108, N'HugoTecnico0', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2017-09-30 00:13:55.317' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (109, N'HugoTecnico0', N'ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ashdkj asd asd asd asd asd as da sdas d ', CAST(N'2017-09-30 00:15:23.827' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (110, N'HugoTecnico', N'Bshshshd', CAST(N'2017-09-30 20:06:23.300' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (111, N'HugoTecnico', N'Oiiiii!', CAST(N'2017-09-30 20:06:43.903' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (112, N'HugoTecnico0', N'Oi
', CAST(N'2017-09-30 20:06:55.003' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (113, N'HugoTecnico0', N'Te amo <3', CAST(N'2017-09-30 20:07:02.520' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (114, N'HugoTecnico', N'Te amooooo', CAST(N'2017-09-30 20:08:24.613' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (115, N'HugoTecnico', N'Vidaaaaaa', CAST(N'2017-09-30 20:08:29.033' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (116, N'HugoTecnico', N'Gostoso', CAST(N'2017-09-30 20:08:45.427' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (117, N'HugoGestor', N'Lindaaa', CAST(N'2017-09-30 20:08:57.807' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (118, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha a ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a
', CAST(N'2017-10-04 20:58:05.190' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (119, N'HugoTecnico', N'Oi', CAST(N'2017-10-04 20:58:36.377' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (120, N'HugoTecnico', N'Tudo bem', CAST(N'2017-10-04 20:58:39.050' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (121, N'HugoTecnico', N'Oi', CAST(N'2017-10-04 20:58:42.303' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (122, N'HugoTecnico', N'Oi', CAST(N'2017-10-04 20:58:43.853' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (123, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a', CAST(N'2017-10-04 21:01:27.230' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (124, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a', CAST(N'2017-10-04 21:01:28.623' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (125, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a', CAST(N'2017-10-04 21:01:30.457' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (126, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a', CAST(N'2017-10-04 21:01:31.543' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (127, N'HugoTecnico0', N'ahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha aahsd ausdiahs hsudhaus ahsudha a', CAST(N'2017-10-04 21:01:33.280' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (128, N'HugoTecnico0', N'Fala aí', CAST(N'2017-10-04 21:05:44.637' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (129, N'FabianoGestor', N'Opa', CAST(N'2017-10-04 21:05:57.467' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (130, N'HugoTecnico0', N'uhuuuuu', CAST(N'2017-10-04 21:06:04.710' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (131, N'FabianoGestor', N'Showwwww', CAST(N'2017-10-04 21:06:05.837' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (132, N'HugoTecnico0', N'zzzzz', CAST(N'2017-10-04 21:06:43.773' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (133, N'HugoTecnico0', N'Cansado', CAST(N'2017-10-04 21:06:47.573' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (134, N'HugoTecnico', N'teste', CAST(N'2017-10-15 13:09:58.197' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (135, N'HugoTecnico0', N'asdasd', CAST(N'2017-10-15 22:24:30.557' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (136, N'HugoTecnico0', N'asdasd', CAST(N'2017-10-15 22:24:33.530' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (137, N'HugoTecnico0', N'asdasd', CAST(N'2017-10-15 22:24:36.280' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (138, N'HugoTecnico0', N'asdasd', CAST(N'2017-10-15 22:24:37.633' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (139, N'HugoTecnico0', N'asdasd', CAST(N'2017-10-15 22:24:38.633' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (140, N'HugoTecnico0', N'kkkkk', CAST(N'2017-10-24 19:23:05.373' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (141, N'HugoTecnico', N'Kkkkk', CAST(N'2017-10-24 19:23:10.273' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (142, N'HugoTecnico0', N'kkk', CAST(N'2017-10-24 19:24:32.307' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (143, N'HugoTecnico', N'Gaaa', CAST(N'2017-10-24 19:25:02.270' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (144, N'HugoTecnico0', N'ggghg', CAST(N'2017-10-24 19:25:06.233' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (145, N'HugoTecnico', N'a', CAST(N'2017-11-02 23:58:14.683' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (146, N'HugoTecnico', N'a', CAST(N'2017-11-02 23:58:17.050' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1145, N'HugoGestor', N'uikggf', CAST(N'2017-11-03 20:50:30.587' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1146, N'HugoTecnico', N'Hashjshss', CAST(N'2017-11-03 20:50:57.337' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1147, N'HugoGestor', N'asdasdassd', CAST(N'2017-11-03 20:51:04.273' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1148, N'HugoGestor', N'Oi', CAST(N'2017-11-06 13:10:54.767' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1149, N'HugoGestor', N'aaaa', CAST(N'2017-11-09 19:17:16.227' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1150, N'HugoGestor', N'teste', CAST(N'2017-11-09 19:17:18.397' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1151, N'HugoGestor', N'a', CAST(N'2017-11-09 19:17:28.220' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1152, N'HugoGestor', N'hjhghjg', CAST(N'2017-11-09 19:18:00.420' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1153, N'HugoTecnico', N'Oi', CAST(N'2017-11-09 19:18:04.013' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1154, N'HugoGestor', N'a', CAST(N'2017-11-12 15:34:23.960' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1155, N'HugoGestor', N'a', CAST(N'2017-11-12 15:34:24.990' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1156, N'HugoGestor', N'a', CAST(N'2017-11-12 15:34:26.647' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1157, N'HugoGestor', N'a', CAST(N'2017-11-12 15:34:28.950' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1158, N'HugoGestor', N'a', CAST(N'2017-11-12 15:34:31.910' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1159, N'HugoGestor', N'teste', CAST(N'2017-11-12 15:46:01.297' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1160, N'HugoTecnico0', N'Oi tudo bem pessoal?', CAST(N'2017-11-14 19:13:58.423' AS DateTime))
INSERT [dbo].[Mensagem] ([idChat], [usuario], [mensagem], [dataMensagem]) VALUES (1161, N'HugoTecnico', N'Tudo ok! tá precisando de ajuda?', CAST(N'2017-11-14 19:14:09.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mensagem] OFF
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (78, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (80, 6)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (82, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (89, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (114, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (115, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (116, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (117, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (118, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (119, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (120, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (121, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (122, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (142, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (143, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (144, 5)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1154, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1155, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1156, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1157, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1158, 7)
INSERT [dbo].[MensagemXChatPrivado] ([idChat], [idChatPrivado]) VALUES (1159, 7)
SET IDENTITY_INSERT [dbo].[Notificacao] ON 

INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (1, 20, 9, 10, 4, 1, CAST(N'2017-11-15 19:14:32.720' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (2, 20, 23, 10, 4, 0, CAST(N'2017-11-15 19:14:32.763' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (3, 21, 9, 10, 4, 1, CAST(N'2017-11-15 19:14:32.770' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (4, 21, 23, 10, 4, 0, CAST(N'2017-11-15 19:14:32.777' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (5, 22, 9, 10, 4, 1, CAST(N'2017-11-15 19:14:32.810' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (6, 22, 23, 10, 4, 0, CAST(N'2017-11-15 19:14:32.813' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (7, 9, 20, 1, 1, 1, CAST(N'2017-11-15 19:28:08.863' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (8, 9, 21, 1, 1, 1, CAST(N'2017-11-15 19:28:08.873' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (9, 9, 22, 1, 1, 1, CAST(N'2017-11-15 19:28:08.873' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (10, 9, 23, 1, 1, 0, CAST(N'2017-11-15 19:28:08.873' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (11, 22, 21, 2, 2, 1, CAST(N'2017-11-15 19:43:05.337' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (12, 0, 21, 3, 4, 0, CAST(N'2017-11-18 19:15:36.113' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (13, 0, 19, 3, 4, 0, CAST(N'2017-11-18 19:15:36.147' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (14, 0, 21, 4, 4, 0, CAST(N'2017-11-18 19:30:19.733' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (15, 0, 19, 4, 4, 0, CAST(N'2017-11-18 19:30:19.757' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (16, 0, 21, 5, 4, 0, CAST(N'2017-11-18 19:33:12.313' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (17, 0, 19, 5, 4, 0, CAST(N'2017-11-18 19:33:12.323' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (18, 0, 20, 5, 4, 0, CAST(N'2017-11-19 13:49:46.710' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (19, 0, 21, 6, 4, 0, CAST(N'2017-11-19 14:39:20.717' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (20, 0, 19, 6, 4, 0, CAST(N'2017-11-19 14:39:20.740' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (21, 0, 22, 3, 4, 0, CAST(N'2017-11-20 14:22:12.413' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (22, 0, 31, 3, 4, 1, CAST(N'2017-11-20 14:22:12.430' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (23, 0, 30, 3, 4, 1, CAST(N'2017-11-20 14:24:10.363' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (24, 0, 30, 4, 4, 1, CAST(N'2017-11-20 14:45:40.090' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (25, 0, 31, 4, 4, 1, CAST(N'2017-11-20 14:45:56.967' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (26, 30, 9, 10, 4, 1, CAST(N'2017-11-20 17:30:10.030' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (27, 30, 23, 10, 4, 0, CAST(N'2017-11-20 17:30:10.047' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (28, 0, 30, 5, 4, 1, CAST(N'2017-11-20 19:15:34.607' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (29, 0, 31, 5, 4, 0, CAST(N'2017-11-20 19:15:37.823' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (30, 20, 9, 10, 4, 0, CAST(N'2017-11-20 19:23:08.790' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (31, 21, 9, 10, 4, 0, CAST(N'2017-11-20 19:23:09.277' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (32, 22, 9, 10, 4, 0, CAST(N'2017-11-20 19:23:09.770' AS DateTime))
INSERT [dbo].[Notificacao] ([idNotificacao], [idUsuarioOrigem], [idUsuarioDestino], [idMsgNotificacao], [idTipo], [vista], [dataRegistro]) VALUES (33, 30, 9, 10, 4, 0, CAST(N'2017-11-20 19:23:10.243' AS DateTime))
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
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Baixa', CAST(N'2017-01-05 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Média', CAST(N'2017-01-05 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Alta', CAST(N'2017-01-05 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[PrioridadeChamado] ([idPrioridade], [descricao], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Urgente', CAST(N'2017-01-05 11:49:00.000' AS DateTime), N'Admin')
INSERT [dbo].[RecusaAtendimento] ([idChamado], [idTecnico], [idEmpresa], [motivo], [dataRegistro], [usuarioRegistro]) VALUES (76, 20, 2, N'19', CAST(N'2017-11-12 22:55:12.923' AS DateTime), N'HugoTecnico')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] ON 

INSERT [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento], [regiao], [cidade], [estado], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Centro', N'Rio de Janeiro', N'RJ', 1, 2, CAST(N'2017-08-13 11:15:22.133' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[RegiaoDeAtendimento] OFF
SET IDENTITY_INSERT [dbo].[Servico] ON 

INSERT [dbo].[Servico] ([idServico], [idTipo], [nome], [descricao], [sla], [ativo], [idEmpresa], [dataRegistro], [usuarioRegistro]) VALUES (6, 1, N'Instalação de Windows 7', N'Instalação de sistemas operacionais Microsoft Windows 7', 5, 1, 2, CAST(N'2017-08-13 11:18:56.400' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[Servico] OFF
INSERT [dbo].[ServicoXEspecialidade] ([idEspecialidade], [idServico], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, 6, 1, CAST(N'2017-08-13 11:19:25.310' AS DateTime), N'HugoGestor')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Aberto', N'Chamado em estado de aberto e não atendido', 1, CAST(N'2017-01-05 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Em andamento', N'Chamado em estado de andamento', 1, CAST(N'2017-01-05 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Concluído', N'Chamado concluído com sucesso', 1, CAST(N'2017-01-05 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Retrabalho', N'Chamado que foi concluído o atendimento porém com pendência', 1, CAST(N'2017-01-05 11:27:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusChamado] ([idStatusChamado], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Cancelado', N'Chamado que foi cancelado por motivos diversos', 1, CAST(N'2017-01-05 11:27:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[StatusDisponibilidade] ON 

INSERT [dbo].[StatusDisponibilidade] ([idDisponibilidade], [descStatus]) VALUES (1, N'Disponível')
INSERT [dbo].[StatusDisponibilidade] ([idDisponibilidade], [descStatus]) VALUES (2, N'Em atendimento')
SET IDENTITY_INSERT [dbo].[StatusDisponibilidade] OFF
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Disponível', N'Usuário disponível', 1, CAST(N'2017-08-27 00:00:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (2, N'Atend', N'Atendimento', 1, CAST(N'2017-08-27 00:00:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Bloq', N'Usuario bloq', 1, CAST(N'2017-08-28 00:00:00.000' AS DateTime), N'Admin')
INSERT [dbo].[StatusUsuario] ([idStatusUsuario], [status], [descStatus], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Ausente', N'Usuario ausente', 1, CAST(N'2017-11-16 00:00:00.000' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[TipoNotificacao] ON 

INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (1, N'Chat')
INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (2, N'Chat Privado')
INSERT [dbo].[TipoNotificacao] ([idTipo], [descricao]) VALUES (4, N'Sistema')
SET IDENTITY_INSERT [dbo].[TipoNotificacao] OFF
SET IDENTITY_INSERT [dbo].[TipoServico] ON 

INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (1, N'Instalação', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (3, N'Manutenção', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (4, N'Exclusão', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (5, N'Backup', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (6, N'Formatação', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (7, N'Problema', 2, 1, CAST(N'2017-01-05 11:32:00.000' AS DateTime), N'Admin')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (8, N'Teste1', 2, 0, CAST(N'2017-11-19 16:49:29.953' AS DateTime), N'HugoGestor')
INSERT [dbo].[TipoServico] ([idTipoServ], [tipo], [idEmpresa], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (9, N'Teste1', 2, 0, CAST(N'2017-11-19 16:51:01.180' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[TipoServico] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (9, N'Hugo Bezerra Pimentel', N'Rua da assembleia 10', N'34111', N'27277227', N'22123900', 2, 1, CAST(N'2017-11-12 15:27:20.133' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (10, N'Douglas', N'Rua da assembleia 10', N'3411', N'27277227', N'22123900', 3, 1, CAST(N'2017-08-13 11:10:44.857' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (11, N'Hugo Tecnico', N'Rua da assembleia 10', N'3411', N'27277227', N'22123900', 2, 3, CAST(N'2017-08-14 20:13:49.527' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (19, N'Hugo Cliente', N'Rua da assembleia 10', N'3411', N'27277227', N'22123900', 2, 1, CAST(N'2017-08-14 20:11:47.573' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (20, N'Hugo Tecnico', N'Rua da assembleia 10', N'3411', N'27277227', N'22123900', 2, 1, CAST(N'2017-08-14 20:14:24.490' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (21, N'Hugo Tecnico 2', N'Rua da assembleia 10', N'3411', N'27277227', N'22123900', 2, 1, CAST(N'2017-08-23 19:19:30.913' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (22, N'Hugo Tecnico 0', N'Rua da assembleia 10', N'sala 3411', N'27277227', N'22123900', 2, 1, CAST(N'2017-11-04 13:24:14.613' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (23, N'Fabiano', N'Rua da assembleia 10', N'1', N'27277227', N'22123900', 2, 1, CAST(N'2017-10-04 21:04:13.560' AS DateTime), N'HugoTecnico0')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (24, N'Hugo', N'Rua bom jardim', N'lote 48 quadra 08', N'25580740', N'123456', 2, 1, CAST(N'2017-11-04 15:43:57.540' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (25, N'Hugo Cliente 1', N'Rua Bom Jardim', N'Trezentos, São João de Meriti, RJ, , ', N'25580740', N'27828275', 2, 1, CAST(N'2017-11-19 18:52:41.693' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (26, N'Hugo Cliente 2', N'Rua Bom Jardim, Trezentos, São João de Meriti, RJ', N'Lote 48 Quadra 08', N'25580740', N'2555545454', 2, 1, CAST(N'2017-11-19 19:02:06.560' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (27, N'Hugo Cliente 3', N'Rua Bom Jardim, Trezentos, São João de Meriti, RJ', N'Lote 48 Quadra 08', N'25580740', N'2222222222', 2, 1, CAST(N'2017-11-19 19:09:36.557' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (28, N'Hugo Cliente 4', N'Rua Bom Jardim, Trezentos, São João de Meriti, RJ', N'Lote 48 Quadra 08', N'25580740', N'1212121212', 2, 1, CAST(N'2017-11-19 19:13:20.000' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (29, N'Hugo Cliente 4', N'Rua Bom Jardim, Trezentos, São João de Meriti, RJ', N'Lote 48 Quadra 08', N'25580740', N'1212121212', 2, 1, CAST(N'2017-11-19 19:15:46.717' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (30, N'Hugo Tecnico 3', N'Rua Bom Jardim Lote 48 Quadra 08 Trezentos São João de Meriti RJ', N'Lote 48 Quadra 08', N'25580740', N'2222222222', 2, 1, CAST(N'2017-11-20 13:22:08.507' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (31, N'Hugo Cliente 7', N'Rua da Assembléia 10 3411 Centro Rio de Janeiro RJ', N'3411', N'20011901', N'1211122222', 2, 1, CAST(N'2017-11-20 13:26:04.573' AS DateTime), N'HugoGestor')
INSERT [dbo].[Usuario] ([idUsuario], [nome], [endereco], [numero], [cep], [telefone], [idEmpresa], [idStatusUsuario], [dataRegistro], [usuarioRegistro]) VALUES (32, N'Hugo Atendente', N'Rua Bom Jardim Lote 48 Quadra 08 Trezentos São João de Meriti RJ', N'Lote 48 Quadra 08', N'25580740', N'1211122222', 2, 1, CAST(N'2017-11-20 18:07:27.437' AS DateTime), N'HugoGestor')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (11, 4, 1, CAST(N'2017-08-13 11:33:02.587' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, 4, 1, CAST(N'2017-08-14 20:14:24.617' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 4, 1, CAST(N'2017-08-23 19:19:31.130' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (22, 4, 1, CAST(N'2017-09-07 22:13:31.023' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXEspecialidade] ([idUsuario], [idEspecialidade], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (30, 4, 1, CAST(N'2017-11-20 13:22:08.820' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (9, N'054b0932-65c3-4d9d-8b0f-a6c62a2f8e0a')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (10, N'9c80e881-cb3f-4df0-bcc4-05d1d5195122')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (19, N'954b1c39-050f-4947-b26f-09bcf4abb34c')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (20, N'55a3bc79-222a-4925-90bc-110440104767')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (21, N'bf9aef5e-30a3-408a-940a-c3140cec4f98')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (22, N'48495bec-8f2a-4b76-9c5a-5dd0b8114a1b')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (23, N'33aa3834-cb10-4b29-b363-44483ddfc650')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (24, N'01309bbd-0a03-47b1-bdca-f2b18623ef16')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (25, N'18601197-4e4a-40f4-b334-b4394e968758')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (26, N'e4033a4e-b4f3-4348-846a-85d86c35ee76')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (27, N'd32adf41-4208-4113-9274-a49c975a4105')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (29, N'dd3c4034-cef9-47de-b631-5a82e8c1bb05')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (30, N'e06da998-fd0c-43b7-bfc1-7bea6bb3d013')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (31, N'ee397632-e4df-45dd-9ec0-77f72dac74a7')
INSERT [dbo].[UsuarioXMemberShipUser] ([idUsuario], [IdUsrMemberShip]) VALUES (32, N'2068fb54-2f86-411d-b630-999518a65fa5')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (11, 4, 1, CAST(N'2017-08-13 11:33:02.553' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (19, 4, 1, CAST(N'2017-08-14 20:11:47.690' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (20, 4, 1, CAST(N'2017-08-14 20:14:24.593' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (21, 4, 1, CAST(N'2017-08-23 19:19:31.083' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (22, 4, 1, CAST(N'2017-09-07 22:13:30.997' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (24, 4, 1, CAST(N'2017-11-04 15:43:57.553' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (29, 4, 1, CAST(N'2017-11-19 19:16:20.323' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (30, 4, 1, CAST(N'2017-11-20 13:22:08.757' AS DateTime), N'HugoGestor')
INSERT [dbo].[UsuarioXRegiaoAtendimento] ([idUsuario], [idRegiaoAtendimento], [ativo], [dataRegistro], [usuarioRegistro]) VALUES (31, 4, 1, CAST(N'2017-11-20 13:26:04.767' AS DateTime), N'HugoGestor')
/****** Object:  Index [PK__aspnet_A__C93A4C98FA97A5F4]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4929A2310]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__30910331DC2B9806]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D11D26AF6]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC589A139675]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC060CE537BD]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 20/11/2017 21:03:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B335C5B7B]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D26A06922]    Script Date: 20/11/2017 21:03:04 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 20/11/2017 21:03:04 ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 20/11/2017 21:03:04 ******/
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
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Chamado] FOREIGN KEY([idChamado])
REFERENCES [dbo].[Chamado] ([idChamado])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Chamado]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Cliente]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Empresa]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_RegiaoDeAtendimento] FOREIGN KEY([idRegiaoAtendimento])
REFERENCES [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_RegiaoDeAtendimento]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Tecnico] FOREIGN KEY([idTecnico])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Tecnico]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Chamado1] FOREIGN KEY([idChamado])
REFERENCES [dbo].[Chamado] ([idChamado])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Chamado1]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Empresa]
GO
ALTER TABLE [dbo].[AvaliacaoSolucao]  WITH CHECK ADD  CONSTRAINT [FK_AvaliacaoSolucao_Chamado] FOREIGN KEY([idChamado])
REFERENCES [dbo].[Chamado] ([idChamado])
GO
ALTER TABLE [dbo].[AvaliacaoSolucao] CHECK CONSTRAINT [FK_AvaliacaoSolucao_Chamado]
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_Empresa]
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_PrioridadeChamado] FOREIGN KEY([idPrioridade])
REFERENCES [dbo].[PrioridadeChamado] ([idPrioridade])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_PrioridadeChamado]
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_Servico] FOREIGN KEY([idServico])
REFERENCES [dbo].[Servico] ([idServico])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_Servico]
GO
ALTER TABLE [dbo].[Chamado]  WITH CHECK ADD  CONSTRAINT [FK_Chamado_StatusChamado] FOREIGN KEY([idStatusChamado])
REFERENCES [dbo].[StatusChamado] ([idStatusChamado])
GO
ALTER TABLE [dbo].[Chamado] CHECK CONSTRAINT [FK_Chamado_StatusChamado]
GO
ALTER TABLE [dbo].[ClienteFisico]  WITH CHECK ADD  CONSTRAINT [FK_ClienteFisico_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[ClienteFisico] CHECK CONSTRAINT [FK_ClienteFisico_Usuario]
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
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Func_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Func_Usuario]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Funcionario_Disponibilidade] FOREIGN KEY([idDisponibilidade])
REFERENCES [dbo].[StatusDisponibilidade] ([idDisponibilidade])
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_Disponibilidade]
GO
ALTER TABLE [dbo].[MensagemXChatPrivado]  WITH CHECK ADD  CONSTRAINT [FK_MensagemXChatPrivado_ChatPrivado] FOREIGN KEY([idChatPrivado])
REFERENCES [dbo].[ChatPrivado] ([idChatPrivado])
GO
ALTER TABLE [dbo].[MensagemXChatPrivado] CHECK CONSTRAINT [FK_MensagemXChatPrivado_ChatPrivado]
GO
ALTER TABLE [dbo].[MensagemXChatPrivado]  WITH CHECK ADD  CONSTRAINT [FK_MensagemXChatPrivado_Mensagem] FOREIGN KEY([idChat])
REFERENCES [dbo].[Mensagem] ([idChat])
GO
ALTER TABLE [dbo].[MensagemXChatPrivado] CHECK CONSTRAINT [FK_MensagemXChatPrivado_Mensagem]
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
ALTER TABLE [dbo].[RecusaAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_RecusaAtendimento_Chamado] FOREIGN KEY([idChamado])
REFERENCES [dbo].[Chamado] ([idChamado])
GO
ALTER TABLE [dbo].[RecusaAtendimento] CHECK CONSTRAINT [FK_RecusaAtendimento_Chamado]
GO
ALTER TABLE [dbo].[RecusaAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_RecusaAtendimento_Usuario] FOREIGN KEY([idTecnico])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[RecusaAtendimento] CHECK CONSTRAINT [FK_RecusaAtendimento_Usuario]
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
ALTER TABLE [dbo].[TipoServico]  WITH CHECK ADD  CONSTRAINT [FK_TipoServico_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[TipoServico] CHECK CONSTRAINT [FK_TipoServico_Empresa]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_StatusUsuario] FOREIGN KEY([idStatusUsuario])
REFERENCES [dbo].[StatusUsuario] ([idStatusUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_StatusUsuario]
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXEspecialidade_Especialidade] FOREIGN KEY([idEspecialidade])
REFERENCES [dbo].[Especialidade] ([idEspecialidade])
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade] CHECK CONSTRAINT [FK_UsuarioXEspecialidade_Especialidade]
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXEspecialidade_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuarioXEspecialidade] CHECK CONSTRAINT [FK_UsuarioXEspecialidade_Usuario]
GO
ALTER TABLE [dbo].[UsuarioXMemberShipUser]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXMemberShipUser_aspnet_Membership] FOREIGN KEY([IdUsrMemberShip])
REFERENCES [dbo].[aspnet_Membership] ([UserId])
GO
ALTER TABLE [dbo].[UsuarioXMemberShipUser] CHECK CONSTRAINT [FK_UsuarioXMemberShipUser_aspnet_Membership]
GO
ALTER TABLE [dbo].[UsuarioXMemberShipUser]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXMemberShipUser_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuarioXMemberShipUser] CHECK CONSTRAINT [FK_UsuarioXMemberShipUser_Usuario]
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXRegiaoAtendimento_RegiaoDeAtendimento] FOREIGN KEY([idRegiaoAtendimento])
REFERENCES [dbo].[RegiaoDeAtendimento] ([idRegiaoAtendimento])
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento] CHECK CONSTRAINT [FK_UsuarioXRegiaoAtendimento_RegiaoDeAtendimento]
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXRegiaoAtendimento_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuarioXRegiaoAtendimento] CHECK CONSTRAINT [FK_UsuarioXRegiaoAtendimento_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 20/11/2017 21:03:04 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 20/11/2017 21:03:04 ******/
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
ALTER DATABASE [SAS] SET  READ_WRITE 
GO

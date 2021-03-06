USE [master]
GO
/****** Object:  Database [coop]    Script Date: 2/18/2015 11:16:44 AM ******/
CREATE DATABASE [coop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [coop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [coop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [coop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [coop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [coop] SET ARITHABORT OFF 
GO
ALTER DATABASE [coop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [coop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [coop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [coop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [coop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [coop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [coop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [coop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [coop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [coop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [coop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [coop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [coop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [coop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [coop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [coop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [coop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [coop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [coop] SET RECOVERY FULL 
GO
ALTER DATABASE [coop] SET  MULTI_USER 
GO
ALTER DATABASE [coop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [coop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [coop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [coop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'coop', N'ON'
GO
USE [coop]
GO
/****** Object:  StoredProcedure [dbo].[Sp_StudentEvalForm]    Script Date: 2/18/2015 11:16:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_StudentEvalForm]
(
	@Id int=0 output,
	@StudentName varchar(50),
	@StudentId int,
	@Organization varchar(50),
	@JobTitle varchar(50),
	@Term varchar(50),
	@Year int,
	@InterestInWork nvarchar(50),
	@AbilityToLearn nvarchar(50),
	@QualityofWork nvarchar(50),
	@ProblemSolving nvarchar(50),
	@TeamWork nvarchar(50),
	@Dependability nvarchar(50),
	@ResponseToSupervision nvarchar(50),
	@Reflection nvarchar(50),
	@Resoursefulness nvarchar(50),
	@EthicalBehaviour nvarchar(50),
	@AppreciationofDiversity nvarchar(50),
	@EnterpreneurialOrientation nvarchar(50),
	@WrittenCommunication nvarchar(50),
	@OralCommuniation nvarchar(50),
	@InterpersonalCommunication nvarchar(50),
	@OverallPerformanceRating nvarchar(50),
	@SupervisorsComments nvarchar(50)=null,
	@SupervisorsRecommendations nvarchar(50)=null,
	@NextWorkTerm varchar(50)=null,
	@OfferNextWorkTerm varchar(50)=null,
	@OfferStatus varchar(50)=null,
	@NextWorkTermFrom date=null,
	@NextWorkTermTo date=null,
	@SupervisorsName varchar(50),
	@SupervisorsTitle varchar(50),
	@Currentdate date,
	@ManagerName varchar(50)=null,
	@Type char(2)=null
)
as
	begin
		if(@Type='I')
			begin
				insert into tbl_StudnetEvalForm(StudentName,StudentId,Organization,JobTitle,Term,year,InterestInWork,AbilityToLearn,QualityofWork,
							ProblemSolving,TeamWork,Dependability,ResponseToSupervision,Reflection,Resoursefulness,EthicalBehaviour,
							AppreciationofDiversity,EnterpreneurialOrientation,WrittenCommunication,OralCommuniation,InterpersonalCommunication,
							OverallPerformanceRating,SupervisorsComments,SupervisorsRecommendations,NextWorkTerm,OfferNextWorkTerm,
							OfferStatus,NextWorkTermFrom,NextWorkTermTo,SupervisorsName,SupervisorsTitle,Currentdate,ManagerName)
							values(@StudentName,@StudentId,@Organization,@JobTitle,@Term,@year,@InterestInWork,@AbilityToLearn,@QualityofWork,
							@ProblemSolving,@TeamWork,@Dependability,@ResponseToSupervision,@Reflection,@Resoursefulness,@EthicalBehaviour,
							@AppreciationofDiversity,@EnterpreneurialOrientation,@WrittenCommunication,@OralCommuniation,@InterpersonalCommunication,
							@OverallPerformanceRating,@SupervisorsComments,@SupervisorsRecommendations,@NextWorkTerm,@OfferNextWorkTerm,
							@OfferStatus,@NextWorkTermFrom,@NextWorkTermTo,@SupervisorsName,@SupervisorsTitle,@Currentdate,@ManagerName)
			end
	end
	begin
		if(@Type='A')
			begin
				select * from tbl_StudnetEvalForm
			end
	end
	begin
		if(@Type='S')
			begin
				select * from tbl_StudnetEvalForm where StudentId=@StudentId
			end
	end

GO
/****** Object:  Table [dbo].[tbl_StudnetEvalForm]    Script Date: 2/18/2015 11:16:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudnetEvalForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[Term] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[InterestInWork] [nvarchar](50) NOT NULL,
	[AbilityToLearn] [nvarchar](50) NOT NULL,
	[QualityofWork] [nvarchar](50) NOT NULL,
	[ProblemSolving] [nvarchar](50) NOT NULL,
	[TeamWork] [nvarchar](50) NOT NULL,
	[Dependability] [nvarchar](50) NOT NULL,
	[ResponseToSupervision] [nvarchar](50) NOT NULL,
	[Reflection] [nvarchar](50) NOT NULL,
	[Resoursefulness] [nvarchar](50) NOT NULL,
	[EthicalBehaviour] [nvarchar](50) NOT NULL,
	[AppreciationofDiversity] [nvarchar](50) NOT NULL,
	[EnterpreneurialOrientation] [nvarchar](50) NOT NULL,
	[WrittenCommunication] [nvarchar](50) NOT NULL,
	[OralCommuniation] [nvarchar](50) NOT NULL,
	[InterpersonalCommunication] [nvarchar](50) NOT NULL,
	[OverallPerformanceRating] [nvarchar](50) NOT NULL,
	[SupervisorsComments] [nvarchar](50) NULL,
	[SupervisorsRecommendations] [nvarchar](50) NULL,
	[NextWorkTerm] [varchar](50) NULL,
	[OfferNextWorkTerm] [varchar](50) NULL,
	[OfferStatus] [varchar](50) NULL,
	[NextWorkTermFrom] [date] NULL,
	[NextWorkTermTo] [date] NOT NULL,
	[SupervisorsName] [varchar](50) NOT NULL,
	[SupervisorsTitle] [nvarchar](50) NOT NULL,
	[Currentdate] [date] NOT NULL,
	[ManagerName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [coop] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [cs6232-g2]    Script Date: 4/26/2019 9:29:52 PM ******/
CREATE DATABASE [cs6232-g2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'healthcare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\healthcare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'healthcare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\healthcare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cs6232-g2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cs6232-g2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cs6232-g2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cs6232-g2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cs6232-g2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cs6232-g2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cs6232-g2] SET ARITHABORT OFF 
GO
ALTER DATABASE [cs6232-g2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cs6232-g2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cs6232-g2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cs6232-g2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cs6232-g2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cs6232-g2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cs6232-g2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cs6232-g2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cs6232-g2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cs6232-g2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cs6232-g2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cs6232-g2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cs6232-g2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cs6232-g2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cs6232-g2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cs6232-g2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cs6232-g2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cs6232-g2] SET RECOVERY FULL 
GO
ALTER DATABASE [cs6232-g2] SET  MULTI_USER 
GO
ALTER DATABASE [cs6232-g2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cs6232-g2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cs6232-g2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cs6232-g2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cs6232-g2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cs6232-g2] SET QUERY_STORE = OFF
GO
USE [cs6232-g2]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appointmentID] [int] IDENTITY(1,1) NOT NULL,
	[patientID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
	[dateTime] [smalldatetime] NOT NULL,
	[reasonForVisit] [varchar](50) NOT NULL,
 CONSTRAINT [PK_appointment] PRIMARY KEY CLUSTERED 
(
	[appointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diagnosis]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosis](
	[diagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[visitID] [int] NOT NULL,
	[initialDiagnosis] [varchar](50) NOT NULL,
	[finalDiagnosis] [varchar](50) NULL,
 CONSTRAINT [PK_diagnosis] PRIMARY KEY CLUSTERED 
(
	[diagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[doctorID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NOT NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[personID] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](250) NOT NULL,
 CONSTRAINT [PK_personID] PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nurse]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nurse](
	[nurseID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NOT NULL,
	[active_status] [bit] NULL,
 CONSTRAINT [PK_nurse] PRIMARY KEY CLUSTERED 
(
	[nurseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patientID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NOT NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[streetAddress] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[stateCode] [varchar](2) NOT NULL,
	[zipCode] [int] NOT NULL,
	[phoneNumber] [char](14) NOT NULL,
	[ssn] [char](14) NOT NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialty]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialty](
	[specialtyName] [varchar](50) NOT NULL,
	[doctorID] [int] NOT NULL,
	[specialtyDescription] [varchar](150) NOT NULL,
 CONSTRAINT [PK_specialty] PRIMARY KEY CLUSTERED 
(
	[specialtyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[stateCode] [varchar](2) NOT NULL,
	[stateName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[stateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[testCode] [varchar](50) NOT NULL,
	[testName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[testCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testResult]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testResult](
	[visitID] [int] NOT NULL,
	[testCode] [varchar](50) NOT NULL,
	[testDate] [smalldatetime] NOT NULL,
	[results] [varchar](50) NULL,
	[normal] [bit] NULL,
	[performDate] [smalldatetime] NULL,
 CONSTRAINT [PK_testResults] PRIMARY KEY CLUSTERED 
(
	[visitID] ASC,
	[testCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visit]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit](
	[visitID] [int] IDENTITY(1,1) NOT NULL,
	[nurseID] [int] NOT NULL,
	[appointmentID] [int] NOT NULL,
	[weight] [decimal](3, 0) NOT NULL,
	[systolicBP] [int] NOT NULL,
	[diastolicBP] [int] NOT NULL,
	[temp] [decimal](4, 1) NOT NULL,
	[pulse] [int] NOT NULL,
	[symptoms] [varchar](250) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_visit] PRIMARY KEY CLUSTERED 
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminID], [personID]) VALUES (2, 4)
INSERT [dbo].[admin] ([adminID], [personID]) VALUES (1, 6)
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (1, 5, 3, CAST(N'2018-11-05T09:00:00' AS SmallDateTime), N'Yearly physical')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (2, 16, 1, CAST(N'2018-11-12T11:45:00' AS SmallDateTime), N'Pain when urinating')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (3, 5, 3, CAST(N'2018-11-15T09:30:00' AS SmallDateTime), N'Nausea and vomitting')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (4, 32, 5, CAST(N'2018-11-05T10:30:00' AS SmallDateTime), N'Wrist pain after fall')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (5, 18, 5, CAST(N'2018-11-05T10:00:00' AS SmallDateTime), N'Reoccurant migraines')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (6, 5, 3, CAST(N'2018-11-27T14:15:00' AS SmallDateTime), N'Missed period')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (7, 16, 3, CAST(N'2018-11-27T14:45:00' AS SmallDateTime), N'Refill on medication')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (11, 28, 4, CAST(N'2018-11-05T14:30:00' AS SmallDateTime), N'Abdomincal Pain')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (12, 13, 2, CAST(N'2018-11-05T09:00:00' AS SmallDateTime), N'Chest Pain')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (13, 22, 2, CAST(N'2018-11-05T10:00:00' AS SmallDateTime), N'Fever and congestion')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (15, 7, 2, CAST(N'2018-11-05T10:30:00' AS SmallDateTime), N'Ashthma')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (16, 23, 1, CAST(N'2018-11-12T15:30:00' AS SmallDateTime), N'Inability to urinate')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (17, 29, 5, CAST(N'2018-11-12T12:30:00' AS SmallDateTime), N'Pain in lower back')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (18, 31, 3, CAST(N'2018-11-15T10:00:00' AS SmallDateTime), N'Rash')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (19, 13, 2, CAST(N'2018-11-15T15:00:00' AS SmallDateTime), N'Soreness in chest')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (22, 28, 1, CAST(N'2018-11-12T11:00:00' AS SmallDateTime), N'Foul smelling urine')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (23, 31, 4, CAST(N'2018-11-15T15:30:00' AS SmallDateTime), N'Severe bloating')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (24, 5, 3, CAST(N'2018-12-03T12:00:00' AS SmallDateTime), N'Refill of medication')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (26, 14, 5, CAST(N'2018-11-15T16:00:00' AS SmallDateTime), N'Soreness in back')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (27, 12, 2, CAST(N'2018-11-15T14:45:00' AS SmallDateTime), N'Surgical clearance')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (28, 1, 5, CAST(N'2019-04-15T12:30:00' AS SmallDateTime), N'Body aches')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (29, 1, 1, CAST(N'2019-04-17T12:00:00' AS SmallDateTime), N'Vomitting')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (30, 1, 5, CAST(N'2019-04-15T09:00:00' AS SmallDateTime), N'Wrist Pain')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (31, 5, 2, CAST(N'2019-04-20T11:00:00' AS SmallDateTime), N'Feel like death')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (32, 4, 1, CAST(N'2019-05-10T12:00:00' AS SmallDateTime), N'Back Pain')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (33, 3, 4, CAST(N'2019-04-14T11:00:00' AS SmallDateTime), N'Sore throat, cough, runny nose')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (34, 30, 3, CAST(N'2019-03-12T10:00:00' AS SmallDateTime), N'Dry eyes')
INSERT [dbo].[appointment] ([appointmentID], [patientID], [doctorID], [dateTime], [reasonForVisit]) VALUES (35, 1, 2, CAST(N'2019-05-16T14:45:00' AS SmallDateTime), N'Headache')
SET IDENTITY_INSERT [dbo].[appointment] OFF
SET IDENTITY_INSERT [dbo].[diagnosis] ON 

INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (1, 1, N'Premenstrual Syndrom', N'UTI; Pre diabetic')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (2, 3, N'GERD', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (3, 5, N'Influenza A', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (4, 6, N'Migraine', N'Hypothyroidism')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (5, 7, N'Allergic Asthma', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (6, 8, N'Fracture of right wrist', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (7, 9, N'Viral Gastroenteritis', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (8, 10, N'Urinary Tract Infection', N'Kidney Infection')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (9, 11, N'Kidney Stone', N'Kidney Disease')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (10, 12, N'Muscle Strain', N'UTI')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (11, 14, N'Urinary Retention', N'Diabetes')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (12, 15, N'Food Poisoning', N'Viral Gastroenteritis')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (14, 16, N'Contact Dermatitis', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (16, 17, N'Normal physical findings', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (17, 19, N'Pneumonia', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (18, 21, N'Irritable Bowel Syndrome', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (19, 22, N'Sciatica', NULL)
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (20, 24, N'Pregnancy', N'1st Trimester Pregnancy')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (21, 28, N'Sick', N'')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (22, 29, N'Migraine', N'Hypoglycemia, Hypothyroidism')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (23, 30, N'Edema', N'')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (24, 31, N'Allergic Rhinitis', N'')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (25, 32, N'Allergic conjunctivitis', N'')
INSERT [dbo].[diagnosis] ([diagnosisID], [visitID], [initialDiagnosis], [finalDiagnosis]) VALUES (26, 33, N'Migraines', N'')
SET IDENTITY_INSERT [dbo].[diagnosis] OFF
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([doctorID], [personID]) VALUES (5, 22)
INSERT [dbo].[doctor] ([doctorID], [personID]) VALUES (4, 27)
INSERT [dbo].[doctor] ([doctorID], [personID]) VALUES (1, 65)
INSERT [dbo].[doctor] ([doctorID], [personID]) VALUES (2, 68)
INSERT [dbo].[doctor] ([doctorID], [personID]) VALUES (3, 69)
SET IDENTITY_INSERT [dbo].[doctor] OFF
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (3, N'emurphy', N'1BF6CAD62878AA11D07C9BE0E33432F96F9FA00840EC2B3BF0859DE5882C1EDC')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (4, N'mavery', N'BE8CE80E886D002DFFA339E27E20EF580556D7AB42C82BD8F20F19AC06198086')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (6, N'scox', N'4AB2BE5DAB2C8EA0F42D6935A87E45F2E51A15F5850AFD637392DD3CB9CAB6FC')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (7, N'dsoria', N'67B34906C9835802F40FAABDBDD5215D90D719E9248D8AB2C49EAD4C606D2ED1')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (23, N'lbrown', N'A944719C3DBB88B98704838FFCC7337A399EF7F1179EF99635B1DDFA3D6D1ED1')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (28, N'mstowe', N'1966A0867B16BD9FB218FEC832D9F1A4195DAD596122A4B9D823D744431A1704')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (67, N'jblass', N'B30E3044F1C3BFD317777A6BFE7316CB8E07E3D0E845FAD9DF60896BED1A9F5A')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (73, N'scraig', N'33317FF5C9B7A40EEF194E881EA9BAB5311F50258681B266C347A805E5AD2B21')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (77, N'abell', N'A47F22C7E5389F54FBAA4585DF6216C7783D3B4274F5729221EAFB114123B16C')
INSERT [dbo].[login] ([personID], [userName], [password]) VALUES (101, N'bsue', N'59341974489400cdb0c4ad88553c1204c0c6b933aded89be2e52125a8c59629f')
SET IDENTITY_INSERT [dbo].[nurse] ON 

INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (1, 3, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (2, 7, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (3, 23, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (4, 28, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (5, 67, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (6, 73, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (7, 77, 1)
INSERT [dbo].[nurse] ([nurseID], [personID], [active_status]) VALUES (28, 101, 1)
SET IDENTITY_INSERT [dbo].[nurse] OFF
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([patientID], [personID]) VALUES (1, 1)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (2, 2)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (3, 5)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (4, 8)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (5, 9)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (6, 10)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (7, 11)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (8, 12)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (9, 13)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (10, 14)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (11, 15)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (12, 16)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (13, 17)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (14, 18)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (15, 19)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (16, 20)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (17, 21)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (18, 24)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (19, 29)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (20, 30)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (21, 31)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (22, 32)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (23, 63)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (24, 64)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (25, 66)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (26, 70)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (27, 71)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (28, 72)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (29, 74)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (30, 75)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (31, 76)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (32, 78)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (33, 79)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (34, 80)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (35, 102)
INSERT [dbo].[patient] ([patientID], [personID]) VALUES (36, 103)
SET IDENTITY_INSERT [dbo].[patient] OFF
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (1, N'Collins', N'Stuart', CAST(N'1972-06-01' AS Date), N'397 Clement Street', N'Atlanta', N'GA', 30303, N'404-432-8902  ', N'111-11-1111   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (2, N'Springer', N'Franklin', CAST(N'1977-08-15' AS Date), N'110 Austin Avenue', N'Waycross', N'GA', 31503, N'912-614-7643  ', N'673-26-2722   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (3, N'Murphy', N'Eva', CAST(N'1964-05-12' AS Date), N'4310 Riverside Drive', N'Athens', N'GA', 30606, N'706-818-5094  ', N'668-28-4151   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (4, N'Avery', N'Melvin', CAST(N'1969-04-14' AS Date), N'561 Pursglove Court', N'Eupora', N'MS', 39744, N'662-552-3232  ', N'427-46-7066   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (5, N'Race', N'Elise', CAST(N'1969-04-14' AS Date), N'4243 Java Lane', N'Bath', N'SC', 29816, N'843-607-4229  ', N'249-73-4253   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (6, N'Cox', N'Sandra', CAST(N'1983-12-06' AS Date), N'3586 Heritage Road', N'Fresno', N'CA', 93711, N'559-769-6309  ', N'623-47-4809   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (7, N'Soria', N'Dianne', CAST(N'1979-07-26' AS Date), N'2902 Lonely Oak Drive', N'Mobile', N'AL', 36607, N'256-559-9005  ', N'420-21-1716   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (8, N'Chung', N'Gary', CAST(N'1961-02-10' AS Date), N'1838 Joyce Street', N'Monroeville', N'AL', 36460, N'334-350-1887  ', N'422-35-1877   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (9, N'Flynn', N'Josephine ', CAST(N'1974-04-29' AS Date), N'4124 Ferry Street', N'Huntsville', N'AL', 35802, N'256-509-1861  ', N'123-11-1111   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (10, N'Thompson', N'Carmen', CAST(N'1984-03-05' AS Date), N'610 Sycamore Fork Road', N'Boca Raton', N'FL', 33486, N'561-245-6089  ', N'591-96-1068   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (11, N'Crosby', N'Juan', CAST(N'1984-03-05' AS Date), N'14 Locust Street', N'Albany', N'FL', 31701, N'229-879-4329  ', N'256-88-0844   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (12, N'Fay', N'Becky', CAST(N'1995-07-11' AS Date), N'4329 Lilac Lane', N'Douglas', N'GA', 31533, N'912-501-7554  ', N'669-30-5303   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (13, N'Hammond', N'Janet', CAST(N'1992-05-15' AS Date), N'3338 Junior Avenue', N'Roswell', N'GA', 30076, N'404-587-0658  ', N'254-94-6560   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (14, N'Shropshire', N'Dan', CAST(N'1992-03-19' AS Date), N'2604 Kuhl Avenue', N'Alpharetta', N'GA', 30201, N'678-624-1513  ', N'253-86-8356   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (15, N'Hecht', N'Charles ', CAST(N'1971-12-21' AS Date), N'4209 Findley Avenue', N'Adams', N'ND', 58210, N'701-944-9801  ', N'501-14-0051   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (16, N'Bryant', N'Lela', CAST(N'1965-03-12' AS Date), N'4174 Maryland Avenue', N'Tampa', N'FL', 33610, N'727-580-8837  ', N'590-21-6039   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (17, N'Johnson', N'Darin', CAST(N'1958-09-13' AS Date), N'2843 Bates Brothers Road', N'Columbus', N'OH', 43215, N'614-306-9538  ', N'277-86-5674   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (18, N'Kidd', N'Jamie', CAST(N'1969-01-09' AS Date), N'3788 Riverside Drive', N'Dial', N'GA', 30513, N'912-571-3818  ', N'674-20-1674   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (19, N'Gonzalez', N'Bradley ', CAST(N'1983-04-08' AS Date), N'1969 Yorkie Lane', N'Savannah', N'GA', 31401, N'912-844-3870  ', N'670-07-5144   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (20, N'Oconnell', N'Jason', CAST(N'1961-10-27' AS Date), N'671 Hart Country Lane', N'Atlanta', N'GA', 30303, N'706-530-3220  ', N'254-42-4305   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (21, N'Donohue', N'Claudette', CAST(N'1976-01-01' AS Date), N'2962 Pine Garden Lane', N'Lilburn', N'GA', 30247, N'770-717-4716  ', N'673-12-7736   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (22, N'Lavin', N'Jennifer', CAST(N'1962-12-13' AS Date), N'1119 Smith Road', N'Duluth', N'GA', 30097, N'706-302-2652  ', N'256-17-5144   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (23, N'Brown', N'Leslie', CAST(N'1987-06-23' AS Date), N'1485 Neuport Lane', N'Conyers', N'GA', 30207, N'678-508-6317  ', N'260-10-0354   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (24, N'Moss', N'Vickie', CAST(N'1991-08-24' AS Date), N'4353 Chardonnay Drive', N'Roswell', N'GA', 30076, N'404-456-6553  ', N'671-20-1660   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (25, N'Erickson', N'Mary   ', CAST(N'1983-12-23' AS Date), N'3857 Fowler Avenue', N'Chamblee', N'GA', 30341, N'770-216-3131  ', N'260-89-8971   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (26, N'Berger', N'Penny', CAST(N'1968-05-07' AS Date), N'1766 Smith Road', N'Austell', N'GA', 30001, N'770-315-0511  ', N'675-24-7325   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (27, N'Halbert', N'William', CAST(N'1970-10-08' AS Date), N'1923 Flint Street', N'Atlanta', N'GA', 30303, N'404-481-5263  ', N'252-70-3861   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (28, N'Stowe', N'Marion', CAST(N'1977-08-20' AS Date), N'1272 Pine Garden Lane', N'Atlanta', N'GA', 30303, N'404-788-0223  ', N'255-16-3002   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (29, N'Dowdell', N'Ethan', CAST(N'1994-04-18' AS Date), N'4555 Limer Street', N'Atlanta', N'GA', 30308, N'770-318-0264  ', N'	672-24-6366  ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (30, N'Carrillo', N'Grade', CAST(N'1977-03-05' AS Date), N'3504 Graystone Lakes', N'Macon', N'GA', 31210, N'478-808-7005  ', N'260-62-1855   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (31, N'McCauley', N'Emily', CAST(N'1976-10-15' AS Date), N'4999 Ruckman Road', N'Beltsville', N'MD', 20705, N'301-379-2763  ', N'212-24-6430   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (32, N'Rhoades', N'Raymond', CAST(N'1973-09-10' AS Date), N'3316 Park Boulevard', N'Bristow', N'IA', 50611, N'641-344-7172  ', N'480-36-4702   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (63, N'Hackler', N'Elvis', CAST(N'1961-11-27' AS Date), N'2316 Sweetwood Drive', N'Westminster', N'CO', 80030, N'970-545-6738  ', N'521-39-7668   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (64, N'Rowe', N'Michael', CAST(N'1961-10-27' AS Date), N'671 Hart Country Lane', N'Cresson', N'TX', 76035, N'915-726-5994  ', N'641-96-2809   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (65, N'Gadd', N'Edwin', CAST(N'1967-05-06' AS Date), N'1446 Radio Park Drive', N'Atlanta', N'GA', 30907, N'706-394-2884  ', N'672-07-1807   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (66, N'Evans', N'Angela', CAST(N'1998-09-17' AS Date), N'3429 Oakridge Lane', N'Talbotton', N'GA', 31827, N'706-315-3343  ', N'671-22-2605   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (67, N'Blasingame', N'John', CAST(N'1987-05-14' AS Date), N'4989 Musgrave Street', N'Atlanta', N'GA', 30303, N'404-961-9865  ', N'670-26-1267   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (68, N'Croom', N'Ryan', CAST(N'1975-06-13' AS Date), N'4146 Layman Court', N'Smyrna', N'GA', 30082, N'678-313-8074  ', N'254-54-4848   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (69, N'Goodwin', N'Sara', CAST(N'1973-05-17' AS Date), N'2273 Mount Olive Road', N'Smyrna', N'GA', 30082, N'706-530-3220  ', N'667-03-6563   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (70, N'Ward', N'Florence', CAST(N'1968-10-12' AS Date), N'316 Austin Avenue', N'Atlanta', N'GA', 30303, N'706-530-3220  ', N'254-42-4300   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (71, N'Odonnel', N'Jackson', CAST(N'1961-10-27' AS Date), N'605 Buddy Lane', N'Newnan', N'GA', 30263, N'678-877-4321  ', N'600-51-2345   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (72, N'Samuelson', N'Tammy', CAST(N'1969-07-30' AS Date), N'2692 Harry Place', N'Charlotte', N'NC', 28202, N'704-727-5784  ', N'243-64-5508   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (73, N'Craig', N'Salvatore', CAST(N'1986-02-18' AS Date), N'241 George Avenue', N'Citronelle', N'AL', 36522, N'205-200-1612  ', N'421-38-1326   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (74, N'Busby', N'Gladys', CAST(N'1995-02-14' AS Date), N'1749 Science Center Drive', N'Mccall', N'ID', 83638, N'208-491-3713  ', N'519-12-6466   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (75, N'Sanchez', N'Tamela', CAST(N'1987-03-14' AS Date), N'4953 My Drive', N'Brooklyn', N'NY', 11206, N'718-938-1586  ', N'126-24-6364   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (76, N'Wright', N'Andrew ', CAST(N'1973-09-18' AS Date), N'749 Despard Street', N'Atlanta', N'GA', 30309, N'04-953-0278   ', N'673-24-0543   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (77, N'Bell', N'Ashley', CAST(N'1985-10-08' AS Date), N'2399 Adonais Way', N'Norcross', N'GA', 30071, N'678-914-1393  ', N'671-03-3354   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (78, N'Voorhees', N'Jason  ', CAST(N'1998-07-27' AS Date), N'731 Willison Street', N'Minneapolis', N'MN', 55406, N'612-849-3040  ', N'475-22-1660   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (79, N'Levering', N'Dwight', CAST(N'1999-04-18' AS Date), N'994 Stonepot Road', N'Newark', N'NJ', 7102, N'862-755-3454  ', N'150-09-0784   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (80, N'Clausen', N'Laura ', CAST(N'1998-08-04' AS Date), N'192 Moore Avenue', N'Roanoke', N'TX', 76262, N'361-254-1163  ', N'460-03-4038   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (101, N'Sue', N'Betty', CAST(N'1998-08-13' AS Date), N'66 Ashmead Road', N'Carrollton', N'GA', 30117, N'678-877-6786  ', N'546-23-4223   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (102, N'Ringo', N'Bob', CAST(N'2019-03-31' AS Date), N'55 Ronald Way', N'Newnan', N'CO', 12312, N'342-432-4323  ', N'423-42-4242   ')
INSERT [dbo].[person] ([personID], [lastName], [firstName], [dateOfBirth], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [ssn]) VALUES (103, N'Jones', N'Linda', CAST(N'2019-04-26' AS Date), N'123 Baby Street', N'Sargent', N'GA', 12312, N'212-312-3131  ', N'232-23-1313   ')
SET IDENTITY_INSERT [dbo].[person] OFF
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Cardiologist', 2, N'Diagnoses and treats diseases of the cardiovasular system.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Gastroenterologist', 4, N'Diagnoses and treats diseases of the digestive system.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Nephrologists ', 1, N'Diagnoses and treats diseases conditions of the kidneys and urinary system.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Neurologist', 5, N'Diagnoses and treats diseases and injuries of the brain, spinal cord, and nervous system diseases.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Obstetrician-Gynocologist', 3, N'Monitors patient through pregnancy, childbirth, and a overall reproductive health.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Orthopedist', 5, N'Corrects congenital or functional abnormalities of the bones with surgery, casting, and bracing.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Primary Care Physician', 3, N'Provides continual care and maintenance of patient health.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Pulmonologist', 2, N'Diagnoses and treats diseases and injuries of the lungs.')
INSERT [dbo].[specialty] ([specialtyName], [doctorID], [specialtyDescription]) VALUES (N'Urologist ', 1, N'Diagnoses and treats diseases conditions of the urinary system and the male reproductive system.')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AK', N'Alaska')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AL', N'Alabama')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AR', N'Arkansas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AZ', N'Arizona')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CA', N'California')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CO', N'Colorado')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CT', N'Connecticut')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'DE', N'Deleware')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'FL', N'Florida')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'GA', N'Georgia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'HI', N'Hawaii')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IA', N'Iowa')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ID', N'Idaho')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IL', N'Illinois')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IN', N'Indiana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'KS', N'Kansas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'KY', N'Kentucky')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'LA', N'Louisiana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MA', N'Massachusetts')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MD', N'Maryland')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ME', N'Maine')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MI', N'Michigan')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MN', N'Minnesota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MO', N'Missouri')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MS', N'Mississippi')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MT', N'Montana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NC', N'North Carolina')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ND', N'North Dakota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NE', N'Nebraska')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NH', N'New Hampshire')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NJ', N'New Jersey')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NM', N'New Mexico')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NV', N'Nevada')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NY', N'New York')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OH', N'Ohio')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OK', N'Oklahoma')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OR', N'Oregon')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'PA', N'Pennsylvania')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'RI', N'Rhode Island')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'SC', N'South Carolina')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'SD', N'South Dakota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'TN', N'Tennessee')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'TX', N'Texas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'UT', N'Utah')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'VA', N'Virginia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'VT', N'Vermont')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WA', N'Washington')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WI', N'Wisconsin')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WV', N'West Virgina')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WY', N'Wyoming')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'CMP', N'Comprehensive Metabolic Panel')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'Cr', N'Creatinine')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'hA1C', N'Hemoglobin A1C')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'hCG', N'Urine Pregnancy Test')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'hepA', N'Hepatitis A')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'hepB', N'Hepatitis B')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'LDL', N'Low Density Lipoproteins')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'TSH', N'Thyroid Stimulating Hormone')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'UA', N'Urinalysis')
INSERT [dbo].[test] ([testCode], [testName]) VALUES (N'WBC', N'White Blood Cell Count')
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (1, N'CMP', CAST(N'2018-11-05T09:00:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (1, N'hA1C', CAST(N'2018-11-05T17:42:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (1, N'hCG', CAST(N'2018-11-05T09:15:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (1, N'UA', CAST(N'2018-11-05T17:42:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (6, N'TSH', CAST(N'2018-11-08T10:30:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (7, N'CMP', CAST(N'2019-01-02T19:07:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (7, N'TSH', CAST(N'2019-01-02T19:07:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (7, N'WBC', CAST(N'2019-01-02T19:07:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (10, N'UA', CAST(N'2018-11-06T12:00:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (11, N'Cr', CAST(N'2018-11-13T11:35:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (11, N'UA', CAST(N'2018-11-13T11:30:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (12, N'Cr', CAST(N'2019-04-21T19:03:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (12, N'hCG', CAST(N'2019-04-21T19:03:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (12, N'UA', CAST(N'2019-04-21T19:03:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (14, N'hA1C', CAST(N'2018-11-16T09:00:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (15, N'hCG', CAST(N'2019-04-21T17:50:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (21, N'hepA', CAST(N'2018-11-16T14:20:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (24, N'hCG', CAST(N'2018-11-27T15:00:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (28, N'Cr', CAST(N'2019-04-15T22:35:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (29, N'CMP', CAST(N'2019-04-21T17:38:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (29, N'Cr', CAST(N'2019-04-21T17:38:00' AS SmallDateTime), N'abnormal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (29, N'hA1C', CAST(N'2019-04-21T17:38:00' AS SmallDateTime), N'normal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (29, N'LDL', CAST(N'2019-04-21T17:38:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (29, N'TSH', CAST(N'2019-04-21T17:38:00' AS SmallDateTime), N'abnormal', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (31, N'Cr', CAST(N'2019-04-21T17:53:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (31, N'hepA', CAST(N'2019-04-21T17:53:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (31, N'hepB', CAST(N'2019-04-21T17:53:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (31, N'UA', CAST(N'2019-04-21T17:53:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (31, N'WBC', CAST(N'2019-04-21T17:53:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (32, N'TSH', CAST(N'2019-04-21T21:22:00' AS SmallDateTime), N'NORMAL', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'CMP', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'Elevated potassium', 0, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'hA1C', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'hCG', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'negative', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'LDL', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'elevated levels', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'TSH', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'normal', 1, NULL)
INSERT [dbo].[testResult] ([visitID], [testCode], [testDate], [results], [normal], [performDate]) VALUES (33, N'UA', CAST(N'2019-11-15T21:23:00' AS SmallDateTime), N'normal', 1, NULL)
SET IDENTITY_INSERT [dbo].[visit] ON 

INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (1, 1, 1, CAST(118 AS Decimal(3, 0)), 125, 67, CAST(98.6 AS Decimal(4, 1)), 1, N'Increased appetite, nausea, and fatigue ', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (3, 2, 12, CAST(237 AS Decimal(3, 0)), 145, 88, CAST(98.7 AS Decimal(4, 1)), 99, N'Sharp chest pain, 7/10 pain, tingling in arm', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (5, 1, 13, CAST(154 AS Decimal(3, 0)), 130, 77, CAST(102.5 AS Decimal(4, 1)), 105, N'Fever, chills, congestion, headache, insomnia', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (6, 5, 4, CAST(110 AS Decimal(3, 0)), 198, 90, CAST(97.9 AS Decimal(4, 1)), 83, N'10/10 headache, light sensativity, nausea', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (7, 4, 15, CAST(189 AS Decimal(3, 0)), 140, 73, CAST(99.1 AS Decimal(4, 1)), 67, N'Wheezing, shortness of breath, cough', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (8, 2, 4, CAST(202 AS Decimal(3, 0)), 137, 78, CAST(98.0 AS Decimal(4, 1)), 57, N'Unable to bend wrist, pain 9/10, swelling, tender to touch', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (9, 3, 11, CAST(124 AS Decimal(3, 0)), 127, 60, CAST(98.6 AS Decimal(4, 1)), 69, N'Abdominal pain, loose bowel movements', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (10, 1, 22, CAST(178 AS Decimal(3, 0)), 136, 79, CAST(97.8 AS Decimal(4, 1)), 64, N'Painful urination, strong smelling urine', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (11, 5, 2, CAST(120 AS Decimal(3, 0)), 110, 65, CAST(97.5 AS Decimal(4, 1)), 98, N'Blood in urine, inability to evacuate', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (12, 1, 17, CAST(224 AS Decimal(3, 0)), 201, 101, CAST(98.7 AS Decimal(4, 1)), 1, N'Elevated BP, pain in lower back 10/10, numbness/tingling in lower leg', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (14, 6, 16, CAST(171 AS Decimal(3, 0)), 137, 68, CAST(97.7 AS Decimal(4, 1)), 55, N'Inability to evacuate, severe lower abdominal cramping', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (15, 1, 3, CAST(156 AS Decimal(3, 0)), 124, 80, CAST(98.6 AS Decimal(4, 1)), 1, N'Nausea, vomitting, diarrhea, fatigue', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (16, 2, 18, CAST(97 AS Decimal(3, 0)), 115, 66, CAST(97.4 AS Decimal(4, 1)), 57, N'Itchy, skin swelling, patchy rash', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (17, 1, 24, CAST(319 AS Decimal(3, 0)), 180, 90, CAST(98.6 AS Decimal(4, 1)), 99, N'Physical for surgical clearance', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (19, 4, 19, CAST(147 AS Decimal(3, 0)), 132, 76, CAST(98.3 AS Decimal(4, 1)), 67, N'Chest pain, shortness of breath, hurts to breath deep', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (21, 5, 23, CAST(114 AS Decimal(3, 0)), 120, 80, CAST(98.4 AS Decimal(4, 1)), 78, N'Bloating, gas, abdominal pain', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (22, 3, 26, CAST(187 AS Decimal(3, 0)), 145, 89, CAST(97.5 AS Decimal(4, 1)), 53, N'Lower back pain, radiates to leg', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (24, 2, 6, CAST(132 AS Decimal(3, 0)), 110, 78, CAST(98.6 AS Decimal(4, 1)), 100, N'Nausea in morning, tender breast, fatigue, missed period', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (27, 6, 7, CAST(155 AS Decimal(3, 0)), 198, 90, CAST(98.8 AS Decimal(4, 1)), 87, N'Elevated BP. Out of BP medication', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (28, 1, 28, CAST(120 AS Decimal(3, 0)), 120, 80, CAST(98.6 AS Decimal(4, 1)), 1, N'Feelin bad', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (29, 1, 29, CAST(115 AS Decimal(3, 0)), 120, 80, CAST(97.6 AS Decimal(4, 1)), 1, N'Headache, blurred vision', 1)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (30, 1, 31, CAST(167 AS Decimal(3, 0)), 145, 90, CAST(99.5 AS Decimal(4, 1)), 1, N'Feet swelling. ', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (31, 1, 33, CAST(87 AS Decimal(3, 0)), 110, 67, CAST(98.6 AS Decimal(4, 1)), 1, N'Sore throat, cough, runny nose, watering eyes x3 days.', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (32, 1, 34, CAST(187 AS Decimal(3, 0)), 130, 96, CAST(98.5 AS Decimal(4, 1)), 1, N'Red, dry, crusty eyes', 0)
INSERT [dbo].[visit] ([visitID], [nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status]) VALUES (33, 1, 5, CAST(110 AS Decimal(3, 0)), 120, 45, CAST(98.5 AS Decimal(4, 1)), 1, N'Headache, light sensativity', 0)
SET IDENTITY_INSERT [dbo].[visit] OFF
/****** Object:  Index [IX_admin]    Script Date: 4/26/2019 9:29:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_admin] ON [dbo].[admin]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [visitID_diagnosis]    Script Date: 4/26/2019 9:29:52 PM ******/
ALTER TABLE [dbo].[diagnosis] ADD  CONSTRAINT [visitID_diagnosis] UNIQUE NONCLUSTERED 
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_doctor]    Script Date: 4/26/2019 9:29:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_doctor] ON [dbo].[doctor]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_nurse]    Script Date: 4/26/2019 9:29:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_nurse] ON [dbo].[nurse]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_patient]    Script Date: 4/26/2019 9:29:52 PM ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [IX_patient] UNIQUE NONCLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__person__DDDF0AE66554C157]    Script Date: 4/26/2019 9:29:52 PM ******/
ALTER TABLE [dbo].[person] ADD UNIQUE NONCLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_visit]    Script Date: 4/26/2019 9:29:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_visit] ON [dbo].[visit]
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[nurse] ADD  DEFAULT ('TRUE') FOR [active_status]
GO
ALTER TABLE [dbo].[visit] ADD  CONSTRAINT [DF_visit_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD  CONSTRAINT [FK_personID_admin] FOREIGN KEY([personID])
REFERENCES [dbo].[person] ([personID])
GO
ALTER TABLE [dbo].[admin] CHECK CONSTRAINT [FK_personID_admin]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_doctorID_appointment] FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([doctorID])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_doctorID_appointment]
GO
ALTER TABLE [dbo].[diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_visitID_diagnosis] FOREIGN KEY([visitID])
REFERENCES [dbo].[visit] ([visitID])
GO
ALTER TABLE [dbo].[diagnosis] CHECK CONSTRAINT [FK_visitID_diagnosis]
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD  CONSTRAINT [FK_doctor_person] FOREIGN KEY([personID])
REFERENCES [dbo].[person] ([personID])
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK_doctor_person]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_person] FOREIGN KEY([personID])
REFERENCES [dbo].[person] ([personID])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_person]
GO
ALTER TABLE [dbo].[nurse]  WITH CHECK ADD  CONSTRAINT [FK_nurse_login] FOREIGN KEY([personID])
REFERENCES [dbo].[person] ([personID])
GO
ALTER TABLE [dbo].[nurse] CHECK CONSTRAINT [FK_nurse_login]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_person] FOREIGN KEY([personID])
REFERENCES [dbo].[person] ([personID])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_person]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [FK_person_person] FOREIGN KEY([stateCode])
REFERENCES [dbo].[state] ([stateCode])
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [FK_person_person]
GO
ALTER TABLE [dbo].[specialty]  WITH CHECK ADD  CONSTRAINT [FK_doctorID_specialty] FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([doctorID])
GO
ALTER TABLE [dbo].[specialty] CHECK CONSTRAINT [FK_doctorID_specialty]
GO
ALTER TABLE [dbo].[testResult]  WITH CHECK ADD  CONSTRAINT [FK_testCode_testResults] FOREIGN KEY([testCode])
REFERENCES [dbo].[test] ([testCode])
GO
ALTER TABLE [dbo].[testResult] CHECK CONSTRAINT [FK_testCode_testResults]
GO
ALTER TABLE [dbo].[testResult]  WITH CHECK ADD  CONSTRAINT [FK_testResults_visit] FOREIGN KEY([visitID])
REFERENCES [dbo].[visit] ([visitID])
GO
ALTER TABLE [dbo].[testResult] CHECK CONSTRAINT [FK_testResults_visit]
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD  CONSTRAINT [FK_appointmentID_visit] FOREIGN KEY([appointmentID])
REFERENCES [dbo].[appointment] ([appointmentID])
GO
ALTER TABLE [dbo].[visit] CHECK CONSTRAINT [FK_appointmentID_visit]
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD  CONSTRAINT [FK_nuseID_visit] FOREIGN KEY([nurseID])
REFERENCES [dbo].[nurse] ([nurseID])
GO
ALTER TABLE [dbo].[visit] CHECK CONSTRAINT [FK_nuseID_visit]
GO
/****** Object:  StoredProcedure [dbo].[spMostPerformedTests]    Script Date: 4/26/2019 9:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMostPerformedTests] @startDate DateTime, @endDate DateTime
	AS
	BEGIN
	DECLARE @total int;

	SELECT @total = COUNT(*) 
	FROM testResult
	WHERE testDate >= CONVERT(datetime, @startDate) AND testDate <= CONVERT(datetime, @endDate)

	SELECT	dbo.testResult.testCode, dbo.test.testName, 
			COUNT(dbo.testResult.testCode) AS SumOfTests, 
			@total AS TotalTestsPerformed,
			CAST((COUNT(dbo.testResult.testCode))/CAST((@total) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS PercentagePerformed,
			SUM(CASE dbo.testResult.normal WHEN '1' THEN 1 ELSE 0 END) AS Normal_Results,
			SUM(CASE dbo.testResult.normal WHEN '0' THEN 1 ELSE 0 END) AS Abnormal_Results,
			CAST((SUM(CASE WHEN DATEDIFF(year, dbo.person.dateOfBirth, dbo.testResult.testDate) BETWEEN 18 AND 29 THEN 1.0 ELSE 0 END))/SUM(CASE WHEN dbo.testResult.testCode IS NOT NULL THEN 1 ELSE 0 END) AS DECIMAL(10,2)) AS 'eightteentotwentynine',
			CAST((SUM(CASE WHEN DATEDIFF(year, dbo.person.dateOfBirth, dbo.testResult.testDate) BETWEEN 30 AND 39 THEN 1.0 ELSE 0 END))/SUM(CASE WHEN dbo.testResult.testCode IS NOT NULL THEN 1 ELSE 0 END) AS DECIMAL (10,2)) AS 'thirtytothirtynine',
			CAST((SUM(CASE WHEN DATEDIFF(year, dbo.person.dateOfBirth, dbo.testResult.testDate) > 40 THEN 1.0 ELSE 0 END))/SUM(CASE WHEN dbo.testResult.testCode IS NOT NULL THEN 1 ELSE 0 END) AS DECIMAL (10, 2)) AS 'allotheragegroups'
	FROM dbo.person
	JOIN dbo.patient
	ON dbo.patient.personID = dbo.person.personID
	JOIN appointment
	ON dbo.appointment.patientID = dbo.patient.patientID
	JOIN dbo.visit 
	ON dbo.visit.appointmentID =dbo.appointment.appointmentID
	JOIN dbo.testResult
	ON dbo.testResult.visitID = dbo.visit.visitID
	JOIN dbo.test
	ON dbo.test.testCode = dbo.testResult.testCode
	WHERE dbo.testResult.testDate BETWEEN @startDate AND @endDate
	GROUP BY dbo.testResult.testCode, dbo.test.testName
	HAVING COUNT(dbo.testResult.testCode) >= 2
	ORDER BY SumOfTests DESC, dbo.testResult.testCode DESC;
RETURN
END
GO
USE [master]
GO
ALTER DATABASE [cs6232-g2] SET  READ_WRITE 
GO

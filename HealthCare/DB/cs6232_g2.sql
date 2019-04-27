USE [master]
GO
/****** Object:  Database [cs6232-g2]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[admin]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[appointment]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[diagnosis]    Script Date: 4/26/2019 9:15:46 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [visitID_diagnosis] UNIQUE NONCLUSTERED 
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[nurse]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[patient]    Script Date: 4/26/2019 9:15:46 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_patient] UNIQUE NONCLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 4/26/2019 9:15:46 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialty]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[state]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[test]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[testResult]    Script Date: 4/26/2019 9:15:46 PM ******/
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
/****** Object:  Table [dbo].[visit]    Script Date: 4/26/2019 9:15:47 PM ******/
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
/****** Object:  Index [IX_admin]    Script Date: 4/26/2019 9:15:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_admin] ON [dbo].[admin]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_doctor]    Script Date: 4/26/2019 9:15:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_doctor] ON [dbo].[doctor]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_nurse]    Script Date: 4/26/2019 9:15:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_nurse] ON [dbo].[nurse]
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_visit]    Script Date: 4/26/2019 9:15:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMostPerformedTests]    Script Date: 4/26/2019 9:15:47 PM ******/
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
	WHERE testDate >= CONVERT(datetime, @startDate) AND testDate <= CONVERT(datetime, @endDate) AND testCode = testCode

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

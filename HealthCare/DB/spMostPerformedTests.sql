USE [cs6232-g2]
GO
/****** Object:  StoredProcedure [dbo].[spMostPerformedTests]    Script Date: 4/26/2019 8:26:58 PM ******/
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
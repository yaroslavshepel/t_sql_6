use pr6
go

/*1*/
SELECT DISTINCT dp.[Name]
FROM Departments_PR dp
JOIN Departments_PR dc ON dp.[Building] = dc.[Building]
WHERE dc.[Name] = 'Cardiology';

/*2*/
SELECT DISTINCT dp.[Name]
FROM Departments_PR dp
JOIN Departments_PR dg ON dp.[Building] = dg.[Building]
JOIN Departments_PR ds ON dp.[Building] = ds.[Building]
WHERE dg.[Name] = 'Gastroenterology'
AND ds.[Name] = 'General Surgery';

/*3*/
SELECT TOP 1 dp.[Name]
FROM Departments_PR dp
LEFT JOIN Donations_PR d ON dp.Id = d.DepartmentId
GROUP BY dp.Id, dp.[Name]
ORDER BY COUNT(d.Id) ASC;

/*4*/
SELECT [Surname]
FROM Doctors_PR
WHERE [Salary] + [Premium] > (SELECT [Salary] + [Premium] FROM Doctors_PR WHERE [Name] = 'Thomas' AND [Surname] = 'Gerada');

/*5*/
SELECT [Name]
FROM Wards_PR
WHERE [Places] > (SELECT AVG([Places]) FROM Wards_PR WHERE [DepartmentId] = (SELECT Id FROM Departments_PR WHERE [Name] = 'Microbiology'));

/*6*/
SELECT [Doctors_PR].[Name] + ' ' + [Doctors_PR].[Surname] AS 'Full Name'
FROM [Doctors_PR]
WHERE ([Salary] + [Premium] + 100) > (SELECT ([Salary] + [Premium]) FROM [Doctors_PR] WHERE [Name] = 'Anthony' AND [Surname] = 'Davis');

/*7*/
SELECT DISTINCT dp.[Name]
FROM Departments_PR dp
JOIN DoctorsExaminations_PR de ON dp.Id = de.WardId
JOIN Doctors_PR dr ON de.DoctorId = dr.Id
WHERE dr.[Name] = 'Joshua' AND dr.[Surname] = 'Bell';

/*8*/
SELECT DISTINCT sp.[Name]
FROM Sponsors_PR sp
LEFT JOIN Donations_PR d ON sp.Id = d.SponsorId
WHERE d.Id IS NULL
AND sp.Id NOT IN (SELECT DISTINCT d.SponsorId FROM Donations_PR d JOIN Departments_PR dp ON d.DepartmentId = dp.Id WHERE dp.[Name] IN ('Neurology', 'Oncology'));

/*9*/
SELECT DISTINCT dr.[Surname]
FROM Doctors_PR dr
JOIN DoctorsExaminations_PR de ON dr.Id = de.DoctorId
WHERE de.[StartTime] >= '12:00:00' AND de.[EndTime] <= '15:00:00';

/*1*/
SELECT Building
FROM Departments_HW
GROUP BY Building
HAVING SUM(Financing) > 100000;

/*2*/
SELECT Groups_HW.[Name]
FROM Groups_HW
JOIN Departments_HW ON Groups_HW.DepartmentId = Departments_HW.Id
JOIN Faculties_HW ON Departments_HW.FacultyId = Faculties_HW.Id
WHERE Groups_HW.Year = 5
AND Faculties_HW.[Name] = 'Computer Science'
AND Departments_HW.[Name] = 'Software Development'
GROUP BY Groups_HW.[Name]
HAVING COUNT(*) > 10;

/*3*/
SELECT Groups_HW.[Name]
FROM Groups_HW
JOIN GroupsStudents_HW ON Groups_HW.Id = GroupsStudents_HW.GroupId
JOIN Students_HW ON GroupsStudents_HW.StudentId = Students_HW.Id
WHERE AVG(Students_HW.Rating) > (
SELECT AVG(Students_HW.Rating)
FROM Groups_HW
JOIN GroupsStudents_HW ON Groups_HW.Id = GroupsStudents_HW.GroupId
JOIN Students_HW ON GroupsStudents_HW.StudentId = Students_HW.Id
WHERE Groups_HW.[Name] = 'D221')
GROUP BY Groups_HW.[Name];

/*4*/
SELECT [Name], [Surname]
FROM Teachers_HW
WHERE Salary > (
SELECT AVG(Salary)
FROM Teachers_HW
WHERE IsProfessor = 1
);

/*5*/
SELECT Groups_HW.[Name]
FROM Groups_HW
JOIN GroupsCurators_HW ON Groups_HW.Id = GroupsCurators_HW.GroupId
GROUP BY Groups_HW.[Name]
HAVING COUNT(*) > 1;

/*6*/
SELECT Groups_HW.[Name]
FROM Groups_HW
JOIN GroupsStudents_HW ON Groups_HW.Id = GroupsStudents_HW.GroupId
JOIN Students_HW ON GroupsStudents_HW.StudentId = Students_HW.Id
WHERE AVG(Students_HW.Rating) < (
SELECT MIN(AVG(Students_HW.Rating))
FROM Groups_HW
JOIN GroupsStudents_HW ON Groups_HW.Id = GroupsStudents_HW.GroupId
JOIN Students_HW ON GroupsStudents_HW.StudentId = Students_HW.Id
WHERE Groups_HW.Year = 5
)
GROUP BY Groups_HW.[Name];

/*7*/
SELECT Faculties_HW.[Name]
FROM Faculties_HW
JOIN Departments_HW ON Faculties_HW.Id = Departments_HW.FacultyId
GROUP BY Faculties_HW.[Name]
HAVING SUM(Departments_HW.Financing) > (
SELECT SUM(Departments_HW.Financing)
FROM Faculties_HW
JOIN Departments_HW ON Faculties_HW.Id = Departments_HW.FacultyId
WHERE Faculties_HW.[Name] = 'Computer Science'
);

/*8*/
SELECT Subjects_HW.[Name], Teachers_HW.[Name], Teachers_HW.[Surname]
FROM Subjects_HW
JOIN Lectures_HW ON Subjects_HW.Id = Lectures_HW.SubjectId
JOIN Teachers_HW ON Lectures_HW.TeacherId = Teachers_HW.Id
GROUP BY Subjects_HW.[Name], Teachers_HW.[Name], Teachers_HW.[Surname]
ORDER BY COUNT(*) DESC

/*9*/
SELECT Subjects_HW.[Name]
FROM Subjects_HW
JOIN Lectures_HW ON Subjects_HW.Id = Lectures_HW.SubjectId
GROUP BY Subjects_HW.[Name]
ORDER BY COUNT(*) ASC

/*10*/
SELECT 
(SELECT COUNT(*) FROM Students_HW) AS Students_Count,
(SELECT COUNT(*) FROM Subjects_HW 
JOIN Departments_HW ON Subjects_HW.Id = Departments_HW.Id
WHERE Departments_HW.[Name] = 'Software Development') AS Subjects_Count;

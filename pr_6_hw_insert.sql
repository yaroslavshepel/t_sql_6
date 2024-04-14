use pr6
go

INSERT INTO [Curators_HW] ([Name], [Surname])
VALUES 
('John', 'Doe'),
('Alice', 'Smith'),
('Michael', 'Johnson'),
('Emma', 'Williams'),
('William', 'Brown'),
('Olivia', 'Jones'),
('James', 'Garcia'),
('Sophia', 'Martinez'),
('Alexander', 'Hernandez'),
('Elizabeth', 'Young');

INSERT INTO [Faculties_HW] ([Name])
VALUES 
('Engineering'),
('Medicine'),
('Business'),
('Law'),
('Arts'),
('Science'),
('Education'),
('Computer Science'),
('Social Sciences'),
('Architecture');

INSERT INTO [Departments_HW] ([Building], [Financing], [Name], [FacultyId])
VALUES 
(1, 100000, 'Computer Science Department', 8),
(2, 150000, 'Engineering Department', 1),
(3, 120000, 'Business Department', 3),
(1, 110000, 'Medicine Department', 2),
(2, 130000, 'Law Department', 4),
(3, 125000, 'Arts Department', 5),
(1, 105000, 'Science Department', 6),
(2, 140000, 'Education Department', 7),
(3, 115000, 'Social Sciences Department', 9),
(1, 108000, 'Architecture Department', 10);

INSERT INTO [Groups_HW] ([Name], [Year], [DepartmentId])
VALUES 
('CS101', 1, 1),
('ENG201', 2, 2),
('BUS301', 3, 3),
('MED101', 1, 4),
('LAW201', 2, 5),
('ARTS301', 3, 6),
('SCI101', 1, 7),
('EDU201', 2, 8),
('SSC301', 3, 9),
('ARCH101', 1, 10);

INSERT INTO [Students_HW] ([Name], [Rating], [Surname])
VALUES 
('Emily', 4, 'Taylor'),
('Daniel', 5, 'Johnson'),
('Emma', 3, 'Wilson'),
('Michael', 4, 'Anderson'),
('Olivia', 5, 'Thomas'),
('William', 3, 'Jackson'),
('Sophia', 4, 'White'),
('Alexander', 5, 'Harris'),
('Elizabeth', 3, 'Martin'),
('James', 4, 'Thompson');

INSERT INTO [Subjects_HW] ([Name])
VALUES 
('Computer Programming'),
('Mechanical Engineering'),
('Marketing'),
('Anatomy'),
('Criminal Law'),
('Art History'),
('Physics'),
('Pedagogy'),
('Sociology'),
('Architectural Design');

INSERT INTO [Teachers_HW] ([IsProfessor], [Name], [Salary], [Surname])
VALUES 
(1, 'David', 60000, 'Brown'),
(1, 'Jennifer', 58000, 'Garcia'),
(0, 'Robert', 55000, 'Lopez'),
(1, 'Mary', 62000, 'Young'),
(0, 'Richard', 56000, 'Allen'),
(1, 'Patricia', 59000, 'Hall'),
(0, 'Joseph', 54000, 'Scott'),
(1, 'Linda', 61000, 'Green'),
(0, 'William', 57000, 'Adams'),
(1, 'Jessica', 63000, 'Baker');

INSERT INTO [Lectures_HW] ([Date], [SubjectId], [TeacherId])
VALUES 
('2024-01-13', 1, 1),
('2024-02-14', 2, 2),
('2024-01-15', 3, 3),
('2024-02-16', 4, 4),
('2024-03-17', 5, 5),
('2024-01-18', 6, 6),
('2024-02-19', 7, 7),
('2024-03-20', 8, 8),
('2024-04-11', 9, 9),
('2024-02-22', 10, 10);

INSERT INTO [GroupsStudents_HW] ([GroupId], [StudentId])
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO [GroupsCurators_HW] ([CuratorId], [GroupId])
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
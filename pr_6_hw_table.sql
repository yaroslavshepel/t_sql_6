CREATE TABLE [Curators_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Faculties_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE [Departments_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Building] INT NOT NULL CHECK ([Building] >= 1 AND [BUilding] <= 5),
    [Financing] MONEY NOT NULL DEFAULT 0,
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [FacultyId] INT NOT NULL,
    FOREIGN KEY ([FacultyId]) REFERENCES [Faculties_HW](Id)
);

CREATE TABLE [Groups_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(10) NOT NULL UNIQUE,
    [Year] INT NOT NULL CHECK ([Year] >= 1 AND [Year] <= 5),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY ([DepartmentId]) REFERENCES [Departments_HW](Id)
);

CREATE TABLE [GroupsCurators_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,
    FOREIGN KEY ([CuratorId]) REFERENCES [Curators_HW](Id),
    FOREIGN KEY ([GroupId]) REFERENCES [Groups_HW](Id)
);

CREATE TABLE [Students_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Rating] INT NOT NULL CHECK ([Rating] >= 0 AND [Rating] <= 5),
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Subjects_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE [Teachers_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [IsProfessor] BIT NOT NULL DEFAULT 0,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Salary] MONEY NOT NULL CHECK ([Salary] > 0),
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Lectures_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Date DATE NOT NULL CHECK (Date <= GETDATE()),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,
    FOREIGN KEY ([SubjectId]) REFERENCES [Subjects_HW](Id),
    FOREIGN KEY ([TeacherId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [GroupsLectures_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES [Groups_HW](Id),
    FOREIGN KEY (LectureId) REFERENCES [Lectures_HW](Id)
);

CREATE TABLE [GroupsStudents_HW] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    GroupId INT NOT NULL,
    StudentId INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES [Groups_HW](Id),
    FOREIGN KEY (StudentId) REFERENCES [Students_HW](Id)
);
create table [Examinations_PR](
	Id INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[Name] NVARChaR(MAX) CHECK(LEN([Name])>0)  NOT NULL
);

create table [Sponsors_PR](
	Id INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[Name] NVARChaR(MAX) CHECK(LEN([Name])>0) NOT NULL
);

create table [Departments_PR](
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Building] int check([Building]>0 and [Building]<6) NOT NULL,
	[Name] NVARCHAR(100) CHECK(LEN([Name])>0) UNIQUE NOT NULL
);

CREATE TABLE [Doctors_PR] (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Premium] MONEY NOT NULL DEFAULT 0 CHECK ([Premium] >= 0),
    [Salary] MONEY NOT NULL CHECK ([Salary] > 0),
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Wards_PR] (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(20) NOT NULL UNIQUE,
    [Places] INT NOT NULL CHECK ([Places] >= 1),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY ([DepartmentId]) REFERENCES [Departments_PR](Id)
);

CREATE TABLE [DoctorsExaminations_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [EndTime] TIME NOT NULL,
    [StartTime] TIME NOT NULL,
    [DoctorId] INT NOT NULL,
    [ExaminationId] INT NOT NULL,
    [WardId] INT NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES [Doctors_PR](Id),
    FOREIGN KEY (ExaminationId) REFERENCES [Examinations_PR](Id),
    FOREIGN KEY (WardId) REFERENCES [Wards_PR](Id),
	CONSTRAINT CHK_StartTime_END CHECK ([StartTime] < [EndTime]),
    CONSTRAINT CHK_StartTime CHECK ([StartTime] >= '08:00:00' AND [StartTime] <= '18:00:00')
);

CREATE TABLE [Donations_PR] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    [Amount] MONEY NOT NULL CHECK (Amount > 0),
    [Date] DATE NOT NULL DEFAULT GETDATE(),
    [DepartmentId] INT NOT NULL,
    [SponsorId] INT NOT NULL,
    CONSTRAINT FK_Department FOREIGN KEY ([DepartmentId]) REFERENCES [Departments_PR](Id),
    CONSTRAINT FK_Sponsor FOREIGN KEY ([SponsorId]) REFERENCES [Sponsors_PR](Id)
);
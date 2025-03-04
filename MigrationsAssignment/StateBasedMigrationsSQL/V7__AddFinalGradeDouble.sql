create table Instructors
(
    Id         TEXT not null
        constraint PK_Instructors
            primary key,
    FirstName  TEXT not null,
    MiddleName TEXT,
    LastName   TEXT not null,
    Email      TEXT not null,
    HireDate   TEXT not null
);

create table Courses
(
    Id           TEXT    not null
        constraint PK_Courses
            primary key,
    Credits      INTEGER not null,
    InstructorId TEXT    not null
        constraint FK_Courses_Instructors_InstructorId
            references Instructors(Id)
            on delete cascade,
    Title        TEXT    not null
);

create index IX_Courses_InstructorId
    on Courses (InstructorId);

create table Departments
(
    Id               TEXT not null
        constraint PK_Departments
            primary key,
    Name             TEXT not null,
    Budget           TEXT not null,
    StartDate        TEXT not null,
    DepartmentHeadId TEXT not null
        constraint FK_Departments_Instructors_DepartmentHeadId
            references Instructors(Id)
            on delete cascade
);

create unique index IX_Departments_DepartmentHeadId
    on Departments (DepartmentHeadId);

create table Students
(
    Id             TEXT                                     not null
        constraint PK_Students
            primary key,
    FirstName      TEXT                                     not null,
    LastName       TEXT                                     not null,
    Email          TEXT                                     not null,
    EnrollmentDate TEXT                                     not null,
    MiddleName     TEXT,
    Birthday       TEXT default '0001-01-01 00:00:00+00:00' not null
);

create table Enrollments
(
    Id         TEXT not null
        constraint PK_Enrollments
            primary key,
    CourseId   TEXT not null
        constraint FK_Enrollments_Courses_CourseId
            references Courses(Id)
            on delete cascade,
    FinalGrade REAL,
    StudentId  TEXT not null
        constraint FK_Enrollments_Students_StudentId
            references Students(Id)
            on delete cascade
);

create index IX_Enrollments_CourseId
    on Enrollments (CourseId);

create index IX_Enrollments_StudentId
    on Enrollments (StudentId);

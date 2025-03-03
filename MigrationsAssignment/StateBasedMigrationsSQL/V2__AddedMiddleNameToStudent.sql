create table Courses
(
    Id      TEXT    not null
        constraint PK_Courses
            primary key,
    Credits INTEGER not null,
    Title   TEXT    not null
);

create table Students
(
    Id             TEXT not null
        constraint PK_Students
            primary key,
    Email          TEXT not null,
    EnrollmentDate TEXT not null,
    FirstName      TEXT not null,
    LastName       TEXT not null,
    MiddleName     TEXT
);

create table Enrollments
(
    Id        TEXT not null
        constraint PK_Enrollments
            primary key,
    CourseId  TEXT not null
        constraint FK_Enrollments_Courses_CourseId
            references Courses
            on delete cascade,
    Grade     INTEGER,
    StudentId TEXT not null
        constraint FK_Enrollments_Students_StudentId
            references Students
            on delete cascade
);

create index IX_Enrollments_CourseId
    on Enrollments (CourseId);

create index IX_Enrollments_StudentId
    on Enrollments (StudentId);


CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory"
(
    "MigrationId"    TEXT NOT NULL
        CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);

BEGIN TRANSACTION;
CREATE TABLE "Courses"
(
    "Id"      TEXT    NOT NULL
        CONSTRAINT "PK_Courses" PRIMARY KEY,
    "Title"   TEXT    NOT NULL,
    "Credits" INTEGER NOT NULL
);

CREATE TABLE "Enrollments"
(
    "Id"        TEXT    NOT NULL
        CONSTRAINT "PK_Enrollments" PRIMARY KEY,
    "StudentId" TEXT    NOT NULL,
    "CourseId"  TEXT    NOT NULL,
    "Grade"     INTEGER NULL
);

CREATE TABLE "Students"
(
    "Id"             TEXT NOT NULL
        CONSTRAINT "PK_Students" PRIMARY KEY,
    "FirstName"      TEXT NOT NULL,
    "LastName"       TEXT NOT NULL,
    "Email"          TEXT NOT NULL,
    "EnrollmentDate" TEXT NOT NULL
);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224101125_InitialCreate', '9.0.2');

COMMIT;


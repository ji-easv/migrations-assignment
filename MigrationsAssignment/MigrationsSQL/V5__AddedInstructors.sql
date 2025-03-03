BEGIN TRANSACTION;
ALTER TABLE "Courses" ADD "InstructorId" TEXT NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';

CREATE TABLE "Instructors" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Instructors" PRIMARY KEY,
    "FirstName" TEXT NOT NULL,
    "MiddleName" TEXT NULL,
    "LastName" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "HireDate" TEXT NOT NULL
);

CREATE INDEX "IX_Courses_InstructorId" ON "Courses" ("InstructorId");

CREATE TABLE "ef_temp_Courses" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Courses" PRIMARY KEY,
    "Credits" INTEGER NOT NULL,
    "InstructorId" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    CONSTRAINT "FK_Courses_Instructors_InstructorId" FOREIGN KEY ("InstructorId") REFERENCES "Instructors" ("Id") ON DELETE CASCADE
);

INSERT INTO "ef_temp_Courses" ("Id", "Credits", "InstructorId", "Title")
SELECT "Id", "Credits", "InstructorId", "Title"
FROM "Courses";

COMMIT;

PRAGMA foreign_keys = 0;

BEGIN TRANSACTION;
DROP TABLE "Courses";

ALTER TABLE "ef_temp_Courses" RENAME TO "Courses";

COMMIT;

PRAGMA foreign_keys = 1;

BEGIN TRANSACTION;
CREATE INDEX "IX_Courses_InstructorId" ON "Courses" ("InstructorId");

COMMIT;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224132722_AddedInstructor', '9.0.2');


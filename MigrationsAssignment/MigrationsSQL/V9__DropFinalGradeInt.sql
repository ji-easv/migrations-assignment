BEGIN TRANSACTION;
CREATE TABLE "ef_temp_Enrollments" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Enrollments" PRIMARY KEY,
    "CourseId" TEXT NOT NULL,
    "FinalGradeDouble" REAL NULL,
    "StudentId" TEXT NOT NULL,
    CONSTRAINT "FK_Enrollments_Courses_CourseId" FOREIGN KEY ("CourseId") REFERENCES "Courses" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Enrollments_Students_StudentId" FOREIGN KEY ("StudentId") REFERENCES "Students" ("Id") ON DELETE CASCADE
);

INSERT INTO "ef_temp_Enrollments" ("Id", "CourseId", "FinalGradeDouble", "StudentId")
SELECT "Id", "CourseId", "FinalGradeDouble", "StudentId"
FROM "Enrollments";

COMMIT;

PRAGMA foreign_keys = 0;

BEGIN TRANSACTION;
DROP TABLE "Enrollments";

ALTER TABLE "ef_temp_Enrollments" RENAME TO "Enrollments";

COMMIT;

PRAGMA foreign_keys = 1;

BEGIN TRANSACTION;
CREATE INDEX "IX_Enrollments_CourseId" ON "Enrollments" ("CourseId");

CREATE INDEX "IX_Enrollments_StudentId" ON "Enrollments" ("StudentId");

COMMIT;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224134550_DropFinalGradeInt', '9.0.2');


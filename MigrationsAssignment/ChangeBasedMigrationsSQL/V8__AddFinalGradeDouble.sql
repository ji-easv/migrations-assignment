BEGIN TRANSACTION;
ALTER TABLE "Enrollments"
    ADD "FinalGradeDouble" REAL NULL;

UPDATE Enrollments
SET FinalGradeDouble = FinalGrade

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224134332_AddFinalGradeDouble', '9.0.2');

COMMIT;


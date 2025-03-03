BEGIN TRANSACTION;
ALTER TABLE "Enrollments" RENAME COLUMN "FinalGradeDouble" TO "FinalGrade";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224134618_RenameFinalGrade', '9.0.2');

COMMIT;


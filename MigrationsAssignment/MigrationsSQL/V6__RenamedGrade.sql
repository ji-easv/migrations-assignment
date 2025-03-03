BEGIN TRANSACTION;
ALTER TABLE "Enrollments" RENAME COLUMN "Grade" TO "FinalGrade";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224133115_RenamedGrade', '9.0.2');

COMMIT;


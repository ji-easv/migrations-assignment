BEGIN TRANSACTION;
ALTER TABLE "Students" ADD "MiddleName" TEXT NULL;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224113744_AddedMiddleNameToStudent', '9.0.2');

COMMIT;


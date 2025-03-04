BEGIN TRANSACTION;
ALTER TABLE "Students"
    ADD "Birthday" TEXT NOT NULL DEFAULT '0001-01-01 00:00:00+00:00';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224115409_AddedBirthdayToStudent', '9.0.2');

COMMIT;


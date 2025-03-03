BEGIN TRANSACTION;
CREATE TABLE "Departments" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Departments" PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "Budget" TEXT NOT NULL,
    "StartDate" TEXT NOT NULL,
    "DepartmentHeadId" TEXT NOT NULL,
    CONSTRAINT "FK_Departments_Instructors_DepartmentHeadId" FOREIGN KEY ("DepartmentHeadId") REFERENCES "Instructors" ("Id") ON DELETE CASCADE
);

CREATE UNIQUE INDEX "IX_Departments_DepartmentHeadId" ON "Departments" ("DepartmentHeadId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224133255_AddDepartments', '9.0.2');

COMMIT;


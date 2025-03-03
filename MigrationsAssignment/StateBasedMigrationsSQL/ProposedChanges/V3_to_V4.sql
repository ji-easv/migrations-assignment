-- Disable the enforcement of foreign-keys constraints
PRAGMA foreign_keys = off;
-- Create "new_Courses" table
CREATE TABLE `new_Courses` (`Id` text NOT NULL, `Credits` integer NOT NULL, `InstructorId` text NOT NULL, `Title` text NOT NULL, PRIMARY KEY (`Id`), CONSTRAINT `FK_Courses_Instructors_InstructorId` FOREIGN KEY (`InstructorId`) REFERENCES `Instructors` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE);
-- Copy rows from old table "Courses" to new temporary table "new_Courses"
INSERT INTO `new_Courses` (`Id`, `Credits`, `Title`) SELECT `Id`, `Credits`, `Title` FROM `Courses`;
-- Drop "Courses" table after copying rows
DROP TABLE `Courses`;
-- Rename temporary table "new_Courses" to "Courses"
ALTER TABLE `new_Courses` RENAME TO `Courses`;
-- Create index "IX_Courses_InstructorId" to table: "Courses"
CREATE INDEX `IX_Courses_InstructorId` ON `Courses` (`InstructorId`);
-- Create "Instructors" table
CREATE TABLE `Instructors` (`Id` text NOT NULL, `FirstName` text NOT NULL, `MiddleName` text NULL, `LastName` text NOT NULL, `Email` text NOT NULL, `HireDate` text NOT NULL, PRIMARY KEY (`Id`));
-- Enable back the enforcement of foreign-keys constraints
PRAGMA foreign_keys = on;

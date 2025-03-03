-- Disable the enforcement of foreign-keys constraints
PRAGMA foreign_keys = off;
-- Create "new_Enrollments" table
CREATE TABLE `new_Enrollments` (`Id` text NOT NULL, `CourseId` text NOT NULL, `FinalGrade` real NULL, `StudentId` text NOT NULL, PRIMARY KEY (`Id`), CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE, CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE);
-- Copy rows from old table "Enrollments" to new temporary table "new_Enrollments"
INSERT INTO `new_Enrollments` (`Id`, `CourseId`, `FinalGrade`, `StudentId`) SELECT `Id`, `CourseId`, `FinalGrade`, `StudentId` FROM `Enrollments`;
-- Drop "Enrollments" table after copying rows
DROP TABLE `Enrollments`;
-- Rename temporary table "new_Enrollments" to "Enrollments"
ALTER TABLE `new_Enrollments` RENAME TO `Enrollments`;
-- Create index "IX_Enrollments_CourseId" to table: "Enrollments"
CREATE INDEX `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);
-- Create index "IX_Enrollments_StudentId" to table: "Enrollments"
CREATE INDEX `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);
-- Enable back the enforcement of foreign-keys constraints
PRAGMA foreign_keys = on;

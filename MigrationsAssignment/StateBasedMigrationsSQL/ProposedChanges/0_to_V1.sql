-- Create "Courses" table
CREATE TABLE `Courses` (`Id` text NOT NULL, `Credits` integer NOT NULL, `Title` text NOT NULL, PRIMARY KEY (`Id`));
-- Create "Students" table
CREATE TABLE `Students` (`Id` text NOT NULL, `Email` text NOT NULL, `EnrollmentDate` text NOT NULL, `FirstName` text NOT NULL, `LastName` text NOT NULL, PRIMARY KEY (`Id`));
-- Create "Enrollments" table
CREATE TABLE `Enrollments` (`Id` text NOT NULL, `CourseId` text NOT NULL, `Grade` integer NULL, `StudentId` text NOT NULL, PRIMARY KEY (`Id`), CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE, CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE);
-- Create index "IX_Enrollments_CourseId" to table: "Enrollments"
CREATE INDEX `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);
-- Create index "IX_Enrollments_StudentId" to table: "Enrollments"
CREATE INDEX `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);

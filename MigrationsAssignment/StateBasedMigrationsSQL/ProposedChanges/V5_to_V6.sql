-- Create "Departments" table
CREATE TABLE `Departments` (`Id` text NOT NULL, `Name` text NOT NULL, `Budget` text NOT NULL, `StartDate` text NOT NULL, `DepartmentHeadId` text NOT NULL, PRIMARY KEY (`Id`), CONSTRAINT `FK_Departments_Instructors_DepartmentHeadId` FOREIGN KEY (`DepartmentHeadId`) REFERENCES `Instructors` (`Id`) ON UPDATE NO ACTION ON DELETE CASCADE);
-- Create index "IX_Departments_DepartmentHeadId" to table: "Departments"
CREATE UNIQUE INDEX `IX_Departments_DepartmentHeadId` ON `Departments` (`DepartmentHeadId`);

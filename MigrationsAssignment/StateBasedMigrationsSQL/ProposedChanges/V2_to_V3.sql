-- Add column "Birthday" to table: "Students"
ALTER TABLE `Students` ADD COLUMN `Birthday` text NOT NULL DEFAULT '0001-01-01 00:00:00+00:00';

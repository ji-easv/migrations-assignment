# Database Schema Changes

## Overview
This assignment will guide you through creating and evolving a Student Management database schema in a .NET environment, demonstrating:
- Change-Based vs. State-Based migration strategies.
- Feature branching for incremental schema changes.
- Version-controlled artifacts that track each migration.
By the end of this project, you will have hands-on experience with practical migration scenarios and a understanding of how to maintain consistent database environments.

## Scenario
You are building a simple “Student Management” system that stores information about students, courses, enrollments, and (later) instructors and departments. You will:

- Create an initial database schema.
- Incrementally modify the schema with new features using feature branches.
- Demonstrate different migration approaches (Incremental vs. State-based approach).
- Version everything in source control (e.g., Git) to ensure all changes are traceable and reproducible.

## Initial Schema

### Student
- Id
- FirstName
- LastName
- Email
- EnrollmentDate

### Course
- Id
- Title
- Credits

### Enrollment
- Id
- StudentId
- CourseId
- Grade

### Primary and Foreign Keys
- **Student**: Primary Key (Id)
- **Course**: Primary Key (Id)
- **Enrollment**: Primary Key (Id), Foreign Keys (StudentId, CourseId)

## Schema Changes

### 1. Add MiddleName to Student
Add a `MiddleName` attribute to the `Student` relation.

### 2. Add DateOfBirth to Student
Add a `DateOfBirth` attribute to the `Student` relation.

### 3. Add Instructor Relation
Create an `Instructor` relation with the following attributes:
- Id
- FirstName
- LastName
- Email
- HireDate

Next, add an attribute `InstructorId` to the `Course` relation and define it as a foreign key reference to the `Instructor` relation.

### 4. Rename Grade Attribute to FinalGrade in Enrollment
Rename the `Grade` attribute to `FinalGrade` in the `Enrollment` relation.

#### Argument for Destructive vs Non-Destructive Approach
- **Non-Destructive**: Renaming an attribute is a non-destructive change as it does not result in data loss. It is preferred to maintain data integrity and avoid potential issues with existing data.

### 5. Add Department Relation
Create a `Department` relation with the following attributes:
- Id
- Name
- Budget
- StartDate

Next, define a relationship such that a `Department` can have a `DepartmentHead` and a `DepartmentHead` can only be an `Instructor`.

### 6. Modify the Course Credits Relation
If you've chosen to use integers for the `Credits` attribute, modify the type to `decimal(5, 2)` and vice versa.

#### Argument for Destructive vs Non-Destructive Approach
- **Destructive**: Changing the data type of an attribute can be a destructive change as it may result in data loss or require data transformation. It is important to carefully plan and execute such changes to ensure data consistency and integrity.

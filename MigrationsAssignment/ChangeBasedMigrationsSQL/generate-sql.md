## Task 1
```bash
dotnet ef migrations script 0 InitialCreate -o ChangeBasedMigrationsSQL/V1__InitialCreate.sql
dotnet ef migrations script InitialCreate AddForeignKeys -o ChangeBasedMigrationsSQL/V2__AddForeignKeys.sql
```

## Task 2
```bash
dotnet ef migrations script AddForeignKeys AddedMiddleNameToStudent -o ChangeBasedMigrationsSQL/V3__AddedMiddleNameToStudent.sql
```

## Task 3
```bash
dotnet ef migrations script AddedMiddleNameToStudent AddedBirthdayToStudent -o ChangeBasedMigrationsSQL/V4__AddedBirthdayToStudent.sql
```

## Task 4
```bash
dotnet ef migrations script AddedBirthdayToStudent AddedInstructor -o ChangeBasedMigrationsSQL/V5__AddedInstructors.sql
```

## Task 5
```bash
dotnet ef migrations script AddedInstructor RenamedGrade -o ChangeBasedMigrationsSQL/V6__RenamedGrade.sql
```

## Task 6
```bash
dotnet ef migrations script 0 AddDepartments -o ChangeBasedMigrationsSQL/V7__AddDepartments.sql
```

## Task 7
```bash
dotnet ef migrations script AddDepartments AddFinalGradeDouble -o ChangeBasedMigrationsSQL/V8__AddFinalGradeDouble.sql
dotnet ef migrations script AddFinalGradeDouble DropFinalGradeInt -o ChangeBasedMigrationsSQL/V9__DropFinalGradeInt.sql
dotnet ef migrations script DropFinalGradeInt RenameFinalGrade -o ChangeBasedMigrationsSQL/V10__RenameFinalGrade.sql
```
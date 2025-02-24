## Task 1
```bash
dotnet ef migrations script 0 InitialCreate -o MigrationsSQL/V1__InitialCreate.sql
dotnet ef migrations script InitialCreate AddForeignKeys -o MigrationsSQL/V2__AddForeignKeys.sql
```

## Task 2
```bash
dotnet ef migrations script AddForeignKeys AddedMiddleNameToStudent -o MigrationsSQL/V3__AddedMiddleNameToStudent.sql
```

## Task 3
```bash
dotnet ef migrations script AddedMiddleNameToStudent AddedBirthdayToStudent -o MigrationsSQL/V4__AddedBirthdayToStudent.sql
```

## Task 4
```bash
dotnet ef migrations script AddedBirthdayToStudent AddedInstructors -o MigrationsSQL/V5__AddedInstructors.sql
```

## Task 5
```bash
dotnet ef migrations script AddedInstructors RenamedGrade -o MigrationsSQL/V6__RenamedGrade.sql
```

## Task 6
```bash
dotnet ef migrations script RenamedGrade ??? -o MigrationsSQL/V7__.sql
```

## Task 6
```bash
dotnet ef migrations script ??? ??? -o MigrationsSQL/V8__.sql
```
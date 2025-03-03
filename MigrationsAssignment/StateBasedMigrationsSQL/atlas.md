# Atlas
The following commands are examples on how to apply the migrations using Atlas. 
You can adjust the paths to .sql files and the database connection string to fit your needs.

## Bash Commands
```bash
cd MigrationsAssignment/StateBasedMigrationsSQL
```

```bash
docker run --rm -it \
  -v $(pwd):/migrations \
  arigaio/atlas schema apply \
  -u "sqlite://migrations/state-student-management.sqlite" \
  --to "file://migrations/V1__InitialCreate.sql" \
  --dev-url "sqlite://dev?mode=memory&_fk=1"
```

## PowerShell Commands
```shell
cd MigrationsAssignment/StateBasedMigrationsSQL
```

```shell
docker run --rm -it `
-v ${PWD}:/migrations `
arigaio/atlas schema apply `
-u "sqlite://migrations/state-student-management.sqlite" `
--to "file://migrations/V1__InitialCreate.sql" `
--dev-url "sqlite://dev?mode=memory&_fk=1"
```
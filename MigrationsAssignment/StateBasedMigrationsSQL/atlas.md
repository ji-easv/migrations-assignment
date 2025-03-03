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

To apply a new schema to the database, run the following command:

```shell
docker run --rm -it `
-v ${PWD}:/migrations `
arigaio/atlas schema apply `
-u "sqlite://migrations/state-student-management.sqlite" `
--to "file://migrations/V1__InitialCreate.sql" `
--dev-url "sqlite://dev?mode=memory&_fk=1"
```

To generate just a diff script, run the following command:

```shell
docker run --rm -it `
-v ${PWD}:/migrations `
arigaio/atlas schema diff `
--from "file://migrations/V4__AddedInstructor.sql" `
--to "file://migrations/V5__RenamedGrade.sql" > ProposedChanges/V4_to_V5.sql `
--dev-url "sqlite://dev?mode=memory&_fk=1"
```


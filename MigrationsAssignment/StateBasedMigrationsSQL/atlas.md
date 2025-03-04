# Atlas

The following commands are examples on how to apply the migrations using Atlas.
You can adjust the paths to .sql files and the database connection string to fit your needs.

Shell:
```shell
cd MigrationsAssignment/StateBasedMigrationsSQL
```

Bash:
```bash
cd MigrationsAssignment/StateBasedMigrationsSQL
```

To apply a new schema to the database, run the following command:

Shell:
```shell
docker run --rm -it `
-v ${PWD}:/migrations `
arigaio/atlas schema apply `
-u "sqlite://migrations/state-student-management.sqlite" `
--to "file://migrations/V1__InitialCreate.sql" `
--dev-url "sqlite://dev?mode=memory&_fk=1"
```

Bash:
```bash
docker run --rm -it \
  -v $(pwd):/migrations \
  arigaio/atlas schema apply \
  -u "sqlite://migrations/state-student-management.sqlite" \
  --to "file://migrations/V1__InitialCreate.sql" \
  --dev-url "sqlite://dev?mode=memory&_fk=1"
```

To generate just a diff script, run the following command:

Shell:
```shell
docker run --rm -it `
-v ${PWD}:/migrations `
arigaio/atlas schema diff `
--from "file://migrations/V1__InitialCreate.sql" `
--to "file://migrations/V2__AddedMiddleNameToStudent.sql" > ProposedChanges/V1_to_V2.sql `
--dev-url "sqlite://dev?mode=memory&_fk=1"
```

Bash:
```bash
docker run --rm -it \
  -v $(pwd):/migrations \
  arigaio/atlas schema diff \
  --from "file://migrations/V1__InitialCreate.sql" \
  --to "file://migrations/V2__AddedMiddleNameToStudent.sql" > ProposedChanges/V1_to_V2.sql \
  --dev-url "sqlite://dev?mode=memory&_fk=1"
```
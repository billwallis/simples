## What's a primary key?

- It's what "uniquely identifies" rows in a table
- Usually, defining something as a PK implies unique and not null
  - This is _usually_ true, [SQLite is an exception](https://sqlite.org/lang_createtable.html#the_primary_key)
- BEWARE! PKs are not enforced in many cloud data platforms (e.g. [Snowflake](https://docs.snowflake.com/en/sql-reference/constraints-overview#supported-constraint-types) and [BigQuery](https://docs.cloud.google.com/bigquery/docs/primary-foreign-keys#optimize_queries))
- Special mention: SQL Server's PKs create clustered indexes which physically store the rows in the PK order (which is not common)
  - SQLite has a similar behaviour when PKs are integers

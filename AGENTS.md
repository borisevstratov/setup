# AGENTS.md

## What this repo is

Operational helper: Docker Compose stacks for local macOS dev databases (MySQL, PostgreSQL, Redis) plus an idempotent database-creation script. No build, test, lint, or CI pipelines.

## Prerequisites before using database helpers

- Docker must be running.
- The `mysql` and `psql` CLI clients must be installed locally (the script shells out to them, it does not run inside containers).

## Command order matters

1. `make mac-dbs` — starts the Docker Compose stack (`mac/local-dbs.yml`).
2. `make new-db` — creates a database in the running container via interactive prompt.
   - Running `new-db` before `mac-dbs` will fail because there is nothing to connect to.

## DB_TYPE values

- `mysql` (or `postgres` / `postgresql`) — the script normalizes both `postgres` and `postgresql` to PostgreSQL.
- MySQL connects as `root` with empty password on `127.0.0.1:3306`.
- PostgreSQL connects as `postgres` with `trust` auth on `127.0.0.1:5432`.

## Idempotency

`scripts/new-db.sh` and the `Makefile` target are safe to rerun — existing databases are silently skipped.

## Docker Compose services and ports

| Service    | Container name | Port                |
|------------|----------------|---------------------|
| MySQL 8.4  | `mysql8`       | `127.0.0.1:3306`    |
| PostgreSQL 18 | `postgres18` | `127.0.0.1:5432`    |
| Redis 7    | `redis7`       | `127.0.0.1:6379`    |

No health-checks or startup coordination are provided; wait a few seconds after `make mac-dbs` before creating databases.

# Dev Environment Setup

## Available Commands

```bash
make mac-dbs   # Start macOS Docker databases
make new-db    # Interactive prompt for database type and name
```

## Docker Compose Stacks

### macOS

| Service | Port |
|---------|------|
| MySQL   | 3306 |
| PostgreSQL | 5432 |
| Redis   | 6379 |

```bash
# Start
docker compose -f mac/local-dbs.yml up -d

# Stop
docker compose -f mac/local-dbs.yml down

# Logs
docker compose -f mac/local-dbs.yml logs -f
```

## Database Creation

A helper script is available to quickly create databases in the running Docker containers.

### Usage

```bash
# Via Makefile
make new-db    # Interactive prompt for database type and name
```

### Supported database types

| DB_TYPE   | Connection details                     |
|-----------|----------------------------------------|
| `mysql`   | `127.0.0.1:3306` as `root` (no pass)  |
| `postgres`| `127.0.0.1:5432` as `postgres` (trust)|

The script is idempotent — it won't fail if the database already exists.

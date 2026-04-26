# Dev Environment Setup

## Available Commands

```bash
make mac-dbs    # Start macOS Docker databases
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

mac-dbs:
	docker compose -f mac/local-dbs.yml up -d

new-db:
	@scripts/new-db.sh

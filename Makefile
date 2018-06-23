.PHONY: up
up:
	docker-compose pull
	docker-compose up -d postgres
	docker-compose run --rm wait_postgres
	make -C . init-database
	docker-compose up -d postgraphile
	@echo "Open your browser at http://`docker-compose port postgraphile 5000`/graphiql"

.PHONY: down
down:
	docker-compose down
	rm -rf postgresql-data

.PHONY: init-database
init-database:
	sh -c "cat example_forum/schema.sql | docker exec -i --user postgres `docker-compose ps -q postgres` psql postgres"
	sh -c "cat example_forum/data.sql | docker exec -i --user postgres `docker-compose ps -q postgres` psql postgres"

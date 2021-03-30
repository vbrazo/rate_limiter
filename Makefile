build:
	docker-compose build

bash:
	docker-compose run gem bash

specs:
	docker-compose run --entrypoint ./bin/specs gem

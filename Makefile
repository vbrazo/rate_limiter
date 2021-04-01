build:
	docker-compose build

bash:
	docker-compose run gem bash

specs:
	docker-compose run -e "RAILS_ENV=test" gem bundle exec rspec .

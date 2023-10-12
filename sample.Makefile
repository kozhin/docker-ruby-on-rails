#
# Basic usage examples
#
# - Creates a new Rails application
#
.PHONY: ror-new-app
ror-new-app:
	docker run \
		--rm \
		-v $(shell pwd):/app \
		-it kozhin/rails:7.1.1-dev \
		rails new /app \
			--skip-bundle \
			--skip-coffee \
			--database=postgresql
#
# - Prepares application for development
#
.PHONY: build-pre
build-pre:
	docker build \
		--build-arg RAILS_VERSION="7.1.1" \
		-t sample:dev \
		-f .devops/build/pre.Dockerfile \
		.
#
# - Builds application image for development
#
.PHONY: build-dev
build-dev:
	docker build \
		--build-arg RAILS_VERSION="7.1.1" \
		-t sample:dev \
		-f .devops/build/dev.Dockerfile \
		.
#
# - Builds application image for production
#
.PHONY: build-prod
build-prod:
	docker build \
		--build-arg RAILS_VERSION="7.1.1" \
		-t sample:prod \
		-f .devops/build/prod.Dockerfile \
		.
#
# - Run Rails console container
#
.PHONY: ror-run-runner
ror-run-runner:
	docker-compose run --rm runner
#
# - Run Rails container
#
.PHONY: ror-run-rails
ror-run-rails:
	docker-compose up rails
#
# - Run Sidekiq container
#
.PHONY: ror-run-sidekiq
ror-run-sidekiq:
	docker-compose up sidekiq
#
# - Run Webpcker container
#
.PHONY: ror-run-webpacker
ror-run-webpacker:
	docker-compose up webpacker
#
# - Stop all containers
#
.PHONY: ror-stop
ror-stop:
	docker-compose stop
#
# - Clean up containers and volumes
#
.PHONY: ror-cleanup
ror-cleanup:
	docker-compose down --volumes
#
# - Clean up Docker builder cache
#
.PHONY: docker-cleanup
docker-cleanup:
	docker builder prune

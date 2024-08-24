#
# Builds and publishes base image for development
#
# NOTE: Turn on experimental features for Docker and
#       create custom builder with:
#       docker buildx create --name mybuilder --use
#
.PHONY: ror-dev
ror-dev:
	docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		-t kozhin/rails:7.2.1-dev \
		-f dev.Dockerfile \
		.

.PHONY: ror-dev-arm64
ror-dev-arm64:
	docker build \
		--platform=linux/arm64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		-t kozhin/rails:7.2.1-dev \
		-f dev.Dockerfile \
		.

.PHONY: ror-dev-amd64
ror-dev-amd64:
	docker build \
		--platform=linux/amd64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		-t kozhin/rails:7.2.1-dev \
		-f dev.Dockerfile \
		.

#
# Builds and publishes base image for production
#
.PHONY: ror-prod
ror-prod:
	docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		--build-arg NGINX_VERSION="1.26.2" \
		--build-arg PASSENGER_VERSION="6.0.22" \
		-t kozhin/rails:7.2.1-prod \
		-f prod.Dockerfile \
		.

.PHONY: ror-prod-arm64
ror-prod-arm64:
	docker build \
		--platform=linux/arm64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		--build-arg NGINX_VERSION="1.26.2" \
		--build-arg PASSENGER_VERSION="6.0.22" \
		-t kozhin/rails:7.2.1-prod \
		-f prod.Dockerfile \
		.

.PHONY: ror-prod-amd64
ror-prod-amd64:
	docker build \
		--platform=linux/amd64 \
		--build-arg RUBY_VERSION="3.3.4" \
		--build-arg RAILS_VERSION="7.2.1" \
		--build-arg BUNDLER_VERSION="2.5.17" \
		--build-arg NGINX_VERSION="1.26.2" \
		--build-arg PASSENGER_VERSION="6.0.23" \
		-t kozhin/rails:7.2.1-prod \
		-f prod.Dockerfile \
		.
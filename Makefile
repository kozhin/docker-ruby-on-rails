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
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		--push \
		-t kozhin/rails:7.1.3.3-dev \
		-f dev.Dockerfile \
		.

.PHONY: ror-dev-arm64
ror-dev-arm64:
	docker build \
		--platform=linux/arm64 \
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		-t kozhin/rails:7.1.3.3-dev \
		-f dev.Dockerfile \
		.

.PHONY: ror-dev-amd64
ror-dev-amd64:
	docker build \
		--platform=linux/amd64 \
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		-t kozhin/rails:7.1.3.3-dev \
		-f dev.Dockerfile \
		.

#
# Builds and publishes base image for production
#
.PHONY: ror-prod
ror-prod:
	docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		--build-arg NGINX_VERSION="1.26.0" \
		--build-arg PASSENGER_VERSION="6.0.22" \
		--push \
		-t kozhin/rails:7.1.3.3-prod \
		-f prod.Dockerfile \
		.

.PHONY: ror-prod-arm64
ror-prod-arm64:
	docker build \
		--platform=linux/arm64 \
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		--build-arg NGINX_VERSION="1.26.0" \
		--build-arg PASSENGER_VERSION="6.0.22" \
		-t kozhin/rails:7.1.3.3-prod \
		-f prod.Dockerfile \
		.

.PHONY: ror-prod-amd64
ror-prod-amd64:
	docker build \
		--platform=linux/amd64 \
		--build-arg RUBY_VERSION="3.3.2" \
		--build-arg RAILS_VERSION="7.1.3.3" \
		--build-arg BUNDLER_VERSION="2.5.11" \
		--build-arg NGINX_VERSION="1.26.0" \
		--build-arg PASSENGER_VERSION="6.0.22" \
		-t kozhin/rails:7.1.3.3-prod \
		-f prod.Dockerfile \
		.
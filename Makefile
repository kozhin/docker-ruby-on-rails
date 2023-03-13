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
		--build-arg RUBY_VERSION="3.2.1" \
		--build-arg RAILS_VERSION="7.0.4.3" \
		--build-arg BUNDLER_VERSION="2.4.8" \
		--push \
		-t kozhin/rails:7.0.4.3-dev \
		-f dev.Dockerfile \
		.
#
# Builds and publishes base image for production
#
.PHONY: ror-prod
ror-prod:
	docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--build-arg RUBY_VERSION="3.2.1" \
		--build-arg RAILS_VERSION="7.0.4.3" \
		--build-arg BUNDLER_VERSION="2.4.8" \
		--build-arg NGINX_VERSION="1.22.1" \
		--build-arg PASSENGER_VERSION="6.0.17" \
		--push \
		-t kozhin/rails:7.0.4.3-prod \
		-f prod.Dockerfile \
		.

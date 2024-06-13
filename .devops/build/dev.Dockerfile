# Define arg variable for image
ARG RAILS_VERSION
ARG REPO_NAME

# Application image for development
FROM ${REPO_NAME}/rails:${RAILS_VERSION}-dev

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN PACKAGES="tzdata nodejs npm yarn" && \
    BUILD_PACKAGES="build-base" && \
    OPTIONAL_PACKAGES="postgresql-dev" && \
#
# Install packages
    apk add --no-cache --update ${PACKAGES} ${BUILD_PACKAGES} ${OPTIONAL_PACKAGES} && \
# Update gems
    gem update --system && \
# Install gems with bundler
    bundle install

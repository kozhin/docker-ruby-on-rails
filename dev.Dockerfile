# Define arg variable for image
ARG RUBY_VERSION

# Set initial image
FROM ruby:${RUBY_VERSION}-alpine

# Set maintainer and info for image
LABEL Description="This image contains Ruby language and Ruby on Rails framework for development" \
      Maintainer="Konstantin Kozhin <https://github.com/kozhin>" \
      Vendor="" \
      Version="1.0.1"

# Set versions for Bundler and Ruby on Rails
ARG RAILS_VERSION
ARG BUNDLER_VERSION
ENV RAILS_VERSION $RAILS_VERSION
ENV BUNDLER_VERSION $BUNDLER_VERSION

# Set env variables for the Bundler
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    PATH=/app/bin:$PATH

# Install Vim colors
RUN mkdir -p ./.vim/colors
COPY .vim/.vimrc ./
COPY .vim/monokai.vim ./.vim/colors

# Install Ruby on Rails
RUN PACKAGES="curl bash git" && \
    BUILD_PACKAGES="build-base libxml2-dev" && \
#
# For other useful packages checkout OPTIONAL_PACKAGES var
# Note: increases the final image size
#    OPTIONAL_PACKAGES="sqlite-dev postgresql-dev mariadb-dev mongodb-tools nodejs npm yarn" && \
#
# Install packages
    apk add --no-cache --update ${PACKAGES} ${BUILD_PACKAGES} ${OPTIONAL_PACKAGES} && \
# Update gems
    gem update --system && \
# Install gems
    gem install bundler:$BUNDLER_VERSION --no-document && \
    gem install rails:$RAILS_VERSION --no-document && \
# Clean up packages
    apk del ${BUILD_PACKAGES} && \
    rm -rf /var/cache/apk/* \
           /tmp/*

# Expose port
EXPOSE 3000

# Set entrypoint
CMD ["rails"]

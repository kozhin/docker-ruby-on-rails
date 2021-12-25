
# Ruby on Rails with Docker and Alpine Linux

One of the most popular frameworks for web-development - Ruby on Rails. Now fully in Docker for development and production deployments. Have fun!

## Building base images

Just install `make` and run from the repo folder:

```en
# Docker image for development
make build-ror-dev
# Docker image for production
make build-ror-prod
```

*Note:* in order to build production image, please, make sure your Docker app may get 4Gb of RAM.

## How to use

Once you have base images ready, you may build your an image for your application. Please, check `.devops` folder for examples. Basically, you will need to write your own Dockerfiles having base images specified with `FROM` instruction:

```en
# add to your Dockerfile
FROM <your docker registry URL>/rails:${VERSION}-dev
# or
FROM <your docker registry URL>rails:${VERSION}-prod
```

## Updating base images

In order to update base images change env variables in `Makefile` with proper versions of packages. Also you will need to rebuild your application images.

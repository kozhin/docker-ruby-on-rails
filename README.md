# Ruby on Rails with Alpine Linux

Project contains Ruby on Rails images. Every pair is available for development and production. In production we don't install Ruby on Rails. The framework is expected to be installed within a specific application.

See samples folder for more examples.

## Building images

If you want Ruby on Rails only application, use the following command to build images:

```en
docker build -t rails:latest-dev -f dev.Dockerfile .
docker build -t rails:latest-prod -f prod.Dockerfile .
```

## How to use in apps

```en
# add to your Dockerfile
FROM <your docker registry URL>/rails:latest-dev
# or
FROM <your docker registry URL>rails:latest-prod
```

## Updating images

In order to update images change env variables.

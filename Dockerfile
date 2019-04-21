FROM ruby:2.6-alpine AS build

RUN apk add --no-cache build-base busybox \
  ca-certificates curl git gnupg1 graphicsmagick \
  libffi-dev libsodium-dev nodejs openssh-client \
  postgresql-dev rsync

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/

RUN bundle install -j4 --retry 3 && \
  rm -rf /usr/local/bundle/bundler/gems/*/.git \
  /usr/local/bundle/cache/

COPY . /app/

FROM ruby:2.6-alpine

RUN apk add --no-cache busybox ca-certificates curl \
  gnupg1 graphicsmagick libsodium-dev \
  nodejs postgresql-dev rsync tzdata

RUN mkdir -p /app
WORKDIR /app

COPY --from=build /usr/local/bundle/ /usr/local/bundle/
COPY --from=build /app/ /app/

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
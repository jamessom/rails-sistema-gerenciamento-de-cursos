FROM ruby:2.6-alpine AS build

ENV APP_HOME /app
ENV BUNDLE_PATH ${APP_HOME}/.gems

RUN apk update && apk upgrade &&\
  apk --no-cache add build-base nodejs postgresql-dev git tzdata &&\
  rm -rf /var/cache/apk/*

RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}

COPY Gemfile* ${APP_HOME}/

RUN bundle install --jobs=10 --retry=3 --path=${BUNDLE_PATH} --clean && \
  rm -rf /usr/local/bundle/bundler/gems/*/.git \
  /usr/local/bundle/cache/

COPY . ${APP_HOME}

FROM ruby:2.6-alpine

RUN apk --no-cache add build-base nodejs postgresql-dev git tzdata

COPY --from=build /app/.gems/ ${BUNDLE_PATH}/
COPY --from=build /app/ ${APP_HOME}/

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
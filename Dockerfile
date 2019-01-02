FROM ruby:2.5.3-alpine

RUN    apk update                             \
    && apk add --no-cache --update alpine-sdk \
    && apk add --no-cache --update tzdata     \
    && apk add --no-cache                     \
       ca-certificates                        \
       curl                                   \
       libgcrypt-dev                          \
       libxslt-dev                            \
       libxml2-dev                            \
       nodejs                                 \
       libressl                               \
       libressl-dev                           \
       postgresql-client                      \
       postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle config build --use-system-libraries
RUN bundle install

ADD . /app

EXPOSE 3000

FROM ruby:2.5-alpine

RUN apk update && apk add build-base postgresql-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install && bundle exec rails db:migrate && bundle exec rails db:seed

COPY . .

MAINTAINER Joel AZEMAR <joel.azemar@gmail.com>

CMD puma -C config/puma.rb

FROM ruby:2.5-alpine

RUN apk update && apk add build-base postgresql-dev

WORKDIR /app

COPY . .
# Add app files into docker image

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "sh", "/docker-entrypoint.sh"]
# Add bundle entry point to handle bundle cache

ENV BUNDLE_PATH=/bundle \
    GEM_HOME=/bundle

MAINTAINER Joel AZEMAR <joel.azemar@gmail.com>

CMD [ "/bundle/bin/puma", "-C", "config/puma.rb" ]

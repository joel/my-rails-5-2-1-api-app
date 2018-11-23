#!/bin/bash
# Interpreter identifier

set -e
# Exit on fail

bundle check || bundle install
bundle exec rails db:migrate
bundle exec rails db:seed

exec "$@"
# Finally call command issued to the docker service
#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rake db:migrate
#bundle exec rails assets:precompile
#bundle exec rails assets:clean
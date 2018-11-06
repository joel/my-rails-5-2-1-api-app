https://joesasson.github.io/2017/03/24/setting-up-a-rails-app-with-rspec-and-postgres.html

rails new rails-5-2-1-api-sample-2 -T -d postgresql --api

rails generate rspec:install

bundle exec rails g scaffold Todo title:string

bundle exec rails g scaffold Item title:string done:boolean reference:todo

pg_ctl -D /usr/local/var/postgres start

bundle exec rails db:create
bundle exec rails db:migrate
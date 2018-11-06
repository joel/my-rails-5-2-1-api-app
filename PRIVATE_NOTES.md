https://joesasson.github.io/2017/03/24/setting-up-a-rails-app-with-rspec-and-postgres.html
https://blog.arkency.com/2014/10/how-to-start-using-uuid-in-activerecord-with-postgresql/

rails new rails-5-2-1-api-sample-2 -T -d postgresql --api

rails generate rspec:install

rails generate migration enable_pgcrypto_extension

bundle exec rails g scaffold Todo title:string owner:string

bundle exec rails g scaffold Item title:string done:boolean todo:references

pg_ctl -D /usr/local/var/postgres start

bundle exec rails db:create
bundle exec rails db:migrate

bundle exec rails db:drop
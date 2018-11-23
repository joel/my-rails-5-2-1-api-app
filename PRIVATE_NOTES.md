https://joesasson.github.io/2017/03/24/setting-up-a-rails-app-with-rspec-and-postgres.html
https://blog.arkency.com/2014/10/how-to-start-using-uuid-in-activerecord-with-postgresql/
https://lab.io/articles/2017/04/13/uuids-rails-5-1/
https://blog.codeship.com/building-a-json-api-with-rails-5/
https://medium.com/@jfroom/docker-compose-3-bundler-caching-in-dev-9ca1e49ac441

rails new my-rails-5-2-1-api-app -T -d postgresql --api

rails generate rspec:install

rails generate migration enable_pgcrypto_extension

bundle exec rails g scaffold Todo title:string owner:string
bundle exec rails g factory_bot:model Todo title:string owner:string
rails generate rspec:request todo
bin/rails g jsonapi:resource Todo title:string owner:string

bundle exec rails g scaffold Item title:string done:boolean todo:references
bundle exec rails g factory_bot:model Item title:string done:boolean todo:references 
rails generate rspec:request item
bin/rails g jsonapi:resource Item title:string done:boolean todo:references  

pg_ctl -D /usr/local/var/postgres start

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rails db:drop
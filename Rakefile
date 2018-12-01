# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

require 'rspec'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

ENV['LOG_LEVEL'] = 'info'

desc('Codestyle check and linter')
RuboCop::RakeTask.new('qa:code') do |task|
  task.options = ['--display-cop-names']
  task.fail_on_error = true
  task.patterns = [
    'lib/**/*.rb',
    'app/**/*.rb',
    'spec/*.rb',
    'spec/support/*.rb',
    'spec/**/*_spec.rb'
  ]
end

desc('Run CI QA tasks')
task(qa: ['qa:code'])

task(default: :qa)

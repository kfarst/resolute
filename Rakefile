# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require "cucumber/rake/task"

Resolute::Application.load_tasks

Cucumber::Rake::Task.new(:run) do |task|
  task.cucumber_opts = ["-t","@#{ENV["TAG"] || "all" }","features"]
end

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["-t","@compile","features"]
end

Cucumber::Rake::Task.new(:list) do |task|
  task.cucumber_opts = ["-d", "-f", "PrintNames", "-t","@#{ENV["TAG"] || "all" }","features"]
end


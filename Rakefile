#!/usr/bin/env rake
require 'rspec/core/rake_task'

namespace :db do
  task :migrate
  task :setup
end

desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = './spec/**/*_spec.rb'
  t.rspec_opts = ['--profile', '--color']
end

task :default => :spec

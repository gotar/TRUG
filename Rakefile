task :default => :spec

namespace :db do
  task :migrate
  task :setup
end

desc 'Run all specs'
task :spec do
  FileList["**/*_spec.rb"].each do |file|
    sh "bundle exec rspec -cp #{file}"
  end
end

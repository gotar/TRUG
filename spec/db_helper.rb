require_relative "spec_helper"

Trug::Container.boot!(:rom)

Dir[SPEC_ROOT.join("support/*.rb").to_s].each { |f| require f }
Dir[SPEC_ROOT.join("shared/*.rb").to_s].each { |f| require f }

require "database_cleaner"
DatabaseCleaner[:sequel, connection: Helpers.db_conn].strategy = :truncation

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.include Helpers
  config.around { |e| DatabaseCleaner.cleaning { e.run } }
end

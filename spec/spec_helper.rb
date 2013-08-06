require 'rspec'
require 'database_cleaner'
require 'railway_system'

RSpec.configure do |config|
  config.before(:suite) do
    RailwaySystem.initialize(:env => "test", :connect_to_db => true)

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
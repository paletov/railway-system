require 'rspec'
require 'database_cleaner'
require 'railway_system'

RSpec.configure do |config|
  config.before(:suite) do
    RailwaySystem.initialize(:env => "test", :connect_to_db => true)

    #DatabaseSeeder.seed
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
$:.unshift(File.join(File.dirname(__FILE__), '/entities/'))
$:.unshift(File.join(File.dirname(__FILE__), '/repositories/'))
$:.unshift(File.join(File.dirname(__FILE__), '/controllers/'))
$:.unshift(File.join(File.dirname(__FILE__), '/utils/'))
$:.unshift(File.join(File.dirname(__FILE__), '/utils/comparators/'))

require 'active_record'
require 'yaml'

class RailwaySystem
  class << self
    attr_reader :environment
    attr_reader :db_config

    def initialize(args = {})
      @environment = args[:env]
      establish_db_connection unless !args[:connect_to_db]
    end

    private

    def establish_db_connection
      load_db_config unless defined? @db_config
      ActiveRecord::Base.establish_connection(@db_config)
    end

    def load_db_config
      @db_config = YAML::load(File.open(File.expand_path(File.dirname(__FILE__) + '/../db/config.yml')))
      @db_config = @db_config[@environment]
    end
  end
end
require 'rake'
require 'yaml'

require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

task :style do
  opts = YAML.load_file('skeptic.yml')
    .map { |key, value| [key, (value == true ? nil : value)].compact }
    .map { |key, value| "--#{key.tr('_', '-')} #{value}".strip }
    .join(' ')

  librbfiles = File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')
  Dir.glob(librbfiles).each do |file|
    if !system("skeptic  #{opts} #{file}") then
      puts file
      exit(1)
    end
  end
end

require 'rspec/core'
require 'rspec/core/rake_task'

SPEC_SUITES = [
  { :id => :entities, :title => 'Entities test suite', :files => %w(spec/entities/**/*_spec.rb) },
  { :id => :controllers, :title => 'Controllers test suite', :files => %w(spec/controllers/**/*_spec.rb) },
  { :id => :utils, :title => 'Utils test suite', :files => %w(spec/utils/**/*_spec.rb) }
]

namespace :spec do
  namespace :suite do
    SPEC_SUITES.each do |suite|
      desc "Run all specs in #{suite[:title]} spec suite"
      RSpec::Core::RakeTask.new(suite[:id]) do |t|
        spec_files = []
        if suite[:files]
          suite[:files].each { |glob| spec_files += Dir[glob] }
        end

        if suite[:dirs]
          suite[:dirs].each { |glob| spec_files += Dir["#{glob}/**/*_spec.rb"] }
        end

        t.rspec_opts = ['--options', "\"#{Rails.root}/spec/spec.opts\""]
        t.pattern = spec_files
      end
    end
  end
end

task :build => ["spec:suite:entities", "spec:suite:utils", "spec:suite:controllers"]

task :default => :build
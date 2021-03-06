# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'faker'
require 'simplecov'
require 'coveralls'

SimpleCov.start
Coveralls.wear!

require 'rails_scopy'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'rails_scopy')

load File.dirname(__FILE__) + '/schema.rb'
require File.dirname(__FILE__) + '/models.rb'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

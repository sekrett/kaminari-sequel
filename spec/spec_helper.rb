# frozen_string_literal: true

require 'bundler/setup'
require 'sequel'
require 'sqlite3'
require 'active_support/deprecation'
require 'active_support/core_ext/class/subclasses'
Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }

require 'kaminari/sequel'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

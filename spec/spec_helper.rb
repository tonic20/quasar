require 'rubygems'
require 'spork'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
require 'shoulda/matchers'

Spork.prefork do
  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    
    # https://github.com/bmabey/database_cleaner/issues/115
    #
    # config.before :suite do
    #   DatabaseCleaner.strategy = :transaction
    #   DatabaseCleaner.clean_with :truncation
    # end
    
    # config.before :each do
    #    DatabaseCleaner.start
    # end
    
    # config.after :each do
    #   DatabaseCleaner.clear
    # end
  
  end
end

Spork.each_run do
end





ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "default"
  DatabaseCleaner.strategy = :truncation
  
  # config.before(:all) do
  #   load Rails.root + "db/seeds.rb"
  # end

  config.before(:all) do 
    FactoryGirl.reload
    4.times { FactoryGirl.create(:citizen) }
    5.times { FactoryGirl.create(:international) }
  end

  config.after(:all) do 
    DatabaseCleaner.clean
  end
end
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require 'database_cleaner'
require 'factory_girl'

class ActiveSupport::TestCase
  include Capybara
  Capybara.default_driver = :selenium

  @seed_file = File.join(Rails.root, 'db', 'seeds.rb')
  load(@seed_file) if File.exist?(@seed_file)

  DatabaseCleaner.strategy = :truncation, { :except => %w( categories users )} 

  def setup
    DatabaseCleaner.start
    @seed_file = File.join(Rails.root, 'db', 'seeds.rb')
    load(@seed_file) if File.exist?(@seed_file)

    DatabaseCleaner.strategy = :truncation, { :except => %w( categories users )} 
  end

  def teardown 
    DatabaseCleaner.clean
  end

  def login
    visit "/users/sign_in"
    fill_in "Email", :with => "farst.6@osu.edu"
    fill_in "Password", :with => "buckeyes44"
    click_button "Sign in"
    visit "/admin"
  end

  def logout
    click "Sign Out"
  end

  Factory.find_definitions
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...
end

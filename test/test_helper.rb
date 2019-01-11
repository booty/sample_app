ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # yuck.
  # same functionality as logged_in? helper, which isn't available during tests
  # surely there's a better way....
  def is_logged_in?
    !session[:user_id].nil?
  end
end

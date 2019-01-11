require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "users get logged the fuck out when they want" do
    delete logout_path
    follow_redirect!
    assert !is_logged_in?
  end
end
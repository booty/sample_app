# frozen_string_literal: true

require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test 'users get logged the fuck out when they want' do
    @user = users(:michael)
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }

    delete logout_path
    follow_redirect!
    assert !is_logged_in?
  end
end

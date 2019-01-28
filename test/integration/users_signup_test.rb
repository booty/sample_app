# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'invalid signup information is rejected' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'user@invalid', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
  end

  test 'valid signup information is cherished' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'abcdefg', email: 'abcdefg@example.com', password: '123456', password_confirmation: '123456' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
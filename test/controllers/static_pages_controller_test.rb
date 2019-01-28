# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get help' do
    get help_url
    assert_response :success
    assert_select 'title', 'Help | Sample App'
  end

  test 'should get about' do
    get about_url
    assert_response :success
    assert_select 'title', 'About | Sample App'
  end

  test 'should get contact' do
    get contact_url
    assert_response :success
    assert_select 'title', 'Contact | Sample App'
  end

  test 'root should get home' do
    get '/'
    assert_response :success
    assert_select 'title', 'Sample App'
  end
end

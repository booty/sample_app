require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name="   "
    assert_not @user.valid?
  end

  test "name should be unique" do
    user2 = User.new(name: @user.name.upcase, email: "user2@example.com")
    assert_not user2.valid?
  end

  test "name shouldn't be too long nor too short" do
    @user.name = "z" * 1000
    assert_not @user.valid?
    @user.name = "z"
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email=" "
    assert_not @user.valid?
  end

  test "email should be unique" do
    user2 = User.new(name: "Example User 2", email: @user.email.upcase)
    assert_not user2.valid?
  end

  test "email shouldn't be too long nor too short" do
    @user.email = "z" * 1000
    assert_not @user.valid?
    @user.email = "z"
    assert_not @user.valid?
  end

  test "valid email addresses should be accepted" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "bullshit email addresses should be rejected because come on lets be serious" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?, "#{invalid.inspect} should be rejected like the trash it is"
    end
  end
end

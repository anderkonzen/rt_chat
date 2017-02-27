require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: 'example', password: '123123')
  end

  def test_user_should_be_valid
    assert @user.valid?
  end

  def test_user_should_have_userame
    @user.username = ""
    assert_not @user.valid?
  end

  def test_username_should_be_unique
    dup_user = @user.dup
    dup_user.username.upcase!
    @user.save
    assert_not dup_user.valid?
  end

  def test_user_should_have_password
    @user.password = " " * 6
    assert_not @user.valid?
  end

  def test_password_should_have_minimum_length
    @user.password = "a" * 5
    assert_not @user.valid?
  end

end

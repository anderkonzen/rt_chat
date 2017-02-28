require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anderson)
  end
  
  test "should not get index when user not authenticated" do
    get messages_url
    assert_redirected_to login_url
  end

  test "should get index" do
    login_as @user
    get messages_url
    assert_response :success
  end

  def login_as(user, password: "password")
    post login_url, params: { session: { username: user.username,
                                         password: password } }
  end

end

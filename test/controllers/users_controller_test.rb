require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def test_should_get_new
    get signup_path
    assert_response :success
  end

end

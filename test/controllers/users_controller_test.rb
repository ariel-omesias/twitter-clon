require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get users_follow_url
    assert_response :success
  end

end

require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get auth_request_url
    assert_response :success
  end

  test "should get callback" do
    get auth_callback_url
    assert_response :success
  end
end

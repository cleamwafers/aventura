require "test_helper"

class User::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_homes_top_url
    assert_response :success
  end

  test "should get abput" do
    get user_homes_abput_url
    assert_response :success
  end
end

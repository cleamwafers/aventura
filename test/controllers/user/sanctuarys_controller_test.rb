require "test_helper"

class User::SanctuarysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_sanctuarys_index_url
    assert_response :success
  end

  test "should get show" do
    get user_sanctuarys_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_sanctuarys_edit_url
    assert_response :success
  end
end

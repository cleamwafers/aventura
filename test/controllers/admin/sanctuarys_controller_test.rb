require "test_helper"

class Admin::SanctuarysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sanctuarys_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_sanctuarys_show_url
    assert_response :success
  end
end

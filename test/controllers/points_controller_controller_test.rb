require 'test_helper'

class PointsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get points_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get points_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get points_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get points_controller_show_url
    assert_response :success
  end

end

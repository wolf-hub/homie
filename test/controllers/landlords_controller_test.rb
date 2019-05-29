require 'test_helper'

class LandlordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get landlords_new_url
    assert_response :success
  end

  test "should get create" do
    get landlords_create_url
    assert_response :success
  end

  test "should get update" do
    get landlords_update_url
    assert_response :success
  end

  test "should get edit" do
    get landlords_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get landlords_destroy_url
    assert_response :success
  end

  test "should get index" do
    get landlords_index_url
    assert_response :success
  end

  test "should get show" do
    get landlords_show_url
    assert_response :success
  end

end

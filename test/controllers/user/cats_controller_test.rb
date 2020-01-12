require 'test_helper'

class User::CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_cats_new_url
    assert_response :success
  end

  test "should get index" do
    get user_cats_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_cats_edit_url
    assert_response :success
  end

end

require 'test_helper'

class User::RemindersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_reminders_new_url
    assert_response :success
  end

  test "should get index" do
    get user_reminders_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_reminders_edit_url
    assert_response :success
  end

end

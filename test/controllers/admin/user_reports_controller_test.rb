require 'test_helper'

class Admin::UserReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_reports_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_reports_show_url
    assert_response :success
  end

end

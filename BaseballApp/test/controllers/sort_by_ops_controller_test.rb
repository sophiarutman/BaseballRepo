require "test_helper"

class SortByOpsControllerTest < ActionDispatch::IntegrationTest
  test "should get sortOPS" do
    get sort_by_ops_sortOPS_url
    assert_response :success
  end
end

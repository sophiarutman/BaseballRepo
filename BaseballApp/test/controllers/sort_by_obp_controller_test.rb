require "test_helper"

class SortByObpControllerTest < ActionDispatch::IntegrationTest
  test "should get sortOBP" do
    get sort_by_obp_sortOBP_url
    assert_response :success
  end
end

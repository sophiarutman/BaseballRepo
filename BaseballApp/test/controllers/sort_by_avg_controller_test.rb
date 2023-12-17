require "test_helper"

class SortByAvgControllerTest < ActionDispatch::IntegrationTest
  test "should get sortAVG" do
    get sort_by_avg_sortAVG_url
    assert_response :success
  end
end

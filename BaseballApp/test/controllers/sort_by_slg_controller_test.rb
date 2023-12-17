require "test_helper"

class SortBySlgControllerTest < ActionDispatch::IntegrationTest
  test "should get sortSLG" do
    get sort_by_slg_sortSLG_url
    assert_response :success
  end
end

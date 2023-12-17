require "test_helper"

class SortByNameControllerTest < ActionDispatch::IntegrationTest
  test "should get sort" do
    get sort_by_name_sort_url
    assert_response :success
  end
end

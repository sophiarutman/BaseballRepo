require "test_helper"

class SearchAppControllerTest < ActionDispatch::IntegrationTest
  test "should get #index" do
    get search_app_#index_url
    assert_response :success
  end
end

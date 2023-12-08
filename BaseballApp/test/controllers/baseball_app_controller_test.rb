require "test_helper"

class BaseballAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get baseball_app_index_url
    assert_response :success
  end
end
